//
//  ZRTRootViewController.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "ZRTRootViewController.h"
#import <UShareUI/UShareUI.h>

@interface ZRTRootViewController ()
/**
 *  持有模型对象
 */
@property (strong,nonatomic)Model *model;
@end
@implementation Model

/**
 *  懒加载
 */
-(NSMutableArray *)modelArray{
    if(!_modelArray){
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

@end

static void *dataArrayContext = &dataArrayContext;

@implementation ZRTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [Model new];
    
    [_model addObserver:self forKeyPath:@"modelArray" options:NSKeyValueObservingOptionNew context:&dataArrayContext];
}
#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(__unused id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if(context == &dataArrayContext) {
        
        NSInteger newCount = [change[NSKeyValueChangeNewKey] count];
        if (newCount == 0) {
            [self showTableViewWithNoDataWithClick:nil];
        }else{
            [self removeTableViewNoData];
        }
        
        RTLog(@"%ld",_model.modelArray.count);
    }
}
- (void)dealloc
{
    [_model removeObserver:self forKeyPath:@"modelArray" context:&dataArrayContext];
}
#pragma mark - 文字弹窗
- (void)showTipsWithTitle:(NSString *)title
{
    XWAlerLoginView *alert = [[XWAlerLoginView alloc] initWithTitle:title];
    [alert show];
}
#pragma mark - 友盟分享API
- (void)shareUrl:(NSString *)url andTitle:(NSString *)title andDescr:(NSString *)descr andThumbImage:(NSString *)imageUrl
{
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine),@(UMSocialPlatformType_Sms),@(UMSocialPlatformType_Email)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareWebPageToPlatformType:platformType url:url andTitle:title andDescr:descr andThumbImage:imageUrl];
    }];
}
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType url:(NSString *)url andTitle:(NSString *)title andDescr:(NSString *)descr andThumbImage:(NSString *)imageUrl
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    NSString* thumbImageURL = imageUrl;
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:thumbImageURL];
    //设置网页地址
    shareObject.webpageUrl = url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
            [self showTipsWithTitle:error.description];
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                [self showTipsWithTitle:resp.message];
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
    }];
}
#pragma mark - 登录弹窗
- (void)goLogin
{
    ZRTRootViewController *login = [[ZRTRootViewController alloc]init];
    [[AppDelegate rootNavigationController] pushViewController:login animated:YES];
}
#pragma mark tableView无数据状态方法
- (void)showTableViewWithNoDataWithClick:(void (^)())clickNoDataIcon
{
    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            [[BJNoDataView shareNoDataView] showCenterWithSuperView:obj icon:nil iconClicked:^{
                //图片点击回调
                if (clickNoDataIcon) {
                    clickNoDataIcon();
                }
            }];
        }
    }];

}
- (void)removeTableViewNoData
{
    [[BJNoDataView shareNoDataView] clear];
}
#pragma mark - 数据添加数据方法
- (NSMutableArray *)addObject:(id)object
{
    [[_model mutableArrayValueForKeyPath:@"modelArray"] addObject:object];
    return _model.modelArray;
}
- (NSMutableArray *)addObjectFromArray:(NSArray *)array
{
    [[_model mutableArrayValueForKeyPath:@"modelArray"] addObjectsFromArray:array];
    return _model.modelArray;
}
@end
