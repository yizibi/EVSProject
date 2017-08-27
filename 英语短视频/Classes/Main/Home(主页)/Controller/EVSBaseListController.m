
//
//  EVSBaseListController.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSBaseListController.h"

@interface EVSBaseListController ()

@end

@implementation EVSBaseListController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.customNavBar.hidden = YES;

    self.view.backgroundColor = LXUIRandomColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
