//
//  UILabel+Extention.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/5.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "UILabel+Extention.h"

@implementation UILabel (Extention)

+ (instancetype)lableWithTitle:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font textAlignmengt:(NSTextAlignment)textAlignment lins:(CGFloat)line {
    UILabel *lable = [[UILabel alloc] init];
    lable.text = text;
    lable.textColor = textColor;
    lable.textAlignment = textAlignment;
    lable.numberOfLines = line;
    lable.font = [UIFont systemFontOfSize:font];
    return lable;
}

- (instancetype)initWithTitle:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font textAlignmengt:(NSTextAlignment)textAlignment lins:(CGFloat)line {
    return [UILabel lableWithTitle:text textColor:textColor font:font textAlignmengt:textAlignment lins:line];
}

@end
