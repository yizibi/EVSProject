//
//  EVSPlayVideoDetailController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/5.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSPlayVideoDetailController.h"
#import "EVSVideoInfoTitleCell.h"
#import "EVSRecommendVideoCell.h"

static NSString *const EVSVideoInfoTitleCellID = @"EVSVideoInfoTitleCellID";
static NSString *const EVSRecommendVideoCellID = @"EVSRecommendVideoCellID";
@interface EVSPlayVideoDetailController ()<UITableViewDelegate,UITableViewDataSource>

/** 播放器 */
@property (nonatomic, strong) UIView *playView;

/** backButton */
@property (nonatomic, strong) UIButton  *backButton;
/** view */
@property (nonatomic, strong) UIView *navBar;

/** tableView */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation EVSPlayVideoDetailController


+ (instancetype)playVideoDetailVC {
    return [[self alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];

    [self setUpNavBar];

}



#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        //标题
        return 1;
    }
    else if (section == 1) {
        //推荐
        return 2;
    }
    else if (section == 2) {
        //评论
        return 10;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        EVSVideoInfoTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:EVSVideoInfoTitleCellID];
        return titleCell;
    }
    
    else if (indexPath.section == 1) {
        EVSRecommendVideoCell *recommendCell = [tableView dequeueReusableCellWithIdentifier:EVSRecommendVideoCellID];
        return recommendCell;
    }
    
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.textLabel.text = @"adfa";
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 135*Y_HeightScale;
    }
    else if (indexPath.section == 1) {
        return 105;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
   
    return 0.00001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0001;
    }
    else if (section == 1){
        return 44;
    }
    return 0.0001;
}

#pragma mark - UI

- (void)setUpNavBar{
    //需要自定义
    [self setHiddenNavBar:YES];
    
    [self.view addSubview:self.playView];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.backButton];
    
    
}


- (void)backButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - lazyUI
- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"navgationBarBackBlack"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"navgationBarBackBlack"] forState:UIControlStateHighlighted];
        [_backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _backButton.frame = CGRectMake(0, 20, 44, 44);
    }
    return _backButton;
}

- (UIView *)navBar{
    if (!_navBar) {
        _navBar = [[UIView alloc] init];
        _navBar.backgroundColor = [UIColor clearColor];
        _navBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    }
    return _navBar;
}

- (UIView *)playView {
    if (!_playView) {
        _playView = [[UIView alloc] init];
        _playView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
        _playView.backgroundColor = LXUIRandomColor;
    }
    return _playView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT-44*Y_HeightScale-200) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        self.automaticallyAdjustsScrollViewInsets = NO;

        [_tableView registerClass:[EVSVideoInfoTitleCell class] forCellReuseIdentifier:EVSVideoInfoTitleCellID];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([EVSRecommendVideoCell class]) bundle:nil] forCellReuseIdentifier:EVSRecommendVideoCellID];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableView;
}

@end
