//
//  EVServerManger+EVSHome.h
//  英语短视频
//
//  Created by lilx on 2017/9/22.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVServerManger.h"

@interface EVServerManger (EVSHome)


/**
 获取导航数组

 @param success success description
 @param fail fail description
 */
+ (void)getAppNavigationSuccess:(void (^)(NSDictionary *result))success
                          fail:(void (^)(NSError *error))fail;


/**
 视频列表

 @param navigationType 类型
 @param navigationObjectId navigationObjectId description
 @param pageSize 每页显示数量
 @param pageIndex 当前页码
 @param success success description
 @param fail fail description
 */
+ (void)getVideoListWithNavigationType:(NSString *)navigationType
                    navigationObjectId:(NSString *)navigationObjectId
                              pageSize:(NSString *)pageSize
                             pageIndex:(NSString *)pageIndex
                               success:(void (^)(NSDictionary *result))success
                                  fail:(void (^)(NSError *error))fail;


/**
 添加评论

 @param content 评论内容
 @param type 视频类型
 @param objectID 视频id
 @param commentId 回复评论的id
 @param success success description
 @param fail fail description
 */
+ (void)commenttVideoWithContent:(NSString *)content
                    Videotype:(NSString *)type
                        object:(NSString *)objectID
                     commentId:(NSString *)commentId
                       success:(void (^)(NSDictionary *result))success
                          fail:(void (^)(NSError *error))fail;


/**
 点赞

 @param type 类型 video - 视频，comment - 评论
 @param objectID 对象id
 @param success success description
 @param fail fail description
 */
+ (void)followVideoWithType:(NSString *)type
                     object:(NSString *)objectID
                    success:(void (^)(NSDictionary *result))success
                       fail:(void (^)(NSError *error))fail;



/**
 取消点赞
 
 @param type 类型 video - 视频，comment - 评论
 @param objectID 对象id
 @param success success description
 @param fail fail description
 */
+ (void)cancelFollowVideoWithType:(NSString *)type
                     object:(NSString *)objectID
                    success:(void (^)(NSDictionary *result))success
                       fail:(void (^)(NSError *error))fail;


/**
 是否收藏
 
 @param type 类型 video - 视频，comment - 评论
 @param objectID 对象id
 @param success success description
 @param fail fail description
 */
+ (void)shouldCollectVideoWithType:(NSString *)type
                           object:(NSString *)objectID
                          success:(void (^)(NSDictionary *result))success
                             fail:(void (^)(NSError *error))fail;

/**
 添加收藏
 
 @param type 类型 video - 视频，comment - 评论
 @param objectID 对象id
 @param success success description
 @param fail fail description
 */
+ (void)addCollecttionVideoWithType:(NSString *)type
                           object:(NSString *)objectID
                          success:(void (^)(NSDictionary *result))success
                             fail:(void (^)(NSError *error))fail;



/**
 取消收藏
 
 @param type 类型 video - 视频，comment - 评论
 @param objectID 对象id
 @param success success description
 @param fail fail description
 */
+ (void)cancelCollecttionVideoWithType:(NSString *)type
                           object:(NSString *)objectID
                          success:(void (^)(NSDictionary *result))success
                             fail:(void (^)(NSError *error))fail;



/**
 添加关注

 @param toUserId 用户id
 @param success success description
 @param fail fail description
 */
+ (void)followUserWithID:(NSString *)toUserId
                 success:(void (^)(NSDictionary *result))success
                    fail:(void (^)(NSError *error))fail;


/**
 取消关注
 
 @param toUserId 用户id
 @param success success description
 @param fail fail description
 */
+ (void)cancelFollowUserWithID:(NSString *)toUserId
                 success:(void (^)(NSDictionary *result))success
                    fail:(void (^)(NSError *error))fail;



/**
 关注列表

 @param toUserId 用户id
 @param pageSize 每页显示数量
 @param pageIndex 当前页码
 @param success success description
 @param fail fail description
 */
+ (void)getFollowListUserWithID:(NSString *)toUserId
                       pageSize:(NSString *)pageSize
                      pageIndex:(NSString *)pageIndex
                 success:(void (^)(NSDictionary *result))success
                    fail:(void (^)(NSError *error))fail;

/**
 关注状态
 
 @param toUserId 用户id
 @param success success description
 @param fail fail description
 */
+ (void)getUserFollowStatusWithID:(NSString *)toUserId
                          success:(void (^)(NSDictionary *result))success
                             fail:(void (^)(NSError *error))fail;



/**
 粉丝列表
 
 @param toUserId 用户id
 @param pageSize 每页显示数量
 @param pageIndex 当前页码
 @param success success description
 @param fail fail description
 */
+ (void)getUserFansListUserWithID:(NSString *)toUserId
                       pageSize:(NSString *)pageSize
                      pageIndex:(NSString *)pageIndex
                        success:(void (^)(NSDictionary *result))success
                           fail:(void (^)(NSError *error))fail;





@end
