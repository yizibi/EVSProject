//
//  EVSFansOrAttentionCell.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/16.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const EVSFansOrAttentionCellID = @"EVSFansOrAttentionCellID";

@protocol EVSFansOrAttentionCellDelegate <NSObject>

- (void)fansOrAttentionCellDidSeledtedAttentionButton:(UIButton *)attentionButton;

@end

@interface EVSFansOrAttentionCell : UITableViewCell

/** 代理  */
@property (nonatomic,weak) id<EVSFansOrAttentionCellDelegate> delegate;


/** 关注类型 */
@property (nonatomic, assign) attentionType attentionType;

@end
