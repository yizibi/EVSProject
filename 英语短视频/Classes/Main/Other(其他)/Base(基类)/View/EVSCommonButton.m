
//
//  EVSCommonButton.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/29.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSCommonButton.h"



@implementation EVSCommonButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
        
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, -3, 0, 0)];
        
        [self setTitleColor:LXTitleCommonColor forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:12.0];
        
        
    }
    return self;
}


- (void)setHighlighted:(BOOL)highlighted{}


@end
