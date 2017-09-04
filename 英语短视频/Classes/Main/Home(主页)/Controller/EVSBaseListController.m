
//
//  EVSBaseListController.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSBaseListController.h"
#import "YZDisplayViewHeader.h"
#import "EVSHomeVideoCell.h"
#import "LXShareView.h"
#import "LXShareItem.h"

@interface EVSBaseListController ()<UITableViewDelegate,UITableViewDataSource,EVSHomeVideoCellDelegate>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *shareArray;
@property(nonatomic, strong) NSMutableArray *functionArray;
@end


@implementation EVSBaseListController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.customNavBar.hidden = YES;

    self.view.backgroundColor = LXUIRandomColor;
    
    [self.view addSubview:self.tableView];
    
    
    /****滚动完成请求数据*******/
    
    // 如果想要滚动完成或者标题点击的时候，加载数据，需要监听通知
    
    // 监听滚动完成或者点击标题，只要滚动完成，当前控制器就会发出通知
    
    // 只需要监听自己发出的，不需要监听所有对象发出的通知，否则会导致一个控制器发出，所有控制器都能监听,造成所有控制器请求数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:YZDisplayViewClickOrScrollDidFinshNote object:self];

}


- (void)loadData{
    
    [self showProgressHUD];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHud];
        
        [self.tableView reloadData];
        
    });
}

- (void)dealloc{
    [EVS_NotificationCenter removeObserver:self];
}


#pragma mark - EVSHomeVideoCellDelegate
- (void)homeVideoCell:(EVSHomeVideoCell *)videoCell didSelectButton:(UIButton *)button indexPath:(NSIndexPath *)indexPath {
    
    switch (button.tag) {
        case videoMoreButtonClicKPlayType:
        {
            LXLog(@"播放");LXLog(@"第%lu行",indexPath.row);
            
        }
            break;
            
        case videoMoreButtonClicKLikeType:
        {
            LXLog(@"收藏");LXLog(@"第%lu行",indexPath.row);

            button.selected = !button.selected;
        }
            break;
            
        case videoMoreButtonClicKCommentType:
        {
            LXLog(@"评论");LXLog(@"第%lu行",indexPath.row);

        }
            break;
        case videoMoreButtonClicKShareType:
        {
            LXLog(@"分享");LXLog(@"第%lu行",indexPath.row);
            [self showShareView];
            
        }
            break;
        case videoMoreButtonClicKMoreType:
        {
            LXLog(@"更多");LXLog(@"第%lu行",indexPath.row);
            [self showShareMoreView];
        }
            break;
            
        default:
            break;
    }

}

- (void)homeVideoCell:(EVSHomeVideoCell *)videoCell didClickedHeadImg:(UITapGestureRecognizer *)tap indexPath:(NSIndexPath *)indexPath{
    LXLog(@"点击了头像____第%lu行",indexPath.row);
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVSHomeVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:EVSHomeVideoCellID];
    cell.delegate = self;
    cell.indexPath = indexPath;
    return cell;
}



#pragma mark - lazyUI 

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


- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 220 *Y_HeightScale;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        //注册cell
        [_tableView registerClass:[EVSHomeVideoCell class] forCellReuseIdentifier:EVSHomeVideoCellID];
        
    }
    
    return _tableView;
}

#pragma mark - 测试分享
//添加分享的内容
- (LXShareView *)addShareContent:(LXShareView *)shareView{
    [shareView addText:@"分享测试"];
    [shareView addURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [shareView addImage:[UIImage imageNamed:@"share_alipay"]];
    
    return shareView;
}

@end
