//
//  NSString+LXExtention.h
//  汪汪配
//
//  Created by 李lucy on 15/11/17.
//  Copyright © 2015年 Lucy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LXExtention)


/**
 交换两个方法

 @param originalSelector 原始方法
 @param swizzledSelector 替换方法
 */
+ (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;


/**  计算文字的宽高 */
- (CGSize)calculatorTextSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

/**  比较版本号 */
- (NSComparisonResult)compareVersion:(NSString *)version;

/**  时间戳转化为字符串时间 */
+ (NSString *)getDateString:(NSTimeInterval)timeInterval;

/**  计算距离 */
+ (NSString *)getDistanceStr:(CGFloat)distance;

/**
 *  手机号验证
 *
 *  @return 是否可用
 */
- (BOOL)isValidatePhoneNum;
#pragma mark - MD5加密
- (NSString *)MD5;
/**
 *  计算文件的总大小
 *
 *  @return 字节数
 */
- (unsigned long long)fileSize;


/**
 *  生成缓存目录的全路径
 */
- (instancetype)cachesDir;
/**
 *  生成文档目录的全路径
 */
- (instancetype)docDir;
/**
 *  生成临时目录的 全路径
 */
- (instancetype)temDir;
@end
