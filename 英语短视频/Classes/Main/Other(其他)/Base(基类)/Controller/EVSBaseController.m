
//
//  EVSBaseController.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/21.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSBaseController.h"


@interface EVSBaseController ()<LX_CustomNavBarViewDelegate>


@end

@implementation EVSBaseController


- (BOOL)prefersStatusBarHidden {
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = LXrayColor(247);
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.customNavBar];
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_customNavBar && !_customNavBar.hidden) {
        [self.view bringSubviewToFront:_customNavBar];
    }
}

#pragma mark - interface
- (void)setNavBarRightView:(UIView *)rightView withFrame:(CGRect)frame{
    _rightView = rightView;
    [self.customNavBar setNavBarRightView:_rightView withFrame:frame];
}
- (void)setNavBarLeftView:(UIView *)leftView withFrame:(CGRect)frame{
    _leftView = leftView;
    [self.customNavBar setNavBarLeftView:_leftView withFrame:frame];
}
- (void)setNavBarTitleView:(UIView *)titleView withFrame:(CGRect)frame{
    _titleView = titleView;
    [self.customNavBar setNavBarTitleView:_titleView withFrame:frame];
}

- (void)hiddenCustomNavBar:(BOOL)isHidden{
    self.customNavBar.hidden = isHidden;
}

- (void)setNavBarLeftViewWithImage:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action{
    _leftImageName = imageName;
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.contentMode = UIViewContentModeScaleAspectFit;
    leftBtn.adjustsImageWhenHighlighted = NO;
    [leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.customNavBar setNavBarLeftView:leftBtn withFrame:CGRectMake(0, 0, CUSTOM_NAVBAR_CONTENT_HEIGHT, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
}

- (void)setNavBarRightViewWithImage:(NSString *)imageName
                             target:(id)target
                             action:(SEL)action{
    _rightImageName = imageName;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.contentMode = UIViewContentModeRight;
    rightBtn.adjustsImageWhenHighlighted = NO;
    [rightBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.customNavBar setNavBarRightView:rightBtn withFrame:CGRectMake(16, 0, CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH-16, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
}

- (void)setNavBarRightViewWithBtnText:(NSString *)rightText
                            textColor:(UIColor *)textColor
                               target:(id)target
                               action:(SEL)action{
    _rightText = rightText;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.titleLabel.contentMode = UIViewContentModeCenter;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    rightBtn.adjustsImageWhenDisabled = NO;
    rightBtn.adjustsImageWhenHighlighted = NO;
    [rightBtn setTitle:_rightText forState:UIControlStateNormal];
    [rightBtn setTitleColor:textColor forState:UIControlStateNormal];
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self setNavBarRightView:rightBtn withFrame:CGRectMake(15, 0, CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH - 15, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
}


#pragma mark - LX_CustomNavBarViewDelegate
- (void)backController {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - lazyloading

- (LX_CustomNavBarView *)customNavBar {
    if (!_customNavBar) {
        _customNavBar = [LX_CustomNavBarView customNavBarView];
        _customNavBar.parentController = self;
        _customNavBar.backDelegate = self;
    }
    return _customNavBar;
}
- (void)setBackText:(NSString *)backText {
    _backText = backText;
    [self.customNavBar setNavBarBackBtnText:backText];
}

- (void)setTitleText:(NSString *)titleText {
    _titleText = titleText;
    [self.customNavBar setNavBarTitle:titleText];
}

- (void)setLeftView:(UIView *)leftView {
    _leftView = leftView;
    [self.customNavBar setNavBarLeftView:_leftView];
}

- (void)setRightView:(UIView *)rightView {
    _rightView = rightView;
    [self.customNavBar setNavBarRightView:_rightView];
}

- (void)setTitleView:(UIView *)titleView {
    _titleView = titleView;
    [self.customNavBar setNavBarTitleView:titleView];
}

- (void)setHiddenNavBar:(BOOL)hiddenNavBar {
    _hiddenNavBar = hiddenNavBar;
    [self hiddenCustomNavBar:_hiddenNavBar];
}

- (void)setLeftImageName:(NSString *)leftImageName {
    _leftImageName = leftImageName;
    [self setNavBarLeftViewWithImage:leftImageName target:nil action:nil];
}

- (void)setRightImageName:(NSString *)rightImageName {
    _rightImageName = rightImageName;
    [self setNavBarRightViewWithImage:rightImageName target:nil action:nil];
}

- (void)setRightText:(NSString *)rightText {
    _rightText = rightText;
    [self setNavBarRightViewWithBtnText:_rightText textColor:LXNavgationTitleColor target:nil action:nil];
}


@end
