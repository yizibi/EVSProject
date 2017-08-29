
//
//  EVSMineController.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/22.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSMineController.h"
#import "EVS_MineCell.h"

#import "EVSMineHeadView.h"
#import "EVSUserLoginView.h"
#import "EVSUserAlreadyLoginView.h"
#import "EVSMineHeadDelegate.h"


static NSString * const mineCellID = @"mineCellID";

@interface EVSMineController ()<UITableViewDelegate,UITableViewDataSource,EVSMineHeadDelegate>


/** headerView */
@property (nonatomic, strong) EVSMineHeadView *headView;

/** backButton */
@property (nonatomic, strong) UIButton  *backButton;
/** seting */
@property (nonatomic, strong) UIButton *setingButton;
/** view */
@property (nonatomic, strong) UIView *navBar;

/** tableView */
@property (nonatomic, strong) UITableView *mineTableView;


/** 分类数组 */
@property (nonatomic, strong) NSArray *classityarray;
@end

@implementation EVSMineController


+ (instancetype)evs_mineVc {
    return [[self alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.mineTableView];
    
    [self setUpNavBar];

    self.classityarray = @[@"上传视频",
                           @"消息通知",
                           @"收藏",
                           @"下载",
                           @"关注",
                           @"历史观看",
                           @"意见反馈"];

    
    
}


#pragma mark - EVSMineHeadDelegate
- (void)mineLoginHeadButtonClick:(UIButton *)button{
    LXLogFunc;
}

- (void)mineHeadViewDidTouched:(UIView *)headView{
    LXLogFunc;
}


#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0)  return 5;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVS_MineCell *cell = [tableView dequeueReusableCellWithIdentifier:mineCellID];
    
    if (indexPath.section == 0) {
        cell.classifyLable.text = self.classityarray[indexPath.row];
        /* 隐藏图片
        NSString *imgStr = self.signArray[indexPath.row];
        cell.leftImageView.image = [UIImage imageNamed:imgStr];
         */
        
    }
    else if (indexPath.section == 1){
        cell.classifyLable.text = self.classityarray[indexPath.row+5];
        /*
        NSString *imgStr = self.signArray[indexPath.row+4];
        cell.leftImageView.image = [UIImage imageNamed:imgStr];
         */
        
    }
    
    else if (indexPath.section == 2){
        cell.classifyLable.text = self.classityarray[indexPath.row+6];
        /*
         NSString *imgStr = self.signArray[indexPath.row+4];
         cell.leftImageView.image = [UIImage imageNamed:imgStr];
         */
        
    }
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}



- (void)setUpNavBar{
    //需要自定义
    [self setHiddenNavBar:YES];
    
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.setingButton];

    
}

#pragma mark - acrions
- (void)setButtonClicked{
    LXLogFunc;
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

- (UIButton *)setingButton{
    if (!_setingButton) {
        _setingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_setingButton setImage:[UIImage imageNamed:@"my_ico_settings"] forState:UIControlStateNormal];
        [_setingButton setImage:[UIImage imageNamed:@"my_ico_settings"] forState:UIControlStateHighlighted];
        [_setingButton addTarget:self action:@selector(setButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        _setingButton.frame = CGRectMake(SCREEN_WIDTH-44, 20, 44, 44);
        
    }
    return _setingButton;
}

- (UIView *)navBar{
    if (!_navBar) {
        _navBar = [[UIView alloc] init];
        _navBar.backgroundColor = [UIColor whiteColor];
        _navBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    }
    return _navBar;
}

- (UITableView *)mineTableView
{
    if (!_mineTableView) {
        _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-40*Y_HeightScale) style:UITableViewStyleGrouped];
        _headView = [[EVSMineHeadView alloc] init];
        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
        _headView.loginView.delegate = self;
        _headView.alreadyView.delegate = self;
        self.headView = _headView;
//
        _mineTableView.tableHeaderView = self.headView;
//
        _mineTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _mineTableView.separatorColor = LXTableSeprateLineColor;
//        _mineTableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
        _mineTableView.delegate = self;
        _mineTableView.dataSource = self;
        _mineTableView.sectionFooterHeight = 1.0;
        self.automaticallyAdjustsScrollViewInsets = NO;
        _mineTableView.rowHeight = 45;
        
        //注册cell
        [_mineTableView registerClass:[EVS_MineCell class] forCellReuseIdentifier:mineCellID];
        
        
    }
    return _mineTableView;
}



@end
