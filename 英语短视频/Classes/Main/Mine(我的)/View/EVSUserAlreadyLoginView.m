
//
//  EVSUserAlreadyLoginView.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSUserAlreadyLoginView.h"



@interface EVSUserAlreadyLoginView()

/** 昵称 */
@property (nonatomic, strong) UILabel *nickName_Lable;
/** 签名 */
@property (nonatomic, strong) UILabel *signText_Lable;
/** 头像 */
@property (nonatomic, strong) UIImageView *head_ImageView;

@end

@implementation EVSUserAlreadyLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setUpSubViews];
        
    }
    return self;
}


- (void)setUpSubViews {
    
    [self addSubview:self.nickName_Lable];
    [self addSubview:self.signText_Lable];
    [self addSubview:self.head_ImageView];
    
    [self layoutSubviewContrais];
    
}

- (void)layoutSubviewContrais {
    
    [self.head_ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.size.mas_equalTo(CGSizeMake(60*Y_HeightScale, 60*Y_HeightScale));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.nickName_Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.head_ImageView).mas_offset(10);
        make.left.mas_equalTo(self.mas_left).mas_equalTo(20);
        make.right.mas_equalTo(self.head_ImageView.mas_left).mas_offset(10);
    }];
    
    [self.signText_Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickName_Lable.mas_left);
        make.right.mas_equalTo(self.nickName_Lable.mas_right);
        make.top.mas_equalTo(self.nickName_Lable.mas_bottom).mas_offset(10);
    }];
    

}

#pragma mark - lazyUI 

- (UILabel *)nickName_Lable
{
    if (!_nickName_Lable) {
        _nickName_Lable = [[UILabel alloc] init];
        _nickName_Lable.text = @"李露鑫iOS 11";
        _nickName_Lable.textColor = [UIColor blackColor];
        _nickName_Lable.font = [UIFont systemFontOfSize:18.0];
        _nickName_Lable.textAlignment = NSTextAlignmentLeft;
    }
    return _nickName_Lable;
}

- (UILabel *)signText_Lable
{
    if (!_signText_Lable) {
        _signText_Lable = [[UILabel alloc] init];
        _signText_Lable.text = @"让优秀成为一种习惯";
        _signText_Lable.textColor = LXrayColor(78);
        _signText_Lable.font = [UIFont systemFontOfSize:15.0];
        _signText_Lable.textAlignment = NSTextAlignmentLeft;
    }
    return _signText_Lable;
}

- (UIImageView *)head_ImageView{
    if (!_head_ImageView) {
        _head_ImageView = [[UIImageView alloc] init];
        _head_ImageView.userInteractionEnabled = YES;
        _head_ImageView.layer.cornerRadius = 30*Y_HeightScale;
        _head_ImageView.layer.masksToBounds = YES;
        _head_ImageView.backgroundColor = LXUIRandomColor;
    }
    return _head_ImageView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(mineHeadViewDidTouched:)]) {
        [self.delegate mineHeadViewDidTouched:self];
    }
}

@end
