

//
//  EVSMineHeadDelegate.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#ifndef EVSMineHeadDelegate_h
#define EVSMineHeadDelegate_h



@protocol EVSMineHeadDelegate <NSObject>

@optional


/**
 我的头部登陆按钮点击

 @param button 按钮
 */
- (void)mineLoginHeadButtonClick:(UIButton *)button;


/**
 用户登陆后点击进入个人资料

 @param headView 成功登陆后的HeadView
 */
- (void)mineHeadViewDidTouched:(UIView *)headView;


/**
   点击头像
 */
- (void)mineHeadViewDidTouchedHeadImgView;


@end

#endif /* EVSMineHeadDelegate_h */
