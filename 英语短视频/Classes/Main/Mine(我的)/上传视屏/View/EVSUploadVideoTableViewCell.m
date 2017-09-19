//
//  EVSUploadVideoTableViewCell.m
//  英语短视频
//
//  Created by 长缨在手 on 2017/9/6.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSUploadVideoTableViewCell.h"

@implementation EVSUploadVideoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    kweakSelf
    [self addSubview:self.leftImgV];
    [self addSubview:self.timeLabel];
    [self addSubview:self.dateLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.normalLabel];
    [self addSubview:self.threePointBtn];
    
    [self.leftImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(15*X_WidthScale);
        make.top.equalTo(weakSelf).offset(15*Y_HeightScale);
        make.width.offset(130*X_WidthScale);
        make.height.offset(74*Y_HeightScale);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.leftImgV.mas_right).offset(-5*X_WidthScale);
        make.bottom.equalTo(weakSelf.leftImgV.mas_bottom).offset(-10*Y_HeightScale);
        make.width.offset(31*X_WidthScale);
        make.height.offset(13*Y_HeightScale);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftImgV.mas_right).offset(10*X_WidthScale);
        make.top.equalTo(weakSelf.leftImgV);
        make.height.offset(42*Y_HeightScale);
        make.width.offset(205*X_WidthScale);
    }];
    
    [self.normalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLabel);
        make.bottom.equalTo(weakSelf.leftImgV);
        make.height.offset(17*Y_HeightScale);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.normalLabel.mas_right).offset(5*X_WidthScale);
        make.top.equalTo(weakSelf.normalLabel);
        make.height.equalTo(weakSelf.normalLabel);
    }];
    
    [self.threePointBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-15*X_WidthScale);
        make.height.offset(20*X_WidthScale);
        make.top.equalTo(weakSelf.normalLabel);
    }];
    
}
#pragma mark - 懒加载 -
-(UIImageView *)leftImgV{
    if (_leftImgV == nil) {
        _leftImgV = [[UIImageView alloc]init];
        _leftImgV.backgroundColor = [UIColor orangeColor];
    }
    return _leftImgV;
}

-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]initWithTitle:@"00:00" textColor:kUIColorFromRGB(0xffffff) font:7*Y_HeightScale textAlignmengt:NSTextAlignmentCenter lins:0];
        _timeLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _timeLabel.layer.cornerRadius = 6.5*Y_HeightScale;
        _timeLabel.clipsToBounds = YES;
    }
    return _timeLabel;
}
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithTitle:@"借鉴历史经验——周期股能“一借鉴历史经验——周期股能“一" textColor:kUIColorFromRGB(0x323232) font:15*Y_HeightScale textAlignmengt:NSTextAlignmentLeft lins:2];
        _titleLabel.layer.cornerRadius = 3.5*Y_HeightScale;
    }
    return _titleLabel;
}
-(UILabel *)normalLabel{
    if (_normalLabel == nil) {
        _normalLabel = [[UILabel alloc]initWithTitle:@"1万次播放" textColor:kUIColorFromRGB(0x999999) font:12*Y_HeightScale textAlignmengt:NSTextAlignmentLeft lins:1];
    }
    return _normalLabel;
}
-(UILabel *)dateLabel{
    if (_normalLabel == nil) {
        _dateLabel = [[UILabel alloc]initWithTitle:@"07-21" textColor:kUIColorFromRGB(0x999999) font:12*Y_HeightScale textAlignmengt:NSTextAlignmentLeft lins:0];
    }
    return _dateLabel;
}
-(UIButton *)threePointBtn{
    if (_threePointBtn == nil) {
        _threePointBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_threePointBtn setTitle:@"···" forState:(UIControlStateNormal)];
        [_threePointBtn setTitleColor:kUIColorFromRGB(0x999999) forState:(UIControlStateNormal)];
        _threePointBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _threePointBtn;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
