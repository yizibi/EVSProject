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

#pragma mark - 视频按钮点击
typedef NS_ENUM(NSInteger,videoMoreButtonClicKType) {
    /** 喜欢 */
    videoMoreButtonClicKLikeType     = 0,
    /** 评论 */
    videoMoreButtonClicKCommentType     = 1,
    /** 分享 */
    videoMoreButtonClicKShareType   = 2,
    /** 更多 */
    videoMoreButtonClicKMoreType   = 3,
    /** 播放 */
    videoMoreButtonClicKPlayType   = 4,

};

#pragma mark - 关注类型
typedef NS_ENUM(NSInteger,attentionType) {
    /** 关注 */
    attentionUserType     = 0,
    /** 已关注 */
    attentionHaveType     = 1,
    /** 相互关注 */
    attentionEachotherType   = 2,
    
};

#pragma mark - 用户类型
typedef NS_ENUM(NSInteger,userType) {
    /** 用户自己 */
    userTypeSelf     = 0,
    /** 别人 */
    userTypeOther     = 1,
    
};



#endif /* EVS_EnumDefines_h */
