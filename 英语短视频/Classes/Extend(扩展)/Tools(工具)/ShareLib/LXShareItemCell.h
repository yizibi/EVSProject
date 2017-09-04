//
//  LXShareItemCell.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/2.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXShareItem.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const  kCellIdentifier_LXShareItemCell;// 循环利用的id
@interface LXShareItemCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLable;

@property (nonatomic, strong) LXShareItem *shareItem;

@property (nonatomic) CGSize itemImageSize; //item中image大小
@property (nonatomic) CGFloat itemImageTopSpace; //item图片距离顶部大小
@property (nonatomic) CGFloat iconAndTitleSpace; //item图片和文字距离
@property (nonatomic, assign) BOOL showBorderLine; //是否显示边界线
NS_ASSUME_NONNULL_END

@end
