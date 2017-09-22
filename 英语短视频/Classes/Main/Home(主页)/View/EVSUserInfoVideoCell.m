//
//  EVSUserInfoVideoCell.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/15.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSUserInfoVideoCell.h"



@interface EVSUserInfoVideoCell()
@property (weak, nonatomic) IBOutlet UIImageView *videoCoverImgView;
@property (weak, nonatomic) IBOutlet UILabel *videoLengthLable;
@property (weak, nonatomic) IBOutlet UILabel *titlename;
@property (weak, nonatomic) IBOutlet UILabel *playCountLable;
@property (weak, nonatomic) IBOutlet UILabel *publishLable;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end

@implementation EVSUserInfoVideoCell

- (IBAction)moreButtonClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(userInfoVideoCell:didSelectMoreButton:)]) {
        [self.delegate userInfoVideoCell:self didSelectMoreButton:sender];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.videoCoverImgView.backgroundColor = LXUIRandomColor;
    self.videoLengthLable.layer.cornerRadius = 6;
    self.videoLengthLable.layer.masksToBounds = YES;
}


- (void)setVideoAuditType:(videoAuditType)videoAuditType {
    _videoAuditType = videoAuditType;
    if (videoAuditType == videoNoAuditUploadingType) {
        //上传过程中
        self.playCountLable.textColor = kUIColorFromRGB(0xFD4C4C);
        self.playCountLable.text = @"上传中...20%";
    }
    else if (videoAuditType == videoNoAuditingType) {
        //审核中
        self.playCountLable.textColor = kUIColorFromRGB(0xFD4C4C);
        self.playCountLable.text = @"审核中…";

    }
    else if (videoAuditType == videoNoAuditType) {
        //审核不通过
        self.playCountLable.textColor = kUIColorFromRGB(0xFD4C4C);
        self.playCountLable.text = @"审核未通过";

    }
    else {
         self.playCountLable.textColor = kUIColorFromRGB(0x999999);
        self.playCountLable.text = @"1万次播放";

    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

@end
