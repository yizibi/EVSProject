//
//  EVSHomeVideoCell.h
//  英语短视频
//
//  Created by hspcadmin on 2017/8/29.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString *const EVSHomeVideoCellID = @"EVSHomeVideoCell";
@class  EVSHomeVideoCell;
@protocol EVSHomeVideoCellDelegate <NSObject>

@optional
- (void)homeVideoCell:(EVSHomeVideoCell *)videoCell didSelectButton:(UIButton *)button indexPath:(NSIndexPath *)indexPath;
- (void)homeVideoCell:(EVSHomeVideoCell *)videoCell didClickedHeadImg:(UITapGestureRecognizer *)tap indexPath:(NSIndexPath *)indexPath;
@end

@interface EVSHomeVideoCell : UITableViewCell

/** 代理  */
@property (nonatomic,weak) id<EVSHomeVideoCellDelegate> delegate;

/** indexPath */
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
