
//
//  EVSRefreshFooter.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/29.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSRefreshFooter.h"

#define Footer_Inset_Bottom 80

@interface EVSRefreshFooter ()
{
    __weak UIImageView *_arrowView;
}
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;

@end

@implementation EVSRefreshFooter

#pragma mark - 懒加载子控件
- (UIImageView *)arrowView
{
    if (!_arrowView) {
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"up_refresh_icon"]];
        [self addSubview:_arrowView = arrowView];
    }
    return _arrowView;
}

- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
    self.loadingView = nil;
    [self setNeedsLayout];
}
#pragma makr - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
    [self setTitle:@"" forState:MJRefreshStateIdle];
    [self setTitle:@"松开载入更多" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"加载完成" forState:MJRefreshStateNoMoreData];
    
    self.stateLabel.textColor = kUIColorFromRGB(0xABABAB);
    //
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    //
    //    // 忽略掉底部inset
    self.ignoredScrollViewContentInsetBottom = Footer_Inset_Bottom;
    
    self.automaticallyHidden = YES;
    
    
    
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    //    // 箭头
    //    self.arrowView.mj_size = CGSizeMake(22, 22);
    //    CGFloat arrowCenterX = self.mj_w * 0.5;
    //    if (!self.stateLabel.hidden) {
    //        arrowCenterX -= 65;
    //    }
    //    CGFloat arrowCenterY = self.mj_h * 0.5;
    //    self.arrowView.center = CGPointMake(arrowCenterX, arrowCenterY);
    //
    //    // 圈圈
    //    self.loadingView.frame = self.arrowView.frame;
}


- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    //    // 根据状态做事情
    //    if (state == MJRefreshStateIdle) {
    //        if (oldState == MJRefreshStateRefreshing) {
    //            self.arrowView.transform = CGAffineTransformMakeRotation(0.000001 - M_PI);
    //            [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
    //                self.loadingView.alpha = 0.0;
    //            } completion:^(BOOL finished) {
    //                self.loadingView.alpha = 1.0;
    //                [self.loadingView stopAnimating];
    //
    //                self.arrowView.hidden = NO;
    //            }];
    //        } else {
    //            self.arrowView.hidden = NO;
    //            [self.loadingView stopAnimating];
    //            [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
    //                self.arrowView.transform = CGAffineTransformMakeRotation(0.000001 - M_PI);
    //            }];
    //        }
    //    } else if (state == MJRefreshStatePulling) {
    //        self.arrowView.hidden = NO;
    //        [self.loadingView stopAnimating];
    //        [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
    //            self.arrowView.transform = CGAffineTransformIdentity;
    //        }];
    //    } else if (state == MJRefreshStateRefreshing) {
    //        self.arrowView.hidden = YES;
    //        [self.loadingView startAnimating];
    //    } else if (state == MJRefreshStateNoMoreData) {
    //        self.arrowView.hidden = YES;
    //        [self.loadingView stopAnimating];
    //    }
}



/** 设置底部inset */
- (UIEdgeInsets)ignoreFooterInsets{
    return UIEdgeInsetsMake(0, 0, Footer_Inset_Bottom, 0);
}


@end
