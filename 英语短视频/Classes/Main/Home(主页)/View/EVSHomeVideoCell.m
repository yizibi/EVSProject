
//
//  EVSHomeVideoCell.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/29.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSHomeVideoCell.h"
#import "EVSCommonButton.h"

@interface EVSHomeVideoCell()

/** imgView */
@property (nonatomic, strong) UIImageView *videoCover_ImgView;
/** 透明蒙版 */
@property (nonatomic, strong) UIImageView *imgCoverView;
/** 标题 */
@property (nonatomic, strong) UILabel *title_Lable;
/** 播放按钮 */
@property (nonatomic, strong) UIButton *play_Button;
/** 时长 */
@property (nonatomic, strong) UIButton *time_Lable;
/** 头像 */
@property (nonatomic, strong) UIImageView *head_ImgView;
/** 昵称 */
@property (nonatomic, strong) UILabel *nickName_Lable;
/** 赞按钮 */
@property (nonatomic, strong) EVSCommonButton *like_Button;
/** 评论按钮 */
@property (nonatomic, strong) EVSCommonButton *comment_Button;
/** 分享 */
@property (nonatomic, strong) UIButton *share_Button;
/** 更多 */
@property (nonatomic, strong) UIButton *more_Button;
/** 播放次数 */
@property (nonatomic, strong) UILabel *playCount_Lable;


@end

@implementation EVSHomeVideoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubViews];
    }
    return self;
}


- (void)setUpSubViews{
    
    [self.contentView addSubview:self.videoCover_ImgView];
    [self.contentView addSubview:self.imgCoverView];
    [self.contentView addSubview:self.title_Lable];
    [self.contentView addSubview:self.playCount_Lable];
    [self.contentView addSubview:self.play_Button];
    [self.contentView addSubview:self.time_Lable];
    [self.contentView addSubview:self.head_ImgView];
    [self.contentView addSubview:self.nickName_Lable];
    [self.contentView addSubview:self.like_Button];
    [self.contentView addSubview:self.comment_Button];
    [self.contentView addSubview:self.share_Button];
    [self.contentView addSubview:self.more_Button];
    
    [self layoutSubviewContrains];
}


#pragma mark - actions
- (void)homeVideoCellWithButtonClicked:(UIButton *)button {
    LXLogFunc;
}


- (void)layoutSubviewContrains{
    
    [self.videoCover_ImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 160*Y_HeightScale));
        
    }];
    
    [self.imgCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(80*Y_HeightScale);
        make.top.mas_equalTo(self.videoCover_ImgView.mas_top);
        
    }];
    
    [self.title_Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        make.top.mas_equalTo(self.videoCover_ImgView.mas_top).mas_offset(5*Y_HeightScale);
        
    }];
    
    [self.playCount_Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.title_Lable.mas_left);
        make.top.mas_equalTo(self.title_Lable.mas_bottom).mas_offset(10*Y_HeightScale);
    }];
    
    [self.play_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.videoCover_ImgView.mas_centerX);
        make.centerY.mas_equalTo(self.videoCover_ImgView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80*Y_HeightScale, 80*Y_HeightScale));
    }];
    
    [self.time_Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.videoCover_ImgView.mas_right).mas_offset(-20);
        make.bottom.mas_equalTo(self.videoCover_ImgView.mas_bottom).mas_offset(-20);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(45);
    }];
    
    
    [self.head_ImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.title_Lable.mas_left).mas_offset(0);
        make.top.mas_equalTo(self.videoCover_ImgView.mas_bottom).mas_offset(10*Y_HeightScale);
        make.width.mas_equalTo(40*Y_HeightScale);
        make.height.mas_equalTo(40*Y_HeightScale);
    }];
    
    
    [self.more_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.head_ImgView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.width.mas_equalTo(30);
    }];
    
    [self.comment_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.head_ImgView.mas_centerY);
        make.right.mas_equalTo(self.more_Button.mas_left).mas_offset(-10);
        make.width.mas_equalTo(40);

    }];
    
    
    [self.like_Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.head_ImgView.mas_centerY);
        make.right.mas_equalTo(self.comment_Button.mas_left).mas_offset(-10);
        make.width.mas_equalTo(40);

    }];
    
    [self.nickName_Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.head_ImgView.mas_centerY);
        make.right.mas_equalTo(self.like_Button.mas_left).mas_offset(-10).priorityMedium();
        make.left.mas_equalTo(self.head_ImgView.mas_right).mas_offset(10);
    }];
    
}


#pragma mark - lazyloadingUI

- (UIButton *)play_Button{
    if (!_play_Button) {
        _play_Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_play_Button setTitle:@"播放" forState:UIControlStateNormal];
        [_play_Button setTitleColor:LXUIRandomColor forState:UIControlStateNormal];
        _play_Button.tag = videoMoreButtonClicKPlayType;
        [_play_Button addTarget:self action:@selector(homeVideoCellWithButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _play_Button.titleLabel.font = [UIFont systemFontOfSize:18.0];
    }
    return _play_Button;
}

- (UIButton *)more_Button{
    if (!_more_Button) {
        _more_Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_more_Button setTitle:@"更多" forState:UIControlStateNormal];
        [_more_Button setTitleColor:LXUIRandomColor forState:UIControlStateNormal];
        _more_Button.tag = videoMoreButtonClicKMoreType;
        [_more_Button addTarget:self action:@selector(homeVideoCellWithButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _more_Button.titleLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _more_Button;
}

- (UIButton *)share_Button{
    if (!_share_Button) {
        _share_Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_share_Button setTitle:@"分享" forState:UIControlStateNormal];
        [_share_Button setTitleColor:LXUIRandomColor forState:UIControlStateNormal];
        _share_Button.tag = videoMoreButtonClicKShareType;
        [_share_Button addTarget:self action:@selector(homeVideoCellWithButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _share_Button.titleLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _share_Button;
}


- (EVSCommonButton *)comment_Button{
    if (!_comment_Button) {
        _comment_Button = [EVSCommonButton buttonWithType:UIButtonTypeCustom];
        [_comment_Button setTitle:@"10" forState:UIControlStateNormal];
        _comment_Button.tag = videoMoreButtonClicKCommentType;
        [_comment_Button addTarget:self action:@selector(homeVideoCellWithButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _comment_Button;
}

- (EVSCommonButton *)like_Button{
    if (!_like_Button) {
        _like_Button = [EVSCommonButton buttonWithType:UIButtonTypeCustom];
        [_like_Button setTitle:@"1009" forState:UIControlStateNormal];
        _like_Button.tag = videoMoreButtonClicKLikeType;
        [_like_Button addTarget:self action:@selector(homeVideoCellWithButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _like_Button;
}

- (UIImageView *)head_ImgView{
    if (!_head_ImgView) {
        _head_ImgView = [[UIImageView alloc] init];
        _head_ImgView.userInteractionEnabled = YES;
        _head_ImgView.layer.cornerRadius = 20*Y_HeightScale;
        _head_ImgView.layer.masksToBounds = YES;
        _head_ImgView.backgroundColor = LXUIRandomColor;
    }
    return _head_ImgView;
}

- (UILabel *)nickName_Lable{
    if (!_nickName_Lable) {
        _nickName_Lable = [[UILabel alloc] init];
        _nickName_Lable.text = @"玉米棒-召唤师";
        _nickName_Lable.textColor = LXrayColor(189);
        _nickName_Lable.textAlignment = NSTextAlignmentLeft;
        _nickName_Lable.numberOfLines = 1;
        _nickName_Lable.font = [UIFont systemFontOfSize:14.0];
    }
    return _nickName_Lable;
}


- (UIButton *)time_Lable{
    if (!_time_Lable) {
        _time_Lable = [UIButton buttonWithType:UIButtonTypeCustom];
        [_time_Lable setTitle:@"01:20" forState:UIControlStateNormal];
        _time_Lable.backgroundColor = kUIColor(0, 0, 0, 0.6);
//        _time_Lable.contentEdgeInsets = UIEdgeInsetsMake(2, 5, -5, -2);
        _time_Lable.layer.cornerRadius = 10;
        _time_Lable.layer.masksToBounds = YES;
        [_time_Lable setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _time_Lable.titleLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _time_Lable;
}


- (UILabel *)playCount_Lable{
    if (!_playCount_Lable) {
        _playCount_Lable = [[UILabel alloc] init];
        _playCount_Lable.text = @"1万次播放";
        _playCount_Lable.textColor = [UIColor whiteColor];
        _playCount_Lable.textAlignment = NSTextAlignmentLeft;
        _playCount_Lable.numberOfLines = 1;
        _playCount_Lable.font = [UIFont systemFontOfSize:12.0];
    }
    return _playCount_Lable;
}


- (UILabel *)title_Lable{
    if (!_title_Lable) {
        _title_Lable = [[UILabel alloc] init];
        _title_Lable.text = @"调酒师,花样人生,流水落花春去也,天上人间";
        _title_Lable.textColor = [UIColor whiteColor];
        _title_Lable.textAlignment = NSTextAlignmentLeft;
        _title_Lable.numberOfLines = 2;
        _title_Lable.font = [UIFont systemFontOfSize:16.0];
    }
    return _title_Lable;
}

- (UIImageView *)videoCover_ImgView{
    if (!_videoCover_ImgView) {
        _videoCover_ImgView = [[UIImageView alloc] init];
        _videoCover_ImgView.userInteractionEnabled = YES;
        _videoCover_ImgView.backgroundColor = LXUIRandomColor;
    }
    return _videoCover_ImgView;
}

- (UIImageView *)imgCoverView
{
    if (!_imgCoverView) {
        _imgCoverView = [[UIImageView alloc] init];
        _imgCoverView.userInteractionEnabled = YES;
    }
    return _imgCoverView;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

@end
