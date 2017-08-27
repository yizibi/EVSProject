//
//  EVSMineHeadView.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVSUserLoginView.h"
#import "EVSUserAlreadyLoginView.h"


@interface EVSMineHeadView : UIView


/** 登陆view */
@property (nonatomic, strong) EVSUserLoginView *loginView;

/** 已经登陆View */
@property (nonatomic, strong) EVSUserAlreadyLoginView *alreadyView;


@end
