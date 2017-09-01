
//
//  LXUnityclass.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/31.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "LXUnityclass.h"

#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"


@implementation LXUnityclass


static LXUnityclass *unityObject = nil;


- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (LXUnityclass*)shareUnityClassObject
{
    if (unityObject == nil) {
        unityObject = [[LXUnityclass alloc] init];
    }
    return unityObject;
}
+(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

#pragma mark 弹出提示框
+ (void)showAlertView:(NSString*)str
{
    if (str)
    {
        if (![str isKindOfClass:[NSNull class]])
        {
            
            if (str.length!=0) {
                UIAlertView* alertDlg = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertDlg show];
            }
        }
        
    }
}

//
//+ (CGSize)getWithsize:(NSString *)str wid:(CGFloat)th font:(CGFloat)size
//{
//    CGSize constraint = CGSizeMake(th, 20000.0f);
//
//    if ([str isEqual:[NSNull null]])
//    {
//        str = @"";
//    }
//    CGSize sizeStr = [str sizeWithFont:YF_FONTSIZE(size) constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
//    return sizeStr;
//}


/*
 * *
 *
 * 距离将来某一个时间的时间差
 * 年差额 = dateCom.year, 月差额 = dateCom.month, 日差额 = dateCom.day, 小时差额 = dateCom.hour, 分钟差额 = dateCom.minute, 秒差额 = dateCom.second
 *
 */

+ (NSDateComponents *)insertFutureTime:(NSString *)futureTime
{
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *nowDate = [NSDate date];
    NSString *nowDateStr = [dateFomatter stringFromDate:nowDate];
    // 截止时间data格式
    NSDate *expireDate = [dateFomatter dateFromString:futureTime];
    // 当前时间data格式
    nowDate = [dateFomatter dateFromString:nowDateStr];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:nowDate toDate:expireDate options:0];
    return dateCom;
}
+ (NSString *)outByNum:(NSString *)num{
    if ([num isEqualToString:@"mon"]) {
        return NSLocalizedString(@"星期一", nil);
    }
    if ([num isEqualToString:@"tue"]) {
        return NSLocalizedString(@"星期二", nil);
    }
    if ([num isEqualToString:@"wed"]) {
        return NSLocalizedString(@"星期三", nil);
    }
    if ([num isEqualToString:@"thu"]) {
        return NSLocalizedString(@"星期四", nil);
    }
    if ([num isEqualToString:@"fri"]) {
        return NSLocalizedString(@"星期五", nil);
    }
    if ([num isEqualToString:@"sat"]) {
        return NSLocalizedString(@"星期六", nil);
    }
    if ([num isEqualToString:@"sun"]) {
        return NSLocalizedString(@"星期日", nil);
    }
    return nil;
}

//判断是否是整形
+ (BOOL)isPureInt:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
//判断是否是浮点型
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}
//判断是否是手机号码是否合法
#pragma mark - 判断是否是手机号码是否合法
+ (BOOL)checkTel:(NSString *)str
{
    //1[0-9]{10}
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    //    NSString *regex = @"[0-9]{11}";
    //    NSString *regex = @"^((13[0-9])|(147)|(157)|(177)|(170)|(15[^4,\\D])|(18[0,1,2,3,5-9]))\\d{8}$";
    NSString *regex = @"^(1[0-9])\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

/**
 *  判断手机号格式是否规范
 *
 *  @param password password description
 *
 *  @return return value description
 */
+ (BOOL)getPasswordGood:(NSString *)password;
{
    //    NSString *regex = @"/^(?=.{6,20}$)(?![0-9]+$)(?!.*(.).*\1)[0-9a-zA-Z]+$/";
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9_]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}


//判断邮箱地址是否合法
+ (BOOL) validateEmail: (NSString *) candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}


/**
 *  判断身份证号是否合法
 *
 *  @param cardId cardId description
 *
 *  @return return value description
 */
+ (BOOL)UserCard:(NSString *)cardId;
{
    NSString *cardStr =@"d{18}";
    NSPredicate *cardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cardStr];
    return [cardTest evaluateWithObject:cardId];
}

#pragma mark －获取当前系统的时间
/**
 *  NSDate *  senddate=[NSDate date];
 
 NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
 
 [dateformatter setDateFormat:@"YYYYMMdd"];
 
 NSString *  locationString=[dateformatter stringFromDate:senddate];
 
 NSLog(@"locationString:%@",locationString);
 *
 *  @return <#return value description#>
 */
+(NSString*)getCurrentTime
{
    
    
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    return locationString;
}



/**
 *  带格式的
 *
 *  @param type <#type description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)getCurrentTimeWith:(NSString *)type
{
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    //    [formatter setDateFormat:@"yyyy/MM/dd"];
    //    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:type];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    return locationString;
}


+(NSString*)strSepTime:(NSString*)strTime
{
    strTime = [strTime substringWithRange:NSMakeRange(0, 16)];
    return strTime;
}


/***************  金额小写转大写 start  ****************/
+(NSString *)converter:(NSString *)numStr
{//转换中文大写数字
    NSString *rel = nil;
    NSString *intStr = nil;
    NSString *floatStr1 = nil;
    NSString *floatStr2 = nil;
    NSRange range = [numStr rangeOfString:@"."];
    if (range.location != NSNotFound) {
        NSString *dStr = [numStr substringFromIndex:range.location+1];
        floatStr1 = [dStr substringToIndex:1];
        if (dStr.length == 2) {
            floatStr2 = [dStr substringFromIndex:1];
        }
        intStr = [numStr substringToIndex:range.location];
    }else{
        intStr = numStr;
    }
    
    NSString *topstr=[intStr stringByReplacingOccurrencesOfString:@"," withString:@""];//过滤逗号
    long numl=[topstr length];//确定长度
    NSString *cache;//缓存
    if ((numl==2||numl==6)&&[topstr hasPrefix:@"1"] ){//十位或者万位为一时候
        cache=@"拾";
        for (int i=1; i<numl; i++) {
            cache=[NSString stringWithFormat:@"%@%@",cache,[self bit:topstr thenum:i]];
        }
    }else{//其他
        cache=@"";
        for (int i=0; i<numl; i++) {
            cache=[NSString stringWithFormat:@"%@%@",cache,[self bit:topstr thenum:i]];
        }
    }//转换完大写
    rel = @"";
    if (![cache isEqualToString:@""]) {
        cache=[cache substringWithRange:NSMakeRange(0, [cache length]-1)];
    }else
    {
        cache = @"0";
    }
    for (NSInteger i=[cache length]; i>0; i--) {//擦屁股，如果尾部为0就擦除
        if ([cache hasSuffix:@"零"]) {
            cache=[cache substringWithRange:NSMakeRange(0, i-1)];
        }else{
            continue;
        }
    }
    for (NSInteger i=[cache length]; i>0; i--) {//重复零，删零
        NSString *a=[cache substringWithRange:NSMakeRange(i-1, 1)];
        NSString *b=[cache substringWithRange:NSMakeRange(i-2, 1)];
        if (!([a isEqualToString:b]&&[a isEqualToString:@"零"])) {
            rel = [NSString stringWithFormat:@"%@%@",a,rel];
        }
        cache=[cache substringWithRange:NSMakeRange(0, i-1)];
    }
    cache = rel;
    rel = @"元";
    for (NSInteger i=[cache length]; i>0; i--) {//去掉 “零万” 和 “亿万”
        NSString *a=[cache substringWithRange:NSMakeRange(i-1, 1)];
        NSString *b=[cache substringWithRange:NSMakeRange(i-2, 1)];
        if ([a isEqualToString:@"万"]&&[b isEqualToString:@"零"]) {
            NSString *c=[cache substringWithRange:NSMakeRange(i-3, 1)];
            if ([c isEqualToString:@"亿"]){
                rel = [NSString stringWithFormat:@"%@%@",c,rel];
                cache=[cache substringWithRange:NSMakeRange(0, i-3)];
                i=i-2;
            }else{
                rel = [NSString stringWithFormat:@"%@%@",a,rel];
                cache=[cache substringWithRange:NSMakeRange(0, i-2)];
                i--;
            }
        }else{
            rel = [NSString stringWithFormat:@"%@%@",a,rel];
        }
        cache=[cache substringWithRange:NSMakeRange(0, i-1)];
    }
    
    if ([rel isEqualToString:@"元"]) {
        rel=@"零元";
    }
    
    
    if (floatStr1!=nil )
    {
        if (floatStr2!=nil && ![floatStr2 isEqualToString:@"0"]) {
            rel = [NSString stringWithFormat:@"%@%@角%@分",rel,[self NumtoCN:floatStr1 site:0],[self NumtoCN:floatStr2 site:0]];
        }else{
            if (![floatStr1 isEqualToString:@"0"]) {
                rel = [NSString stringWithFormat:@"%@%@角",rel,[self NumtoCN:floatStr1 site:0]];
            }
        }
    }
    
    return rel;
}


+(NSString*)NumtoCN:(NSString*)string site:(long)site
{//阿拉伯数字转中文大写
    if ([string isEqualToString:@"0"]) {
        if (site==5) {
            return @"万零";
        }else{
            return @"零";
        }
    }else if ([string isEqualToString:@"1"]) {
        string=@"壹";
    }else if ([string isEqualToString:@"2"]) {
        string=@"贰";
    }else if ([string isEqualToString:@"3"]) {
        string=@"叁";
    }else if ([string isEqualToString:@"4"]) {
        string=@"肆";
    }else if ([string isEqualToString:@"5"]) {
        string=@"伍";
    }else if ([string isEqualToString:@"6"]) {
        string=@"陆";
    }else if ([string isEqualToString:@"7"]) {
        string=@"柒";
    }else if ([string isEqualToString:@"8"]) {
        string=@"捌";
    }else if ([string isEqualToString:@"9"]) {
        string=@"玖";
    }
    
    
    switch (site) {
        case 1:
            return [NSString stringWithFormat:@"%@元",string];
            break;
        case 2:
            return [NSString stringWithFormat:@"%@拾",string];
            break;
        case 3:
            return [NSString stringWithFormat:@"%@佰",string];
            break;
        case 4:
            return [NSString stringWithFormat:@"%@仟",string];
            break;
        case 5:
            return [NSString stringWithFormat:@"%@万",string];
            break;
        case 6:
            return [NSString stringWithFormat:@"%@拾",string];
            break;
        case 7:
            return [NSString stringWithFormat:@"%@佰",string];
            break;
        case 8:
            return [NSString stringWithFormat:@"%@仟",string];
            break;
        case 9:
            return [NSString stringWithFormat:@"%@亿",string];
            break;
        default:
            return string;
            break;
    }
}
+(NSString*)bit:(NSString*)string thenum:(int)num
{//取位转大写
    long site=[string length]-num;
    string=[string stringByReplacingOccurrencesOfString:@"," withString:@""];
    //    NSLog(@"传入字符串%@，总长度%d,传入位%d",string,[string length],num);
    string=[string substringWithRange:NSMakeRange(num,1)];
    string=[self NumtoCN:string site:site];
    //    NSLog(@"转换后:%@",string);
    return string;
    
}

/**
 *  手机号码隐藏 星号处理
 *
 *  @param phone phone description
 *
 *  @return return value description
 */
#pragma mark - 手机号码隐藏 星号处理
+ (NSString *)phoneNumberFromat:(NSString *)phone;
{
    NSMutableString *phoneNumber = [[NSMutableString alloc] initWithString:phone];
    [phoneNumber replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return phoneNumber;
}


/**
 *  获取textView的高度数据
 *
 *  @param textView  <#textView description#>
 *  @param strText   <#strText description#>
 *  @param font      <#font description#>
 *  @param Textwidth <#Textwidth description#>
 *
 *  @return return value description
 */
#pragma mark - 获取textView的高度数据
+ (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText textFont:(UIFont *)font textWidth:(int)Textwidth;
{
    float fPadding = 16.0; // 8.0px x 2
    CGSize constraint = CGSizeMake(Textwidth - fPadding, CGFLOAT_MAX);
    CGSize size = [strText sizeWithFont:font constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    float fHeight = size.height + 16.0;
    
    return fHeight;
}


/**
 *  比较2个时间的大小
 *
 *  @param firstDate firstDate description
 *  @param secDate   secDate description
 *
 *  @return return value description
 */
#pragma mark - 比较2个时间的大小
+ (int)compareDate:(NSString *)firstDate seconedDate:(NSString *)secDate
{
    firstDate = [firstDate stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    secDate = [secDate stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *first = [dateFormatter dateFromString:firstDate];
    NSDate *sec = [dateFormatter dateFromString:secDate];
    
    //第一个时间
    NSTimeInterval _fitstDate = [first timeIntervalSince1970]*1;
    //第二个时间
    NSTimeInterval _secondDate = [sec timeIntervalSince1970]*1;
    
    if (_fitstDate - _secondDate > 0)
    {
        //第一个时间大
        return 1;
    }else if (_fitstDate - _secondDate == 0)
    {
        return 0;
    }
    else
    {
        //第一个时间小
        return -1;
    }
}

//
//+ (UIView *)imageAndLabelWithFrame:(CGRect)frame imageFrame:(CGRect)imageFrame image:(UIImage *)imageStr labelFont:(int)font label:(NSString *)labelStr labelColor:(UIColor *)color;
//{
//    UIView *view = [[UIView alloc] initWithFrame:frame];
//
//    //左侧图标
//    UIImageView *logoImage = [[UIImageView alloc] initWithFrame:imageFrame];
//    logoImage.image = imageStr;
//    [view addSubview:logoImage];
//
//    //文字
//    UILabel *titleLB = [LXUnityclass initUILabel:labelStr font:font color:color rect:CGRectMake(DEF_RIGHT(logoImage)+5, DEF_TOP(logoImage), DEF_WIDTH(view) - DEF_WIDTH(logoImage) - 5, 20)];
//    titleLB.textAlignment = NSTextAlignmentLeft;
//    [view addSubview:titleLB];
//
//
//    return view;
//}

/**
 *  2个价格的控件 一个当前优惠  一个老价格  做电商怎么能没有这么牛B的控件
 *  控件缺点，没有考虑到 细微 的对其问题。根据字体大小不一样，暂时未解决2个价格的底部在一条水平线上，只有一个模糊的高度差  需要传值 微调
 *  @param frame      整个控件的宽度
 *  @param firstStr   第一个价格
 *  @param firstColor 颜色
 *  @param firstFont  字体
 *  @param twoStr     第二个价格
 *  @param twoColor   颜色
 *  @param twoFont    字体
 *  @param heightAltitude 高度差
 *
 *  @return 返回控件
 */
//#pragma mark -2个价格的控件 一个当前优惠  一个老价格  做电商怎么能没有这么牛B的控件控件缺点，没有考虑到 细微 的对其问题。根据字体大小不一样，暂时未解决2个价格的底部在一条水平线上，只有一个模糊的高度差  需要传值 微调
//+ (UIView *)twoPriceControllerWithWidth:(CGRect)frame firstPrice:(NSString *)firstStr firstPriceColor:(UIColor *)firstColor firstPriceFont:(int)firstFont twoPrice:(NSString *)twoStr twoPriceColor:(UIColor *)twoColor twoPriceFont:(int)twoFont heightAltitude:(int)height lineColor:(UIColor *)lineColor;
//{
//    UIView *downView = [[UIView alloc] initWithFrame:frame];
//    //第一个价格
//    float wid = [LXUnityclass getWidth:firstStr wid:20 font:firstFont];
//    UILabel *oneLB = [LXUnityclass initUILabel:firstStr font:firstFont color:firstColor rect:CGRectMake(0, 0, wid + 5, 20)];
//    [downView addSubview:oneLB];
//
//    //第二个价格
//    wid = [LXUnityclass getWidth:twoStr wid:20 font:twoFont];
//    UILabel *twoLB = [LXUnityclass initUILabel:twoStr font:twoFont color:twoColor rect:CGRectMake(DEF_RIGHT(oneLB), height, wid + 5, 20)];
//    [downView addSubview:twoLB];
//
//    //划线
//    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, DEF_HEIGHT(twoLB)/2-0.5, DEF_WIDTH(twoLB), 1)];
//    line.backgroundColor = lineColor;
//    [twoLB addSubview:line];
//
//    return downView;
//}
//
/**
 *  去除Tableview多余线条
 *
 *  @param tableView tableView description
 */
#pragma mark - 去除Tableview多余线条
+ (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

/**
 *  日期转换获取礼拜
 *
 *  @param inputDate inputDate description
 *
 *  @return return value description
 */
+ (NSString*)weekdayStringFromDate:(NSDate *)inputDate
{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}


/**
 *  系统时间月份转换为中文
 *
 *  @param valueStr 传入值
 *
 *  @return return value description
 */

+ (NSString *)monthWithChinaStr:(NSString *)valueStr;
{
    //数值为2位  01 - 12
    NSString *value;
    if (valueStr.length != 2)
    {
        [LXUnityclass showAlertView:@"格式是否错误?"];
    }else
    {
        NSString *first = [valueStr substringWithRange:NSMakeRange(0, 1)];
        NSString *seconed = [valueStr substringWithRange:NSMakeRange(1, 1)];
        if ([first isEqualToString:@"0"])
        {
            first = @"";
        }else
        {
            first = @"一十";
        }
        
        
        if ([seconed isEqualToString:@"0"])
        {
            seconed = @"";
        }else if ([seconed isEqualToString:@"1"])
        {
            seconed = @"一";
        }else if ([seconed isEqualToString:@"2"])
        {
            seconed = @"二";
        }else if ([seconed isEqualToString:@"3"])
        {
            seconed = @"三";
        }else if ([seconed isEqualToString:@"4"])
        {
            seconed = @"四";
        }else if ([seconed isEqualToString:@"5"])
        {
            seconed = @"五";
        }else if ([seconed isEqualToString:@"6"])
        {
            seconed = @"六";
        }else if ([seconed isEqualToString:@"7"])
        {
            seconed = @"七";
        }else if ([seconed isEqualToString:@"8"])
        {
            seconed = @"八";
        }else if ([seconed isEqualToString:@"9"])
        {
            seconed = @"九";
        }
        
        value = [NSString stringWithFormat:@"%@%@",first,seconed];
    }
    
    return value;
}

/**
 *  系统时间 日 转换为中文
 *
 *  @param valueStr 传入值
 *
 *  @return return value description
 */
+ (NSString *)dayWithChinaStr:(NSString *)valueStr;
{
    NSString *stt;
    if (valueStr.length != 2)
    {
        [LXUnityclass showAlertView:@"数据错误"];
    }else
    {
        NSString *first = [valueStr substringWithRange:NSMakeRange(0, 1)];
        if ([first isEqualToString:@"0"])
        {
            first = @"";
        }else if ([first isEqualToString:@"1"])
        {
            first = @"一十";
        }else if ([first isEqualToString:@"2"])
        {
            first = @"二十";
        }
        
        NSString *seconed = [valueStr substringWithRange:NSMakeRange(1, 1)];
        if ([seconed isEqualToString:@"0"])
        {
            seconed = @"";
        }else if ([seconed isEqualToString:@"1"])
        {
            seconed = @"一";
        }else if ([seconed isEqualToString:@"2"])
        {
            seconed = @"二";
        }else if ([seconed isEqualToString:@"3"])
        {
            seconed = @"三";
        }else if ([seconed isEqualToString:@"4"])
        {
            seconed = @"四";
        }else if ([seconed isEqualToString:@"5"])
        {
            seconed = @"五";
        }else if ([seconed isEqualToString:@"6"])
        {
            seconed = @"六";
        }else if ([seconed isEqualToString:@"7"])
        {
            seconed = @"七";
        }else if ([seconed isEqualToString:@"8"])
        {
            seconed = @"八";
        }else if ([seconed isEqualToString:@"9"])
        {
            seconed = @"九";
        }
        
        stt = [NSString stringWithFormat:@"%@%@",first,seconed];
    }
    
    return stt;
}


/**
 *  获取指定日期的 农历
 *
 *  @param date date description
 *
 *  @return return value description
 */
#pragma mark - 获取指定日期的 农历
+(NSString*)getChineseCalendarWithDate:(NSDate *)date
{
    
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    NSArray *chineseMonths = [NSArray arrayWithObjects:
                              @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                              @"九月", @"十月", @"冬月", @"腊月", nil];
    
    
    NSArray *chineseDays = [NSArray arrayWithObjects:
                            @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                            @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                            @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSLog(@"%ld_%ld_%ld  %@",(long)localeComp.year,(long)localeComp.month,(long)localeComp.day, localeComp.date);
    
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
    
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@-%@-%@",y_str,m_str,d_str];
    return chineseCal_str;
}
/**
 *  获取时间差
 *
 *  @param date date description
 *
 *  @return return value description
 */

+(NSString *) returnUploadTimeWithFirstTime:(NSString*)first secTime:(NSString*)sec
{
    
    //判断是否为同一天
    BOOL isToday;
    if ([[first substringToIndex:10] isEqualToString: [sec substringToIndex:10]
         ]) {
        isToday=YES;
    }else{
        isToday=NO;
    }
    
    NSString *timeString=@"";
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *firstDate=[date dateFromString:first];
    NSTimeInterval late=[firstDate timeIntervalSince1970]*1;
    
    NSDate *nowDate=[date dateFromString:sec];
    NSTimeInterval now=[nowDate timeIntervalSince1970]*1;
    NSTimeInterval cha=now-late;
    if (isToday==YES) {
        //是同一天
        if (cha/3600<1) {
            timeString = [NSString stringWithFormat:@"%f", cha/60];
            timeString = [timeString substringToIndex:timeString.length-7];
            timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
            if (cha/60<1) {
                timeString=@"1分钟内";
                
            }
            
        }else if (cha/3600>1&&cha/86400<1) {
            
            timeString=[NSString stringWithFormat:@"今天 %@",[first substringWithRange:NSMakeRange(11, 5)] ];
            
            
        }
    }else{
        //不是同一天
        if (cha/86400<1) {
            //昨天
            timeString=[NSString stringWithFormat:@"昨天 %@",[first substringWithRange:NSMakeRange(11, 5)] ];
        }else if (cha/86400>1&&cha/86400<3) {
            //前天
            timeString=[NSString stringWithFormat:@"前天 %@", [first substringWithRange:NSMakeRange(11, 5)]];
            
            
        }else
        {
            
            NSString *nowStr= [NSString stringWithFormat:@"%@",first];
            
            if ([[first substringToIndex:4] isEqualToString: [sec substringToIndex:4]
                 ]) {
                //是同一年
                timeString=[NSString stringWithFormat:@"%@月%@日 %@", [nowStr substringWithRange:NSMakeRange(5, 2)],[nowStr substringWithRange:NSMakeRange(8, 2)],[nowStr substringWithRange:NSMakeRange(11, 5)]] ;
                
                
            }else{
                //不是同一年
                
                timeString=[NSString stringWithFormat:@"%@", [nowStr substringToIndex:16]];
                
            }
            
        }
        
    }
    
    return timeString;
}



/**
 *  获取时间差只有月日
 *
 *  @param date date description
 *
 *  @return return value description
 */

+(NSString *) returnUploadDateWithFirstTime:(NSString*)first secTime:(NSString*)sec
{
    
    //判断是否为同一天
    BOOL isToday;
    if ([[first substringToIndex:10] isEqualToString: [sec substringToIndex:10]
         ]) {
        isToday=YES;
    }else{
        isToday=NO;
    }
    
    NSString *timeString=@"";
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *firstDate=[date dateFromString:first];
    NSTimeInterval late=[firstDate timeIntervalSince1970]*1;
    
    NSDate *nowDate=[date dateFromString:sec];
    NSTimeInterval now=[nowDate timeIntervalSince1970]*1;
    NSTimeInterval cha=now-late;
    if (isToday==YES) {
        //是同一天
        if (cha/3600<1) {
            timeString = [NSString stringWithFormat:@"%f", cha/60];
            timeString = [timeString substringToIndex:timeString.length-7];
            timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
            if (cha/60<1) {
                timeString=@"1分钟内";
                
            }
            
        }else if (cha/3600>1&&cha/86400<1) {
            
            timeString=[NSString stringWithFormat:@"今天 %@",[first substringWithRange:NSMakeRange(11, 5)] ];
            
            
        }
    }else{
        //不是同一天
        if (cha/86400<1) {
            //昨天
            timeString=[NSString stringWithFormat:@"昨天 %@",[first substringWithRange:NSMakeRange(11, 5)] ];
        }else if (cha/86400>1&&cha/86400<3) {
            //前天
            timeString=[NSString stringWithFormat:@"前天 %@", [first substringWithRange:NSMakeRange(11, 5)]];
            
            
        }else
        {
            
            NSString *nowStr= [NSString stringWithFormat:@"%@",first];
            
            if ([[first substringToIndex:4] isEqualToString: [sec substringToIndex:4]
                 ]) {
                //是同一年
                timeString=[NSString stringWithFormat:@"%@月%@日", [nowStr substringWithRange:NSMakeRange(5, 2)],[nowStr substringWithRange:NSMakeRange(8, 2)]] ;
                
                
            }else{
                //不是同一年
                
                timeString=[NSString stringWithFormat:@"%@", [nowStr substringToIndex:16]];
                
            }
            
        }
        
    }
    
    return timeString;
}
/**
 *  字典获取防崩溃处理
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
#pragma mark - 字典获取防崩溃处理
+ (void)setPersistentValue:(NSString *)value key:(NSString *)key
{
    
    if ([value isKindOfClass:[NSNull class]])
    {
        DEF_PERSISTENT_SET_OBJECT(@"", key);
    }
    else if(!value)
    {
        DEF_PERSISTENT_SET_OBJECT(@"", key);
    }
    
    else
    {
        DEF_PERSISTENT_SET_OBJECT(value, key);
    }
    
}

@end
