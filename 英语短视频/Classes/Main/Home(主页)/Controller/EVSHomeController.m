//
//  EVSHomeController.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/21.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSHomeController.h"
#import "EVSMineController.h"
#import "EVSBaseListController.h"

@interface EVSHomeController ()

@end

@implementation EVSHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.customNavBar.hidden = YES;
    

    //获取分类
    [self loadTitleArrayFromService];
    
    
}

#pragma mark - 网络请求
- (void)loadTitleArrayFromService {
    
    NSArray *titleArray = @[@"热门",@"关注",@"搞笑",@"科技",@"音乐",@"励志",@"专题"];
    
    [self showProgressHUD];
    
    kweakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self hideHud];
        
        [weakSelf setCategoryTitleVC:titleArray];

        //设置导航栏
        [self setUpNavBar];

        
    });
    
}



-(void)setCategoryTitleVC:(NSArray*)resultModel{
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
//    CGFloat contentY = 0;
    
    EVSBaseListController *gzVC = [[EVSBaseListController alloc] init];
    gzVC.title = @"关注";
    gzVC.category=gzVC.title;
    [self addChildViewController:gzVC];
    
    
    for (NSString *model in resultModel) {
        EVSBaseListController *addVC = [[EVSBaseListController alloc] init];
        addVC.category=model;
        addVC.title = model;
        [self addChildViewController:addVC];
    }
    
    
//    [self setUpContentViewFrame:^(UIView *contentView) {
//        
//        CGFloat contentX = 44;
//        CGFloat contentH = SCREEN_HEIGHT - contentY;
//        contentView.frame = CGRectMake(contentX, contentY, SCREEN_WIDTH-88, contentH);
//        
//    }];
    
    [self setUpTitleGradient:^(YZTitleColorGradientStyle *titleColorGradientStyle, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor) {
        *norColor = LXrayColor(100);
        *selColor = [UIColor blackColor];
        
    }];
    
    [self setUpTitleScale:^(CGFloat *titleScale) {
        *titleScale=1.1;
    }];
    [self refreshDisplay];
    
//    [self.view bringSubviewToFront:self.customNavBar];
    
}

- (void)setUpNavBar {
    //左边的头像
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"首页-我的"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(homeControllerLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(0, 20, 44, 44);
    
    //右边的搜索
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"首页-搜索"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(homeControllerRightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(SCREEN_WIDTH-44, 20,44,44);

    [self.view addSubview:leftButton];
    
    [self.view addSubview:rightButton];
    
        
}


#pragma mark - leftActions
- (void)homeControllerLeftButtonClick {
    LXLogFunc;
    EVSMineController *mineVc = [EVSMineController evs_mineVc];
    [self.navigationController pushViewController:mineVc animated:YES];
}

- (void)homeControllerRightButtonClick {
    LXLogFunc;
}



@end
