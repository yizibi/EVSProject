//
//  LX_CustomNavBarView.m
//  木言
//
//  Created by 李lucy on 16/6/6.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "LX_CustomNavBarView.h"
#define  DEFAULT_FRAME CGRectMake(0, 0, SCREEN_WIDTH, CUSTOM_NAVBAR_HEIGHT)

#pragma mark - 自定义返回按钮LX_CustomNavBarBackView
/******   自定义返回按钮  *************/
@interface LX_CustomNavBarBackView : UIView
@property (nonatomic, strong) UILabel     *backTextLabel;
@property (nonatomic, strong) UIImageView *backImgView;
+ (instancetype)customBackView;
@end

@implementation LX_CustomNavBarBackView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

#pragma mark - Interface
+ (instancetype)customBackView{
    return [[LX_CustomNavBarBackView alloc] initWithFrame:CGRectMake(0, 0, CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
}

#pragma mark - Event Response
- (void)setupSubviews{
    [self addSubview:self.backImgView];
    [self addSubview:self.backTextLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.backImgView.frame = CGRectMake(10, 2, 40, 40);
    CGFloat backTextLabelX = CGRectGetMaxX(self.backImgView.frame) + 5;
    self.backTextLabel.frame = CGRectMake(backTextLabelX, 0, CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH - backTextLabelX, CUSTOM_NAVBAR_CONTENT_HEIGHT);
}

#pragma mark - Getter and Setter
- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [[UIImageView alloc] init];
        _backImgView.contentMode = UIViewContentModeCenter;
        _backImgView.image = [UIImage imageNamed:@"navgationBarBackBlack"];
    }
    return _backImgView;
}

- (UILabel *)backTextLabel {
    if (!_backTextLabel) {
        _backTextLabel = [[UILabel alloc] init];
        _backTextLabel.textColor = [UIColor whiteColor];
        _backTextLabel.font = [UIFont systemFontOfSize:12];
        _backTextLabel.textAlignment = NSTextAlignmentLeft;
        _backTextLabel.text = @"返回";
    }
    return _backTextLabel;
}

@end


#pragma mark - 自定义导航栏(LX_CustomNavBarView)

/************  自定义导航栏     **********/
@interface LX_CustomNavBarView()
@property (nonatomic, strong) LX_CustomNavBarBackView *backView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIView  *leftView;

@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView  *rightView;

/** 底部的线 */
@property (nonatomic, strong) UIView *bottomLine;


@end


@implementation LX_CustomNavBarView
- (instancetype)initWithFrame:(CGRect)frame{
    frame = DEFAULT_FRAME;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

#pragma mark - Interface
- (CGRect)getLeftViewSize {
    return self.leftView.bounds;
}

- (CGRect)getRightViewSize {
    return self.rightView.bounds;
}

- (CGRect)getTitleviewBounds {
    return self.titleView.bounds;
}

+ (instancetype)customNavBarView{
    return [[LX_CustomNavBarView alloc] initWithFrame:DEFAULT_FRAME];
}

- (void)setNavBarBackBtnText:(NSString *)backText{
    [self setNavBarBackBtnText:backText withFrame:CGRectMake(0, 0, CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, CUSTOM_NAVBAR_CONTENT_HEIGHT)];

}

- (void)setNavBarBackBtnText:(NSString *)backText withFrame:(CGRect)frame{
    self.backView.backTextLabel.text = backText;
    [self setNavBarLeftView:self.backView withFrame:frame];
}

- (void)setNavBarLeftView:(UIView *)leftView{
    if (!leftView) return;
    [self setNavBarLeftView:leftView withFrame:self.leftView.bounds ];
}

- (void)setNavBarLeftView:(UIView *)leftView withFrame:(CGRect)frame{
    if (!leftView) return;
    [self.leftView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.leftView addSubview:leftView];
    leftView.frame = frame;
}

- (void)setNavBarRightView:(UIView *)rightView{
    if (!rightView) return;
    [self setNavBarLeftView:rightView withFrame:self.rightView.bounds];
}

- (void)setNavBarRightView:(UIView *)rightView withFrame:(CGRect)frame{
    if (!rightView) return;
    [self.rightView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.rightView addSubview:rightView];
    rightView.frame = frame;
}

- (void)setNavBarTitle:(NSString *)title{
    if (!title) return;
    self.titleLabel.text = title;
    [self setNavBarTitleView:self.titleLabel];
}

- (void)setNavBarTitleView:(UIView *)titleView{
    CGRect titleViewNewFrame = titleView.frame;
    CGFloat titleViewX = (self.titleView.bounds.size.width - titleViewNewFrame.size.width) * 0.5;
    CGFloat titleViewY = (self.titleView.bounds.size.height - titleViewNewFrame.size.height) * 0.5;
    titleViewNewFrame.origin.x = titleViewX;
    titleViewNewFrame.origin.y = titleViewY;
    [self setNavBarTitleView:titleView withFrame:titleViewNewFrame];
}

- (void)setNavBarTitleView:(UIView *)titleView withFrame:(CGRect)frame{
    if (!titleView) return;
    [self.titleView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.titleView addSubview:titleView];
    titleView.frame = frame;
}


- (void)handleBackButtonEvent{
    if (self.backDelegate && [self.backDelegate respondsToSelector:@selector(backController)]) {
        [self.backDelegate backController];
    }
}

#pragma mark - Event Response
- (void)setupSubviews{
    [self addSubview:self.leftView];
    [self addSubview:self.titleView];
    [self addSubview:self.rightView];
    [self addSubview:self.bottomLine];
    
    // 默认添加返回和标题
    [self.titleView addSubview:self.titleLabel];
    
    //添加底部的分割线
    __weak typeof(self) weakSelf = self;
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        
    }];
}

#pragma mark - Getter and Setter

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = LXrayColor(239);
    }
    return _bottomLine;
}
- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, STATSU_BAR_HEIGHT, SCREEN_WIDTH - 2 * CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
        _titleView.backgroundColor = [UIColor clearColor];
    }
    return _titleView;
}

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(0, STATSU_BAR_HEIGHT, CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
        _leftView.backgroundColor = [UIColor clearColor];
        _leftView.clipsToBounds = YES;
    }
    return _leftView;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, STATSU_BAR_HEIGHT, CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
        _rightView.backgroundColor = [UIColor clearColor];
        _rightView.clipsToBounds = YES;
    }
    return _rightView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 2 * CUSTOM_NAVBAR_LEFT_AND_RIGHT_VIEW_WIDTH, CUSTOM_NAVBAR_CONTENT_HEIGHT)];
        _titleLabel.textColor = LXNavgationTitleColor;
        _titleLabel.textAlignment=  NSTextAlignmentCenter;
        _titleLabel.font = LXNavgationTitleFont;
    }
    return _titleLabel;
}

- (LX_CustomNavBarBackView *)backView{
    if (!_backView) {
        _backView = [LX_CustomNavBarBackView customBackView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBackButtonEvent)];
        [_backView addGestureRecognizer:tapGesture];
    }
    return _backView;
}

- (void)setHiddenLeftView:(BOOL)hiddenLeftView{
    _hiddenLeftView = hiddenLeftView;
    self.leftView.hidden = _hiddenLeftView;
}

- (void)setHiddenRightView:(BOOL)hiddenRightView{
    _hiddenRightView = hiddenRightView;
    self.rightView.hidden = _hiddenRightView;
}

- (void)setHiddenTitleView:(BOOL)hiddenTitleView{
    _hiddenTitleView = hiddenTitleView;
    self.titleView.hidden = _hiddenTitleView;
}



@end
