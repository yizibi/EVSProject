//
//  EVS_BaseDefineUrl.h
//  英语短视频
//
//  Created by lilx on 2017/9/22.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#ifndef EVS_BaseDefineUrl_h
#define EVS_BaseDefineUrl_h


#pragma mark - 获取验证码
#define EVS_GetVertifyCode_Url [NSString stringWithFormat:@"%@/sms/sendCaptcha",APP_SERVER_BASE_URL]
#pragma mark - 导航数组
#define EVS_GetAPPNavgationTitle_Url [NSString stringWithFormat:@"%@/sms/sendCaptcha",APP_SERVER_BASE_URL]
#pragma mark - 登录
#define EVS_UserLogin_Url [NSString stringWithFormat:@"%@/user/login",APP_SERVER_BASE_URL]
#pragma mark - 注册
#define EVS_UserRegister_Url [NSString stringWithFormat:@"%@/user/register",APP_SERVER_BASE_URL]
#pragma mark - 视频列表
#define EVS_HomeVideoList_Url [NSString stringWithFormat:@"%@/video/list",APP_SERVER_BASE_URL]
#pragma mark - 添加评论
#define EVS_addVideoComment_Url [NSString stringWithFormat:@"%@/comment/add",APP_SERVER_BASE_URL]
#pragma mark - 添加点赞
#define EVS_addFollow_Url [NSString stringWithFormat:@"%@/like",APP_SERVER_BASE_URL]
#pragma mark - 取消点赞
#define EVS_cancelFollow_Url [NSString stringWithFormat:@"%@/like/cancel",APP_SERVER_BASE_URL]
#pragma mark - 是否收藏
#define EVS_shouldCollect_Url [NSString stringWithFormat:@"%@/favorite/isFavorite",APP_SERVER_BASE_URL]
#pragma mark - 收藏
#define EVS_addCollect_Url [NSString stringWithFormat:@"%@/favorite",APP_SERVER_BASE_URL]
#pragma mark - 取消收藏
#define EVS_cancelCollect_Url [NSString stringWithFormat:@"%@/favorite/cancel",APP_SERVER_BASE_URL]
#pragma mark - 关注
#define EVS_followUser_Url [NSString stringWithFormat:@"%@/user/follow",APP_SERVER_BASE_URL]
#pragma mark - 取消关注
#define EVS_unFollowUser_Url [NSString stringWithFormat:@"%@/user/unfollow",APP_SERVER_BASE_URL]
#pragma mark - 关注列表
#define EVS_followUserList_Url [NSString stringWithFormat:@"%@/user/followers",APP_SERVER_BASE_URL]
#pragma mark - 关注状态
#define EVS_followUserStatus_Url [NSString stringWithFormat:@"%@//user/followStatus",APP_SERVER_BASE_URL]
#pragma mark - 粉丝列表
#define EVS_userFansList_Url [NSString stringWithFormat:@"%@/user/fans",APP_SERVER_BASE_URL]






#endif /* EVS_BaseDefineUrl_h */
