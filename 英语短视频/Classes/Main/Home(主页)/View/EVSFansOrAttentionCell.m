//
//  EVSFansOrAttentionCell.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/16.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSFansOrAttentionCell.h"
#import "AppConfig.h"


@interface EVSFansOrAttentionCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLable;
@property (weak, nonatomic) IBOutlet UILabel *briefLable;
@property (weak, nonatomic) IBOutlet UIButton *atttentionButon;


@end

@implementation EVSFansOrAttentionCell


- (IBAction)attentionButtonClick:(UIButton *)sender {
    
    if (_attentionType == attentionUserType) {
        if ([self.delegate respondsToSelector:@selector(fansOrAttentionCellDidSeledtedAttentionButton:)]) {
            [self.delegate fansOrAttentionCellDidSeledtedAttentionButton:sender];
        }
    }
}


- (void)setAttentionType:(attentionType)attentionType {
    _attentionType = attentionType;
    
    switch (attentionType) {
        case attentionHaveType:
        {
            [self.atttentionButon setTitle:@"已关注" forState:UIControlStateNormal];
            [self.atttentionButon setTitleColor:[AppConfig shareAppConfig].mainColor forState:UIControlStateNormal];
            [self.atttentionButon setBackgroundColor:[UIColor whiteColor]];
        }
            break;
        case attentionUserType:
        {
            [self.atttentionButon setTitle:@"关注" forState:UIControlStateNormal];
            [self.atttentionButon setBackgroundColor:[AppConfig shareAppConfig].mainColor];
        }
            break;
        case attentionEachotherType:
        {
            [self.atttentionButon setTitle:@"相互关注" forState:UIControlStateNormal];
             [self.atttentionButon setTitleColor:[AppConfig shareAppConfig].mainColor forState:UIControlStateNormal];
            [self.atttentionButon setBackgroundColor:[UIColor whiteColor]];
        }
            break;
            
        default:
            break;
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.atttentionButon.layer.cornerRadius = 3;
    self.atttentionButon.layer.masksToBounds = YES;
    self.atttentionButon.layer.borderColor = [AppConfig shareAppConfig].mainColor.CGColor;
    self.atttentionButon.layer.borderWidth = 0.5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

@end
