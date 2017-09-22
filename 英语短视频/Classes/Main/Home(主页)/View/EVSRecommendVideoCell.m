
//
//  EVSRecommendVideoCell.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/5.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSRecommendVideoCell.h"


@interface EVSRecommendVideoCell()

@property (weak, nonatomic) IBOutlet UIImageView *videoCoverImgView;
@property (weak, nonatomic) IBOutlet UILabel *videoTitleName;
@property (weak, nonatomic) IBOutlet UILabel *videoTimeLength;
@property (weak, nonatomic) IBOutlet UILabel *videoAuthor;
@property (weak, nonatomic) IBOutlet UILabel *videoCount;


@end

@implementation EVSRecommendVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.videoCoverImgView.backgroundColor = LXUIRandomColor;
    self.videoTimeLength.layer.cornerRadius = 6;
    self.videoTimeLength.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

@end
