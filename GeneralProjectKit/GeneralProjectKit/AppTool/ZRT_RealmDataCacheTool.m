//
//  ZRT_RealmDataCacheTool.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/14.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "ZRT_RealmDataCacheTool.h"

@interface ZRT_RealmDataCacheTool ()
@property (strong, nonatomic) NSString *filePath;
@end

@implementation ZRT_RealmDataCacheTool
+ (instancetype)manager {
    static ZRT_RealmDataCacheTool *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZRT_RealmDataCacheTool alloc] init];
    });
    return manager;
}
- (NSString *)filePath
{
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return pathArr.firstObject;
}
- (void)saveDataWithModelArray:(NSArray *)array realmName:(NSString *)realmName class:(NSString *)className
{
    //每次修改的时候都重新获取该线程中的数据库对象，就可以解决多线程访问问题了
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        //得到对应的数据库路径
        NSString *path = [_filePath stringByAppendingPathComponent:realmName];
        RLMRealm *rLMRealm = [RLMRealm realmWithURL:[NSURL URLWithString:path]];
        [rLMRealm beginWriteTransaction];
        
        RLMResults *rlmResults = [NSClassFromString(className) objectsInRealm:rLMRealm withPredicate:nil];
        
        while (rlmResults.count)
            [rLMRealm deleteObject:rlmResults.firstObject];
        for (NSObject *obj in array) {
            [NSClassFromString(className) createOrUpdateInRealm:rLMRealm withValue:obj];
        }
        [rLMRealm commitWriteTransaction:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                XWAlerLoginView *alert = [[XWAlerLoginView alloc] initWithTitle:error.description];
                [alert show];
                NSLog(@"error:%@",error);
            }else{
                NSLog(@"realm保存数据成功");
            }
        });

    });
}
- (void)readDataWithRealmName:(NSString *)realmName class:(NSString *)className complete:(void (^)(NSMutableArray *responseObject))complete
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error;
        NSMutableArray *dataArray = [@[] mutableCopy];
        NSString *path = [_filePath stringByAppendingPathComponent:realmName];
        RLMRealm *rLMRealm = [RLMRealm realmWithURL:[NSURL URLWithString:path]];
        [rLMRealm beginWriteTransaction];
        
        RLMResults *rlmResults = [NSClassFromString(className) objectsInRealm:rLMRealm withPredicate:nil];
        for (int index = 0; index<rlmResults.count; index++) {
            RLMObject *obj  = [rlmResults objectAtIndex:index];
            [dataArray addObject:[obj deepCopy]];
        }
        [rLMRealm commitWriteTransaction:&error];
        

        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                XWAlerLoginView *alert = [[XWAlerLoginView alloc] initWithTitle:error.description];
                [alert show];
                NSLog(@"error:%@",error);
            }
            //回调数据
            if (complete) {
                complete(dataArray);
            }
            
        });
    });
}
//创建数据库观察者
- (RBQFetchedResultsController*)createUserFetchedResultsControllerWithRealmName:(NSString *)realmName className:(NSString *)className
{
    NSString *path = [_filePath stringByAppendingPathComponent:realmName];
    RLMRealm *rLMRealm = [RLMRealm realmWithURL:[NSURL URLWithString:path]];
    RBQFetchedResultsController *fetchedResultsController = nil;
    RBQFetchRequest *fetchRequest = [RBQFetchRequest fetchRequestWithEntityName:className inRealm:rLMRealm predicate:nil];
    fetchedResultsController = [[RBQFetchedResultsController alloc] initWithFetchRequest:fetchRequest sectionNameKeyPath:nil cacheName:nil];
    [fetchedResultsController performFetch];
    return fetchedResultsController;
}
@end
