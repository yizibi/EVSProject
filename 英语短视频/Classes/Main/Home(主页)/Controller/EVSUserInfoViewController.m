
//
//  EVSUserInfoViewController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/15.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSUserInfoViewController.h"
#import "EVSUserInfoVideoCell.h"
#import "EVSPlayVideoDetailController.h"
#import "EVSUserInfoHeadView.h"
#import "LXShareView.h"
#import "LXShareItem.h"
#import "EVSFansListController.h"
#import "EVSAttentionListController.h"
#import "EVSUserVideoListController.h"
#import "LX_Actionsheet.h"

static NSString *const EVSUserInfoVideoCellID = @"EVSUserInfoVideoCellID";
@interface EVSUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource,EVSUserInfoVideoCellDelegate,EVSUserInfoHeadViewDelegate,LX_ActionsheetDelegate>

/** head */
@property (nonatomic, strong) EVSUserInfoHeadView *headView;
/** tableView */
@property (nonatomic, strong) UITableView *tableView;


@property(nonatomic, strong) NSMutableArray *shareArray;
@property(nonatomic, strong) NSMutableArray *functionArray;
@end

@implementation EVSUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBar];
    
    [self.view addSubview:self.tableView];

}


#pragma mark - name

- (void)actionsheet:(LX_Actionsheet *)actionsheet didClickButtonIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        //分享
        [self showShareView];
    }
    else if (buttonIndex == 1) {
        //删除
        
    }
    
}



#pragma mark - EVSUserInfoVideoCellDelegate
- (void)userInfoVideoCell:(EVSUserInfoVideoCell *)videoCell didSelectMoreButton:(UIButton *)button {
    if (self.userType == userTypeSelf) {
        //自己
        LX_Actionsheet *acctionSheet = [LX_Actionsheet sheetWithTitle:nil buttonTitles:@[@"分享",@"删除"] redButtonIndex:-1 delegate:self];
        [acctionSheet show];

    }
    else {
        
        [self showShareMoreView];
    }
}

#pragma mark - EVSUserInfoHeadViewDelegate
- (void)userInfoHeadViewDidTouchVideoView {
    LXLog(@"视频");
    EVSUserVideoListController *videoListVC = [[EVSUserVideoListController alloc] init];
    [self.navigationController pushViewController:videoListVC animated:YES];
}

- (void)userInfoHeadViewDidTouchFansView {
    EVSFansListController *fansListVC = [[EVSFansListController alloc] init];
    [self.navigationController pushViewController:fansListVC animated:YES];
}

- (void)userInfoHeadViewDidTouchAttentionView {
    EVSAttentionListController *attentionListVC = [[EVSAttentionListController alloc] init];
    [self.navigationController pushViewController:attentionListVC animated:YES];
}


#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVSUserInfoVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:EVSUserInfoVideoCellID];
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EVSPlayVideoDetailController *playVideoVC = [EVSPlayVideoDetailController playVideoDetailVC];
    [self.navigationController pushViewController:playVideoVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = kUIColorFromRGB(0XF5F5F5);
    return view;
}
#pragma mark - actions
- (void)rightButtonClick:(id)sender {
    LXLog(@"分享");
    [self showShareView];
    
}


#pragma mark - 分享
- (void)showShareView {
    LXShareView *shareView = [[LXShareView alloc] initWithItems:self.shareArray itemSize:CGSizeMake((SCREEN_WIDTH-(self.shareArray.count)*30)/(self.shareArray.count),100) DisplayLine:YES];
    shareView.bodyViewEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    shareView.containViewColor = LXrayColor(235);
    shareView = [self addShareContent:shareView];
    shareView.itemSpace = 20;
    [shareView showFromControlle:self];
    
}

- (void)showShareMoreView {
    LXShareView *shareView = [[LXShareView alloc] initWithShareItems:self.shareArray functionItems:self.functionArray itemSize:CGSizeMake((SCREEN_WIDTH-(self.shareArray.count)*30)/(self.shareArray.count),100)];
    shareView.bodyViewEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    shareView.containViewColor = LXrayColor(235);
    shareView.middleLineColor = kUIColor(77, 77, 77, 0.8);
    shareView.middleLineEdgeSpace = -30;
    shareView.middleTopSpace = 15;
    shareView.middleBottomSpace = 0;
    shareView = [self addShareContent:shareView];
    shareView.itemSpace = 20;
    [shareView showFromControlle:self];
    
}


- (NSMutableArray *)shareArray{
    if (!_shareArray) {
        _shareArray = [NSMutableArray array];
        [_shareArray addObject:LXPlatformNameWechat];
        [_shareArray addObject:LXPlatformNameWechatCircle];
        [_shareArray addObject:LXPlatformNameQQ];
        [_shareArray addObject:LXPlatformNameQQCircle];
    }
    return _shareArray;
}

- (NSMutableArray *)functionArray{
    if (!_functionArray) {
        _functionArray = [NSMutableArray array];
        [_functionArray addObject:[[LXShareItem alloc] initWithImage:[UIImage imageNamed:@"function_delete"] title:@"不感兴趣" action:^(LXShareItem *item) {
            ALERT_MSG(@"提示",@"不感兴趣",self);
        }]];
        
        [_functionArray addObject:[[LXShareItem alloc] initWithImage:[UIImage imageNamed:@"function_download"] title:@"下载" action:^(LXShareItem *item) {
            ALERT_MSG(@"提示",@"点击了下载",self);
        }]];
        
        [_functionArray addObject:[[LXShareItem alloc] initWithImage:[UIImage imageNamed:@"function_collection"] title:@"关注作者" action:^(LXShareItem *item) {
            ALERT_MSG(@"提示",@"点击了关注作者",self);
        }]];
        [_functionArray addObject:[[LXShareItem alloc] initWithImage:[UIImage imageNamed:@"function_expose"] title:@"举报" action:^(LXShareItem *item) {
            ALERT_MSG(@"提示",@"点击了举报",self);
        }]];
        
        
    }
    return _functionArray;
}

#pragma mark - 测试分享
//添加分享的内容
- (LXShareView *)addShareContent:(LXShareView *)shareView{
    [shareView addText:@"分享测试"];
    [shareView addURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [shareView addImage:[UIImage imageNamed:@"share_alipay"]];
    
    return shareView;
}

- (void)setUpNavBar {
    
    self.titleText = @"";
    self.backText = @"";
    [self setNavBarRightViewWithImage:@"home_shareButton_icon" target:self action:@selector(rightButtonClick:)];
    self.customNavBar.hiddenBottomLine = YES;
}


- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        
        _tableView.tableHeaderView = self.headView;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _tableView.separatorColor = kUIColorFromRGB(0xE6E6E6);
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 110;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        //注册cell
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([EVSUserInfoVideoCell class]) bundle:nil] forCellReuseIdentifier:EVSUserInfoVideoCellID];
        
        
    }
    
    return _tableView;
}

- (EVSUserInfoHeadView *)headView {
    if (!_headView) {
        _headView = [[EVSUserInfoHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
        _headView.backgroundColor = [UIColor whiteColor];
        _headView.delegate = self;
        _headView.userType = self.userType;
    }
    return _headView;
}


@end
