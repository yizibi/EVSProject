//
//  LX_CustomNavBarView.h
//  木言
//
//  Created by 李lucy on 16/6/6.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define STATSU_BAR_HEIGHT                       20
#define CUSTOM_NAVBAR_HEIGHT                    64
#define CUSTOM_NAVBAR_CONTENT_HEIGHT            44
#define CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH 70

@protocol LX_CustomNavBarViewDelegate <NSObject>
@optional
- (void)backController;
@end

@interface LX_CustomNavBarView : UIView
@property (nonatomic, weak) UIViewController *parentController;
@property (nonatomic, weak)id<LX_CustomNavBarViewDelegate> backDelegate;
@property (nonatomic, strong) UIView  *titleView;

/** 返回按钮说明文字 */
@property (nonatomic, readonly)UILabel *backBtnLabel;
@property (nonatomic, assign) BOOL hiddenLeftView;
@property (nonatomic, assign) BOOL hiddenRightView;
@property (nonatomic, assign) BOOL hiddenTitleView;

+ (instancetype)customNavBarView;

- (CGRect)getLeftViewSize;
- (CGRect)getRightViewSize;
- (CGRect)getTitleviewBounds;

#pragma mark - 设置左侧控件
- (void)setNavBarBackBtnText:(NSString *)backText;
- (void)setNavBarBackBtnText:(NSString *)backText withFrame:(CGRect)frame;

- (void)setNavBarLeftView:(UIView *)leftView;
- (void)setNavBarLeftView:(UIView *)leftView withFrame:(CGRect)frame;

#pragma mark - 设置右侧控件
- (void)setNavBarRightView:(UIView *)rightView;
- (void)setNavBarRightView:(UIView *)rightView withFrame:(CGRect)frame;

#pragma mark - 设置标题
- (void)setNavBarTitle:(NSString *)title;
- (void)setNavBarTitleView:(UIView *)titleView;
- (void)setNavBarTitleView:(UIView *)titleView withFrame:(CGRect)frame;
@end
