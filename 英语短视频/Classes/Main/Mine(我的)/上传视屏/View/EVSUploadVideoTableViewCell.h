//
//  EVSUploadVideoTableViewCell.h
//  英语短视频
//
//  Created by 长缨在手 on 2017/9/6.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVSUploadVideoTableViewCell : UITableViewCell
/** 图片  */
@property (nonatomic, strong) UIImageView *leftImgV;
/** 图片的时间标识  */
@property (nonatomic, strong) UILabel *timeLabel;
/** 标题  */
@property (nonatomic, strong) UILabel *titleLabel;
/** 上传/多少次播放  */
@property (nonatomic, strong) UILabel *normalLabel;
/** 日期  */
@property (nonatomic, strong) UILabel *dateLabel;
/** 三个点  */
@property (nonatomic, strong) UIButton *threePointBtn;










@end
