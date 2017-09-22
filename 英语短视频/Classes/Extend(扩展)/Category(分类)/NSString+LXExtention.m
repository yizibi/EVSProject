//
//  NSString+LXExtention.m
// 汪汪配
//
//  Created by 李lucy on 15/11/17.
//  Copyright © 2015年 Lucy. All rights reserved.
//

#import "NSString+LXExtention.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSData+LX_Extention.h"


@implementation NSString (LXExtention)


+ (void)swizzleMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    //原有方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    //替换原有方法的新方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    //先尝试給源SEL添加IMP，这里是为了避免源SEL没有实现IMP的情况
    BOOL didAddMethod = class_addMethod(class,originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {//添加成功：说明源SEL没有实现IMP，将源SEL的IMP替换到交换SEL的IMP
        class_replaceMethod(class,swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {//添加失败：说明源SEL已经有IMP，直接将两个SEL的IMP交换即可
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


/**
 *  计算文字的宽高
 *  @param maxSize 最大的显示范围
 *  @param font    字体大小
 *  @return 文字的size
 */
- (CGSize)calculatorTextSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


/**
 *  比较版本号
 */
- (NSComparisonResult)compareVersion:(NSString *)version{
    return [self compare:version options:NSNumericSearch];
}

/**
 *  时间戳转化为字符串时间
 */
+ (NSString *)getDateString:(NSTimeInterval)timeInterval
{
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval subTimeInterval = nowTimeInterval - timeInterval;
    
    if(subTimeInterval < 60) // 小于1分钟
    {
        return @"刚刚";
    }
    else if (subTimeInterval < 60 * 60) // 小于一小时
    {
        return [NSString stringWithFormat:@"%0.f分钟前", floor(subTimeInterval / 60)];
    }
    else
    {
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
        
        NSString *dateStr = [NSData stringByStringFormat:@"yyyy-M-d" data:date];
        NSString *nowDateStr = [NSData stringByStringFormat:@"yyyy-M-d" data:nowDate];
        
        if ([dateStr isEqualToString:nowDateStr])
        {
            // 当天
           return [NSData stringByStringFormat:@"H:mm" data:date];
        }
        else
        {
            NSDate *yesterday = [NSDate dateWithTimeIntervalSince1970:[nowDate timeIntervalSince1970] - (24 * 60 * 60)];
            NSString* yesterdatStr = [NSData stringByStringFormat:@"yyyy-M-d" data:yesterday];
            
            if ([dateStr isEqualToString:yesterdatStr]) // 昨天
            {
                return [NSString stringWithFormat:@"昨天 %@",
                        [NSData stringByStringFormat:@"H:mm"
                                                data:date]];
            }
            else
            {
                NSString *dateStr = [NSData stringByStringFormat:@"yyyy" data:date];
                NSString *curDateStr = [NSData stringByStringFormat:@"yyyy" data:nowDate];
                if ([dateStr isEqualToString:curDateStr]) // 当年
                {
                    return  [NSData stringByStringFormat:@"M-d"
                                                    data:date];
                }
                else // 超过一年
                {
                    return [NSData stringByStringFormat:@"yyyy-M-d hh:mm:ss"
                                                   data:date];
                }
            }
        }
    }
}

/**
 *  计算距离
 */
+ (NSString *)getDistanceStr:(CGFloat)distance
{
    
    NSString *distanceString = nil;
    if (distance < 0)
    {
        distance = 0;
    }
    if(distance >= 1000)
    {
        distance = distance / 1000;
        distanceString = [NSString stringWithFormat:@"%.1fkm", distance];
    }
    else
    {
        distanceString = [NSString stringWithFormat:@"%.0fm", distance];
    }
    
    return distanceString;
}


#pragma mark - 验证手机号
- (BOOL)isValidatePhoneNum
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        if([regextestcm evaluateWithObject:self] == YES) {
            LXLog(@"中国移动");
        } else if([regextestct evaluateWithObject:self] == YES) {
            NSLog(@"中国电信");
        } else if ([regextestcu evaluateWithObject:self] == YES) {
            LXLog(@"中国联通");
        } else {
            LXLog(@"其他号码");
        }
        
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - MD5加密
- (NSString *)MD5{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];

}
- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}

#pragma mark - 沙盒缓存
- (instancetype)cachesDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)docDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)temDir
{
    NSString *dir = NSTemporaryDirectory();
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

#pragma mark - 文件大小
- (unsigned long long)fileSize
{
    //文件总大小
    unsigned long long size = 0;
    //文件管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    //是否为文件
    BOOL isDictory = NO;
    //判断路径是否存在
    BOOL exists = [manger fileExistsAtPath:self isDirectory:&isDictory];
    if (!exists) return size;
    if (isDictory) {//文件夹
        //文件遍历器,也称迭代器
        NSDirectoryEnumerator *dictEnum = [manger enumeratorAtPath:self];
        //    NSLog(@"%@",dictEnum);
        for (NSString *subPath in dictEnum) {
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            size += [manger attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    }else {//文件
        size += [manger attributesOfItemAtPath:self error:nil].fileSize;

    }
    return size;
}

@end
