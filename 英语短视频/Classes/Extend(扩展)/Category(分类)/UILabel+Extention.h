//
//  UILabel+Extention.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/5.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extention)


/**
 快捷创建一个lable

 @param text 文本内容
 @param textColor 文本颜色
 @param font 文本大小
 @param textAlignment 文字居中
 @param line 多行显示
 @return lable
 */
+ (instancetype)lableWithTitle:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font textAlignmengt:(NSTextAlignment)textAlignment lins:(CGFloat)line;


/**
 快捷创建一个lable
 
 @param text 文本内容
 @param textColor 文本颜色
 @param font 文本大小
 @param textAlignment 文字居中
 @param line 多行显示
 @return lable
 */
- (instancetype)initWithTitle:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font textAlignmengt:(NSTextAlignment)textAlignment lins:(CGFloat)line;
@end
