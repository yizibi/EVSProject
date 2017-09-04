//
//  UIGestureRecognizer+Extention.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/2.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (Extention)

- (instancetype)initWithActionBlock:(void (^)(id sender))block;

- (void)addActionBlock:(void (^)(id sender))block;

- (void)removeAllActionBlocks;

@end
