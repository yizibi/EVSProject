//
//  EVSUserAlreadyLoginView.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVSMineHeadDelegate.h"

@interface EVSUserAlreadyLoginView : UIView<EVSMineHeadDelegate>

/** 代理  */
@property (nonatomic,weak) id<EVSMineHeadDelegate> delegate;


@end
