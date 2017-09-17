//
//  EVSUserInfoHeadView.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/16.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>


@class EVSUserInfoHeadView;

@protocol EVSUserInfoHeadViewDelegate <NSObject>

- (void)userInfoHeadViewDidTouchVideoView;
- (void)userInfoHeadViewDidTouchFansView;
- (void)userInfoHeadViewDidTouchAttentionView;


@end

@interface EVSUserInfoHeadView : UIView

/** 代理  */
@property (nonatomic,weak) id<EVSUserInfoHeadViewDelegate> delegate;

/** 用户类型 */
@property (nonatomic, assign) userType userType;

@end
