//
//  NSData+LX_Extention.h
//  木言
//
//  Created by 李lucy on 16/8/22.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LX_Extention)

- (BOOL)isThisYear;

+ (NSString *)stringByStringFormat:(NSString *)format data:(NSDate *)date;

- (BOOL)isToday;
@end
