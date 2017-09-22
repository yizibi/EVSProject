

//
//  EVSHotSearchCell.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/19.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSHotSearchCell.h"


@interface EVSHotSearchCell()

/** 大家都在搜 */
@property (nonatomic, strong) UILabel *commonSearchLable;

@end

@implementation EVSHotSearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    [self.contentView addSubview:self.commonSearchLable];
    [self layoutSubviewsContrains];
    //创建热门搜索
}



- (void)layoutSubviewsContrains {
    [self.commonSearchLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10);
    }];
}

- (UILabel *)commonSearchLable
{
    if (!_commonSearchLable) {
        _commonSearchLable = [[UILabel alloc] initWithTitle:@"历史搜索" textColor:kUIColorFromRGB(0x666666) font:14 textAlignmengt:NSTextAlignmentLeft lins:0];
    }
    return _commonSearchLable;
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
