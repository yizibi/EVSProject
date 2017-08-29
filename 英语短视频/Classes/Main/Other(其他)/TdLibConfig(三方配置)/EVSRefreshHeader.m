
//
//  EVSRefreshHeader.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/29.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSRefreshHeader.h"

@implementation EVSRefreshHeader


//重写prepare方法,初始化头部刷新控件
- (void)prepare
{
    [super prepare];
    //自动根据下拉位置改变透明度
    self.automaticallyChangeAlpha = YES;
    //最后一次更新时间字体颜色
    self.lastUpdatedTimeLabel.textColor = LXrayColor(195);
    //刷新的字体颜色
    self.stateLabel.textColor = LXrayColor(195);
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在拼命加载..." forState:MJRefreshStateRefreshing];
    
}



@end
