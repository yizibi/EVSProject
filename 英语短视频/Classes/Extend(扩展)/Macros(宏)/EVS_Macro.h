

//
//  EVS_Macro.h
//  英语短视频
//
//  Created by hspcadmin on 2017/8/21.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#ifndef EVS_Macro_h
#define EVS_Macro_h



//尺寸相关
#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height
#define BOUNDS_WIDTH(v)  (v).bounds.size.width
#define BOUNDS_HEIGHT(v) (v).bounds.size.height
#define FRAME_WIDTH(v)   (v).frame.size.width
#define FRAME_HEIGHT(v)  (v).frame.size.height
#define X_WidthScale SCREEN_WIDTH/375
#define Y_HeightScale SCREEN_HEIGHT/667

//偏好存储
#define EVS_PLIST            [NSUserDefaults standardUserDefaults]
//通知
#define EVS_NotificationCenter [NSNotificationCenter defaultCenter]

//强弱引用
#define kweakSelf    __weak typeof(self) weakSelf = self;
#define kStrongSelf __strong typeof(weakSelf) strongSelf = weakSelf;




/*** 日志 ***/
#ifdef DEBUG
#define LXLog(...) NSLog(__VA_ARGS__)
#else
#define LXLog(...)
#endif

#define LXLogFunc LXLog(@"%s", __func__);


//颜色
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kUIColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define LXColor(r, g, b) kUIColor((r), (g), (b), 255)
#define LXUIRandomColor LXColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define LXrayColor(v) LXColor((v), (v), (v))
#define LXTableSeprateLineColor kUIColorFromRGB(0xe5e5e5)
#define LXCommongrayColor  kUIColorFromRGB(0xacacac)
#define LXNavgationTitleColor  kUIColorFromRGB(0x19181e)
#define LXNavgationTitleFont [UIFont systemFontOfSize:17]


#endif /* EVS_Macro_h */
