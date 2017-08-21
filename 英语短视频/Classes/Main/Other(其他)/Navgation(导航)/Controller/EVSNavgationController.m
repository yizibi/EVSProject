//
//  EVSNavgationController.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/21.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSNavgationController.h"

@interface EVSNavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation EVSNavgationController

+ (instancetype)navigationController
{
    return [[self alloc] init];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
    
    self.interactivePopGestureRecognizer.delegate = self;
}


/**
 *  重写push方法
 */

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        
        // 左上角
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navgationBarBackBlack"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navgationBarBackBlack"] forState:UIControlStateHighlighted];
        /*
         //取消返回
         [backButton setTitle:@"返回" forState:UIControlStateNormal];
         [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
         */
        
        [backButton sizeToFit];
        // 这句代码放在sizeToFit后面
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:animated];
}



- (void)back
{
    [self popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
