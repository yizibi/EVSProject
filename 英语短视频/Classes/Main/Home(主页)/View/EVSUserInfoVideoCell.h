//
//  EVSUserInfoVideoCell.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/15.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark - 下载过程类型
typedef NS_ENUM(NSInteger,videoAuditType) {
    /** 审核未通过 */
    videoNoAuditType            = 0,
    /** 审核中 */
    videoNoAuditingType         = 1,
    /** 上传过程中 */
    videoNoAuditUploadingType   = 2,
    
    /** 上传成功 */
    videoNoAuditUploadSuccessType   = 3,
    
    
    
};


@class EVSUserInfoVideoCell;
@protocol EVSUserInfoVideoCellDelegate <NSObject>

@optional
- (void)userInfoVideoCell:(EVSUserInfoVideoCell *)videoCell didSelectMoreButton:(UIButton *)button;
@end

@interface EVSUserInfoVideoCell : UITableViewCell

@property (nonatomic,weak) id<EVSUserInfoVideoCellDelegate> delegate;

/** 视频类型 */
@property (nonatomic, assign) videoAuditType videoAuditType;
@end
