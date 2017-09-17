//
//  EVSUserInfoHeadView.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/16.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSUserInfoHeadView.h"

@interface EVSUserInfoHeadView()

/** nickName */
@property (nonatomic, strong) UILabel *nickNameLable;
/** touxiang */
@property (nonatomic, strong) UIImageView *headImgView;
/** 个人介绍 */
@property (nonatomic, strong) UILabel *briefLable;


/** videoView */
@property (nonatomic, strong) UIView *videoView;

@property (nonatomic, strong) UIView *fanView;

@property (nonatomic, strong) UIView *attentionView;

/** videoTitle */
@property (nonatomic, strong) UILabel *videoTitle;
/** videoCOunt */
@property (nonatomic, strong) UILabel *videoCount;

/**  fanstitle*/
@property (nonatomic, strong) UILabel *fansTitle;
/** fanCount */
@property (nonatomic, strong) UILabel *fansCount;
@property (nonatomic, strong) UILabel *attentionTitle;
@property (nonatomic, strong) UILabel *attentionCount;

/** button */
@property (nonatomic, strong) UIButton *attentionButton;
@end

@implementation EVSUserInfoHeadView


#pragma mark - actions

- (void)attentionButtonDidCliced:(UIButton *)button {
    LXLog(@"关注");
}

- (void)setUserType:(userType)userType {
    _userType = userType;
    if (userType == userTypeSelf) {
        self.attentionButton.hidden = YES;
    }
    else {
        self.attentionButton.hidden = NO;
    }
}

- (instancetype)initWithFrame:(CGRect)frame  {
    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
    }
    return self;
}

- (void)creatUI {
    [self addSubview:self.nickNameLable];
    [self addSubview:self.headImgView];
    [self addSubview:self.briefLable];
    
    [self.videoView addSubview:self.videoCount];
    [self.videoView addSubview:self.videoTitle];
    [self.fanView addSubview:self.fansCount];
    [self.fanView addSubview:self.fansTitle];
    [self.attentionView addSubview:self.attentionTitle];
    [self.attentionView addSubview:self.attentionCount];
    
    [self addSubview:self.videoView];
    [self addSubview:self.fanView];
    [self addSubview:self.attentionView];
    
    [self addSubview:self.attentionButton];
    
    [self layoutSubviewsContrains];
    
}

- (void)layoutSubviewsContrains {
    
    
    
    [self.nickNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(25);
        make.top.mas_equalTo(self.mas_top).mas_offset(20);
    }];
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-25);
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(66, 66));
    }];
    
    [self.briefLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLable.mas_left);
        make.right.mas_equalTo(self.headImgView.mas_left).mas_offset(-10);
        make.top.mas_equalTo(self.nickNameLable.mas_bottom).mas_offset(10);
    }];
    
    [self.attentionButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.headImgView.mas_left);
        make.right.mas_equalTo(self.headImgView.mas_right);
        make.top.mas_equalTo(self.headImgView.mas_bottom).mas_offset(24);
        make.height.mas_equalTo(25);
        
    }];
    
    CGFloat viewW = (SCREEN_WIDTH-135)/3;
    
    
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLable.mas_left);
        make.width.mas_equalTo(viewW);
        make.top.mas_equalTo(self.briefLable.mas_bottom).mas_offset(22);
        make.height.mas_equalTo(50);
    }];
    
    [self.fanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.videoView.mas_right);
        make.top.mas_equalTo(self.videoView.mas_top);
        make.width.mas_equalTo(self.videoView.mas_width);
        make.height.mas_equalTo(self.videoView.mas_height);
    }];
    
    [self.attentionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fanView.mas_right);
        make.top.mas_equalTo(self.videoView.mas_top);
        make.width.mas_equalTo(self.videoView.mas_width);
        make.height.mas_equalTo(self.videoView.mas_height);

    }];
    
   [self.videoCount mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(self.videoView.mas_left);
       make.top.mas_equalTo(self.videoView);

   }];
    
    [self.videoTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.videoCount.mas_centerX);
        make.top.mas_equalTo(self.videoCount.mas_bottom).mas_offset(6);

    }];

    [self.fansCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fanView.mas_left);
        make.top.mas_equalTo(self.fanView.mas_top);
    }];

    [self.fansTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.fansCount.mas_centerX);
        make.top.mas_equalTo(self.fansCount.mas_bottom).mas_offset(6);
    }];
    
    [self.attentionCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.attentionView.mas_left);
        make.top.mas_equalTo(self.attentionView.mas_top);

    }];

    [self.attentionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.attentionCount.mas_centerX);
        make.top.mas_equalTo(self.attentionCount.mas_bottom).mas_offset(6);
    }];
    
}

- (UIView *)attentionView {
    if (!_attentionView) {
        kweakSelf;
        _attentionView = [[UIView alloc] init];
        [_attentionView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
            if ([weakSelf.delegate respondsToSelector:@selector(userInfoHeadViewDidTouchAttentionView)]) {
                [weakSelf.delegate userInfoHeadViewDidTouchAttentionView];
            }
        }]];
    }
    return _attentionView;
}

- (UIView *)fanView {
    if (!_fanView) {
        _fanView = [[UIView alloc] init];
        kweakSelf;
        [_fanView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
            if ([weakSelf.delegate respondsToSelector:@selector(userInfoHeadViewDidTouchFansView)]) {
                [weakSelf.delegate userInfoHeadViewDidTouchFansView];
            }
        }]];
    }
    return _fanView;
}

- (UIView *)videoView
{
    if (!_videoView) {
        _videoView = [[UIView alloc] init];
        kweakSelf;
        [_videoView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
            if ([weakSelf.delegate respondsToSelector:@selector(userInfoHeadViewDidTouchVideoView)]) {
                [weakSelf.delegate userInfoHeadViewDidTouchVideoView];
            }
        }]];

    }
    return _videoView;
}


- (UILabel *)videoCount {
    if (!_videoCount) {
        _videoCount = [UILabel lableWithTitle:@"12" textColor:kUIColorFromRGB(0x060606) font:21.0 textAlignmengt:NSTextAlignmentLeft lins:0];
    }
    return _videoCount;
}
- (UILabel *)videoTitle {
    if (!_videoTitle) {
        _videoTitle = [UILabel lableWithTitle:@"视频" textColor:kUIColorFromRGB(0x060606) font:10.0 textAlignmengt:NSTextAlignmentCenter lins:0];
    }
    return _videoTitle;
}
- (UILabel *)fansCount {
    if (!_fansCount) {
        _fansCount = [UILabel lableWithTitle:@"24" textColor:kUIColorFromRGB(0x060606) font:21.0 textAlignmengt:NSTextAlignmentLeft lins:0];
    }
    return _fansCount;
}
- (UILabel *)fansTitle {
    if (!_fansTitle) {
        _fansTitle = [UILabel lableWithTitle:@"粉丝" textColor:kUIColorFromRGB(0x060606) font:10.0 textAlignmengt:NSTextAlignmentCenter lins:0];
    }
    return _fansTitle;
}
- (UILabel *)attentionCount {
    if (!_attentionCount) {
        _attentionCount = [UILabel lableWithTitle:@"240" textColor:kUIColorFromRGB(0x060606) font:21.0 textAlignmengt:NSTextAlignmentLeft lins:0];
    }
    return _attentionCount;
}
- (UILabel *)attentionTitle {
    if (!_attentionTitle) {
        _attentionTitle = [UILabel lableWithTitle:@"关注" textColor:kUIColorFromRGB(0x060606) font:10.0 textAlignmengt:NSTextAlignmentCenter lins:0];
    }
    return _attentionTitle;
}


- (UIButton *)attentionButton {
    if (!_attentionButton) {
        _attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_attentionButton setTitle:@"关注" forState:UIControlStateNormal];
        [_attentionButton setTitle:@"已关注" forState:UIControlStateSelected];
        [_attentionButton setTitleColor:kUIColor(178, 178, 178, 1) forState:UIControlStateSelected];
        [_attentionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _attentionButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [_attentionButton setBackgroundImage:[UIImage imageWithColor:kUIColor(46, 172, 165, 1)] forState:UIControlStateNormal];
        [_attentionButton setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
        [_attentionButton addTarget:self action:@selector(attentionButtonDidCliced:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _attentionButton;
}




- (UILabel *)nickNameLable
{
    if (!_nickNameLable) {
        _nickNameLable = [[UILabel alloc] init];
        _nickNameLable.text = @"李露鑫iOS 11";
        _nickNameLable.textColor = kUIColorFromRGB(0x060606);
        _nickNameLable.font = [UIFont systemFontOfSize:21.0];
        _nickNameLable.textAlignment = NSTextAlignmentLeft;
    }
    return _nickNameLable;
}

- (UILabel *)briefLable
{
    if (!_briefLable) {
        _briefLable = [[UILabel alloc] init];
        _briefLable.text = @"让优秀成为一种习惯";
        _briefLable.textColor = kUIColorFromRGB(0x999999);
        _briefLable.font = [UIFont systemFontOfSize:14.0];
        _briefLable.textAlignment = NSTextAlignmentLeft;
    }
    return _briefLable;
}

- (UIImageView *)headImgView{
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        _headImgView.userInteractionEnabled = YES;
        _headImgView.layer.cornerRadius = 33;
        _headImgView.layer.masksToBounds = YES;
        _headImgView.image = [UIImage imageNamed:@"注册-头像"];
    }
    return _headImgView;
}


@end
