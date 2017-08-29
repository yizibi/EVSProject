//
//  EVSRefreshFooter.h
//  英语短视频
//
//  Created by hspcadmin on 2017/8/29.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface EVSRefreshFooter : MJRefreshAutoStateFooter


@property (weak, nonatomic, readonly) UIImageView *arrowView;
/** 菊花的样式 */
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;

/** 设置底部inset */
- (UIEdgeInsets)ignoreFooterInsets;
@end
