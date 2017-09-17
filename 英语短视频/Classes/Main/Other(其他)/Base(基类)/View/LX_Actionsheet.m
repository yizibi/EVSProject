//
//  LX_Actionsheet.m
//  LX_Actionsheet
//
//  Created by 李lucy on 16/5/12.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "LX_Actionsheet.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define LX_Color(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:0];

#import <objc/runtime.h>


typedef void (^ClickWithAlertShow)(NSInteger btnTag);

static const NSString *OPTIONAL = @"optional";

@interface LX_Actionsheet()

@property (nonatomic, copy) ClickWithAlertShow alertShow;


/** window */
@property (nonatomic, strong) UIWindow *backWindow;
/** 黑色背景色的view */
@property (nonatomic, strong) UIView *darkView;

/** 所有按钮底部的view  */
@property (nonatomic,strong) UIView *bottomView;




/** 代理  */
@property (nonatomic,weak) id<LX_ActionsheetDelegate> delegate;

/** 红色的按钮 */
@property (nonatomic, assign) NSInteger redButtonIndex;


@end

@implementation LX_Actionsheet
- (void)setAlertShow:(void (^)(NSInteger btnTag))block
{
    _alertShow = block;
}

#pragma mark - 方法

+ (instancetype)sheetWithTitle:(NSString *)title buttonTitles:(NSArray *)buttonTitles redButtonIndex:(NSInteger)redButtonIndex delegate:(id<LX_ActionsheetDelegate>)delegate
{
    return [[self alloc] initWithTitle:title buttonTitles:buttonTitles redButtonIndex:redButtonIndex delegate:delegate];
}
+ (instancetype)sheetWithTitle:(NSString *)title buttonTitles:(NSArray *)buttonTitles redButtonIndex:(NSInteger)redButtonIndex
{
    return [[self alloc] initWithTitle:title buttonTitles:buttonTitles redButtonIndex:redButtonIndex delegate:nil];
}


- (instancetype)initWithTitle:(NSString *)title buttonTitles:(NSArray *)buttonTitles redButtonIndex:(NSInteger)redButtonIndex delegate:(id<LX_ActionsheetDelegate>)delegate
{
    if (self = [super init]) {
        
        self.title = title;
        self.buttonTitles = [[NSMutableArray alloc] initWithArray:buttonTitles];
        self.redButtonIndex = redButtonIndex;
        self.delegate = delegate;
    }
    
    return  self;
}

#pragma mark - lazy
- (UIFont *)textFont
{
    if (!_textFont) {
        _textFont = [UIFont systemFontOfSize:18.0*Y_HeightScale];
    }
    return _textFont;
}

- (UIColor *)textColor
{
    if (!_textColor) {
        _textColor = kUIColorFromRGB(0x4b4b4b);
    }
    return _textColor;
}


#pragma mark - 显示的窗口
- (UIWindow *)backWindow
{
    if (!_backWindow) {
        _backWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _backWindow.windowLevel = UIWindowLevelStatusBar;
        _backWindow.backgroundColor = [UIColor clearColor];
        _backWindow.hidden = NO;
    }
    return _backWindow;
}

#pragma mark - dimiss当前的view
- (void)dismiss:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.25 animations:^{
        _darkView.alpha = 0;
        _darkView.userInteractionEnabled = NO;
        
        CGRect frame = self.bottomView.frame;
        
        frame.origin.y += frame.size.height;
        
        [self.bottomView setFrame:frame];
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        self.backWindow.hidden = YES;
    }];
}

- (void)setUpMainView
{
    //    [self addSubview:self.darkView];
    
    // 暗黑色的view
    UIView *darkView = [[UIView alloc] init];
    [darkView setAlpha:0];
    [darkView setUserInteractionEnabled:NO];
    [darkView setFrame:(CGRect){0, 0, SCREEN_WIDTH,SCREEN_HEIGHT}];
    darkView.backgroundColor = [UIColor colorWithWhite:0.01 alpha:0.3];
    [self addSubview:darkView];
    
    _darkView = darkView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    [darkView addGestureRecognizer:tap];
    
    
    //所有按钮底部的view
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = LX_Color(233, 233, 238);
    bottomView.layer.cornerRadius = 0;
    bottomView.clipsToBounds = YES;
    self.bottomView = bottomView;
    
    //暂时,取消actionSheet的标题
    
    //标题按钮
    if (self.buttonTitles.count) {
        
        for (int i = 0; i < self.buttonTitles.count; i++) {
            //添加按钮
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i;
            [titleBtn setTitle:self.buttonTitles[i] forState:UIControlStateNormal];
            titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            UIColor *titleColor = nil;
            
            if (i == self.redButtonIndex) {
                
                titleColor = [UIColor redColor];
                
            } else {
                
                titleColor = self.textColor ;
            }
            
            [titleBtn setTitleColor:titleColor forState:UIControlStateNormal];
            titleBtn.titleLabel.font = self.textFont;
            
            //背景图片
            //            [titleBtn setBackgroundImage:[UIImage creatImageWithColor:[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:0]]forState:UIControlStateNormal];
            
            [titleBtn setBackgroundColor:kUIColorFromRGB(0xf1f1f1)];
            
            [titleBtn setBackgroundImage:[UIImage imageNamed:@"bgImage_HL"] forState:UIControlStateHighlighted ];
            [titleBtn addTarget:self action:@selector(titleBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
            
            CGFloat btnY = 45 * i;
            
            titleBtn.frame = CGRectMake(0, btnY, SCREEN_WIDTH, 45);
            
            //给最后添加的按钮添加圆角
           /* 取消圆角
            if (i == self.buttonTitles.count - 1) {
                
                UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:titleBtn.bounds   byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
                CAShapeLayer *maskLayer = [CAShapeLayer layer];
                
                maskLayer.frame = titleBtn.bounds;
                maskLayer.path = maskPath.CGPath;
                titleBtn.layer.mask = maskLayer;
                
                //            byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight;
                
                //                titleBtn.layer.masksToBounds = YES;
                //                titleBtn.layer.cornerRadius = 10;
            }
            */
            
            [bottomView addSubview:titleBtn];
        }
        
        for (int i = 0; i < self.buttonTitles.count; i++) {
            
            //分割线
            
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = kUIColorFromRGB(0xdfdfdf);
            if (i == 0) {
                line.backgroundColor = [UIColor clearColor];
                
            }
            
            [bottomView addSubview:line];
            
            CGFloat lineY = i * 45;
            
            line.frame = CGRectMake(0, lineY, SCREEN_WIDTH, 1.0);
        }
        
    }
    
    //取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.tag = 101;
    if (self.cancelTitle.length) {
        [cancelBtn setTitle:self.cancelTitle forState:UIControlStateNormal];
        
    }else{
        
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    }
    [cancelBtn setBackgroundColor:kUIColorFromRGB(0xf1f1f1)];
    
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"bgImage_HL"] forState:UIControlStateHighlighted ];
    
    [cancelBtn setTitleColor:kUIColorFromRGB(0x4b4b4b) forState:UIControlStateNormal];
    cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18.0*Y_HeightScale];
    self.cancelBtn = cancelBtn;
    [cancelBtn addTarget:self action:@selector(cancelBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat  cancelBtnY = 45 * self.buttonTitles.count + 5;
    cancelBtn.frame = CGRectMake(0, cancelBtnY, SCREEN_WIDTH, 45);
    
    //*** 设置取消按钮的圆角
    //    cancelBtn.layer.cornerRadius = 10;
    //    cancelBtn.clipsToBounds = YES;
    
    
    //取消圆角
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cancelBtn.bounds   byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    
//    maskLayer.frame = cancelBtn.bounds;
//    maskLayer.path = maskPath.CGPath;
//    cancelBtn.layer.mask = maskLayer;
    
    
    [bottomView addSubview:cancelBtn];
    
    //取消底部的间距
    CGFloat bottomH =  45 * self.buttonTitles.count + 45 + 5;
    
    [bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, bottomH)];
    
    [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
}
#pragma mark - 显示actionSheet
- (void)show
{
    [self setUpMainView];
    
    self.backWindow.hidden = NO;
    
    [self addSubview:self.bottomView];
    
    [self.backWindow addSubview:self];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _darkView.alpha = 0.8;
        _darkView.userInteractionEnabled = YES;
        
        CGRect frame = self.bottomView.frame;
        
        frame.origin.y = frame.origin.y - frame.size.height;
        
        NSLog(@"%f",frame.size.height);
        
        [self.bottomView setFrame:frame];
        
        LXLog(@"展示之后:%@",NSStringFromCGRect(self.bottomView.frame));
        
    } completion:nil];
    
}

- (void)cancelBtnDidClick:(UIButton *)button
{
    LXLog(@"点击了取消按钮");
    [UIView animateWithDuration:0.25 animations:^{
        
        _darkView.alpha = 0;
        _darkView.userInteractionEnabled = NO;
        
        CGRect frame = self.bottomView.frame;
        
        frame.origin.y += frame.size.height;
        
        [self.bottomView setFrame:frame];
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        self.backWindow.hidden = YES;
        
        if ([_delegate respondsToSelector:@selector(actionsheet:didClickCancelButton:)]) {
            
            [_delegate actionsheet:self didClickCancelButton:button];
        }
        
        
    }];
    
    
    
}

- (void)titleBtnDidClick:(UIButton *)button
{
    //    LXLog(@"点击了第%@个按钮",button.titleLabel.text);

    if (self.alertShow) {
        self.alertShow(button.tag);
    }
    
    
    [self dismiss:nil];

    
    
    if ([_delegate respondsToSelector:@selector(actionsheet:didClickButtonIndex:)]) {
        
        [_delegate actionsheet:self didClickButtonIndex:button.tag];
    }
}


@end
