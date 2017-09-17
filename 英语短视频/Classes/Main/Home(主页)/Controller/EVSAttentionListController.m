//
//  EVSAttentionListController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/16.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSAttentionListController.h"
#import "EVSUserInfoViewController.h"
#import "EVSFansOrAttentionCell.h"


@interface EVSAttentionListController ()<UITableViewDataSource,UITableViewDelegate,EVSFansOrAttentionCellDelegate>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation EVSAttentionListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpNavBar];
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - EVSFansOrAttentionCellDelegate
- (void)fansOrAttentionCellDidSeledtedAttentionButton:(UIButton *)attentionButton {
    LXLog(@"关注");
    
}

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVSFansOrAttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:EVSFansOrAttentionCellID];
    cell.delegate = self;
    cell.attentionType = attentionUserType;
    if (indexPath.row == 0) {
        cell.attentionType = attentionHaveType;
    }
    if (indexPath.row == 1) {
        cell.attentionType = attentionEachotherType;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EVSUserInfoViewController *userInfoVC = [[EVSUserInfoViewController alloc] init];
    [self.navigationController pushViewController:userInfoVC animated:YES];
}



- (void)setUpNavBar {
    self.titleText = @"TA的关注";
    self.backText = @"";
}


- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _tableView.separatorColor = kUIColorFromRGB(0xE6E6E6);
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 77;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        //注册cell
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([EVSFansOrAttentionCell class]) bundle:nil] forCellReuseIdentifier:EVSFansOrAttentionCellID];
        
        
    }
    
    return _tableView;
}


@end
