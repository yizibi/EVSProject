//
//  EVS_EnumDefines.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#ifndef EVS_EnumDefines_h
#define EVS_EnumDefines_h

#pragma mark - 登陆类型
typedef NS_ENUM(NSInteger,appLoginType) {
    /** 手机 */
    AppLoginTypePhone     = 0,
    /** 微博 */
    AppLoginTypeWeibo     = 2,
     /** 游客 */
    AppLoginTypeGuest   = 4,
     /** 微信登录 */
    AppLoginTypeWechat   = 1,
     /** QQ登录 */
    AppLoginTypeWQQ   = 3,

};


#endif /* EVS_EnumDefines_h */
