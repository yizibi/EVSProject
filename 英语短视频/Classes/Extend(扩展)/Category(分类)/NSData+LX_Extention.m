//
//  NSData+LX_Extention.m
//  木言
//
//  Created by 李lucy on 16/8/22.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "NSData+LX_Extention.h"
#import "NSCalendar+LX_Extention.h"


@implementation NSData (LX_Extention)

+ (NSString *)stringByStringFormat:(NSString *)format data:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

- (BOOL)isThisYear{
    NSCalendar *calendar = [NSCalendar calendar];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    return selfYear == nowYear;
}

- (BOOL)isToday{
    //是否为今天
        NSCalendar *calendar = [NSCalendar calendar];
        //获得日期元素
        NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSDateComponents *comSelf = [calendar components:unit fromDate:self];
        NSDateComponents *comNow = [calendar components:unit fromDate:[NSDate date]];
        
        return comSelf.year == comNow.year  &&
        comSelf.month == comNow.month &&
        comSelf.day == comNow.day;

}
@end
