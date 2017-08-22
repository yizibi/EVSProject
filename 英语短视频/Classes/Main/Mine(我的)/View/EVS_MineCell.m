
//
//  EVS_MineCell.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/22.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVS_MineCell.h"


@interface EVS_MineCell()

@property (nonatomic, strong) UIImageView *arrow;


@end

@implementation EVS_MineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews
{
    [self.contentView addSubview:self.leftImageView];
    [self.contentView addSubview:self.classifyLable];
    [self.contentView addSubview:self.arrow];
    [self.contentView addSubview:self.rightDetailLable];
    
    
    [self layoutContrains];
}


- (void)layoutContrains
{
    __weak typeof(self) weakSelf = self;
    
    
    CGFloat ratio = SCREEN_HEIGHT/667;
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.mas_top).with.offset((45/2)*ratio);
        make.left.mas_equalTo(weakSelf.mas_left).with.offset(15*ratio);
        //            make.width.mas_equalTo(16*ratio);
    }];
    
    [self.classifyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.leftImageView.mas_right).with.offset(10*ratio);
        make.centerY.mas_equalTo(weakSelf.leftImageView.mas_centerY);
    }];
    
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(weakSelf.leftImageView.mas_centerY);
        
        make.right.mas_equalTo(weakSelf.mas_right).mas_offset(-16*ratio);
        
        make.size.mas_equalTo(CGSizeMake(7*ratio, 12*ratio));
    }];
    
    [self.rightDetailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(weakSelf.arrow.mas_left).mas_offset(-10*ratio);
        make.centerY.mas_equalTo(weakSelf.leftImageView.mas_centerY);
        
    }];
    
    
    
}


#pragma mark - lazyLoding

- (UIImageView *)arrow
{
    if (!_arrow) {
        _arrow = [[UIImageView alloc] init];
        _arrow.image = [UIImage imageNamed:@"arrow"];
        _arrow.userInteractionEnabled = YES;
    }
    return _arrow;
}
- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}


- (UILabel *)classifyLable
{
    if (!_classifyLable) {
        _classifyLable = [[UILabel alloc] init];
        _classifyLable.textColor = kUIColorFromRGB(0x19181e);
        _classifyLable.font = [UIFont systemFontOfSize:15.0];
        
    }
    return _classifyLable;
}

- (UILabel *)rightDetailLable
{
    if (!_rightDetailLable) {
        _rightDetailLable = [[UILabel alloc] init];
        _rightDetailLable.textColor = LXCommongrayColor;
        _rightDetailLable.font = [UIFont systemFontOfSize:13.0];
        _rightDetailLable.hidden = YES;
    }
    return _rightDetailLable;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}


@end
