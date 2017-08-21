//
//  EVSBaseController.h
//  英语短视频
//
//  Created by hspcadmin on 2017/8/21.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LX_CustomNavBarView.h"

@interface EVSBaseController : UIViewController

@property (nonatomic, copy) NSString *backText;
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *rightText;

@property (nonatomic, copy) NSString *leftImageName;
@property (nonatomic, copy) NSString *rightImageName;

@property (nonatomic, assign) BOOL hiddenNavBar;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) LX_CustomNavBarView *customNavBar;

- (void)setNavBarLeftViewWithImage:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action;
- (void)setNavBarLeftView:(UIView *)leftView withFrame:(CGRect)frame;

- (void)setNavBarRightView:(UIView *)rightView withFrame:(CGRect)frame;

- (void)setNavBarRightViewWithImage:(NSString *)imageName
                             target:(id)target
                             action:(SEL)action;

- (void)setNavBarRightViewWithBtnText:(NSString *)rightText
                            textColor:(UIColor *)textColor
                               target:(id)target
                               action:(SEL)action;

- (void)setNavBarTitleView:(UIView *)titleView withFrame:(CGRect)frame;

- (void)hiddenCustomNavBar:(BOOL)isHidden;
@end
