

//
//  EVSVideoInfoTitleCell.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/5.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSVideoInfoTitleCell.h"


#define Margin 15

@interface EVSVideoInfoTitleCell()

/** 视频标题 */
@property (nonatomic, strong) UILabel *titleLable;
/** 发布者头像 */
@property (nonatomic, strong) UIImageView *headImgView;
/** 昵称 */
@property (nonatomic, strong) UILabel *nickNameLable;
/** 关注 */
@property (nonatomic, strong) UIButton *attentionButton;

@end

@implementation EVSVideoInfoTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubViews];
    }
    return self;
}

#pragma mark - actions
- (void)attentionButtonDidCliced:(UIButton *)attention {
    LXLogFunc;
    attention.selected = !attention.selected;
}

- (void)setUpSubViews {

    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.headImgView];
    [self.contentView addSubview:self.nickNameLable];
    [self.contentView addSubview:self.attentionButton];
    
    [self setUpSubViewsContrains];
}

- (void)setUpSubViewsContrains {
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(30*Y_HeightScale);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-Margin);
        
    }];
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLable.mas_left);
        make.top.mas_equalTo(self.titleLable.mas_bottom).mas_offset(10*Y_HeightScale);
        make.size.mas_equalTo(CGSizeMake(30*Y_HeightScale, 30*Y_HeightScale));
        
    }];
    
    [self.attentionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-Margin);
        make.centerY.mas_equalTo(self.headImgView.mas_centerY);
        make.width.mas_equalTo(60*Y_HeightScale);
        make.height.mas_equalTo(25);
    }];
    
    [self.nickNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImgView.mas_right).mas_offset(5);
        make.centerY.mas_equalTo(self.headImgView.mas_centerY);
        make.right.mas_equalTo(self.attentionButton.mas_left).mas_offset(-Margin);

    }];
  
}

#pragma mark - lazyUI

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

- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithTitle:@"TOM大叔，惊人的表现力与创力放肆肆开大收人头大" textColor:kUIColorFromRGB(0x333333) font:18.0 textAlignmengt:NSTextAlignmentLeft lins:2];
    }
    return _titleLable;
}

- (UILabel *)nickNameLable
{
    if (!_nickNameLable) {
        _nickNameLable = [[UILabel alloc] initWithTitle:@"老坛酸菜" textColor:kUIColorFromRGB(0x666666) font:15.0 textAlignmengt:NSTextAlignmentLeft lins:1];
    }
    return _nickNameLable;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"注册-头像"]];
        _headImgView.userInteractionEnabled = YES;
        _headImgView.layer.cornerRadius = 15*Y_HeightScale;
        _headImgView.layer.masksToBounds = YES;
    }
    return _headImgView;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

@end
