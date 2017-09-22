//
//  NSCalendar+LX_Extention.m
//  木言
//
//  Created by 李lucy on 16/8/21.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "NSCalendar+LX_Extention.h"

@implementation NSCalendar (LX_Extention)
+ (instancetype)calendar
{
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}
@end
