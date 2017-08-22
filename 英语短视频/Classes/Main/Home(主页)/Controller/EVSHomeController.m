//
//  EVSHomeController.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/21.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSHomeController.h"
#import "EVSMineController.h"

@interface EVSHomeController ()

@end

@implementation EVSHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBar];
    
    
    
}

- (void)setUpNavBar {
    self.titleText = @"主页";
    //左边的头像
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"头像" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [leftButton addTarget:self action:@selector(homeControllerLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self setNavBarLeftView:leftButton withFrame:CGRectMake(10, 0, 44, 44)];
    
}

#pragma mark - leftActions
- (void)homeControllerLeftButtonClick {
    LXLogFunc;
    EVSMineController *mineVc = [EVSMineController evs_mineVc];
    [self.navigationController pushViewController:mineVc animated:YES];
}





@end
