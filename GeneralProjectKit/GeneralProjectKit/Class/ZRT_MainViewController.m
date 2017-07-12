//
//  ZRT_MainViewController.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/12.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "ZRT_MainViewController.h"

@interface ZRT_MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZRT_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [self tableViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tabledatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identiter = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identiter];
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据ROW:%ld",indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}
@end
