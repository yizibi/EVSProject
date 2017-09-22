
//
//  EVServerManger+EVSHome.m
//  英语短视频
//
//  Created by lilx on 2017/9/22.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVServerManger+EVSHome.h"

@implementation EVServerManger (EVSHome)

#pragma mark - 导航数组
/** 导航数组 */
+ (void)getAppNavigationSuccess:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    [[LXNetworkHandler sharedInstance] conURL:EVS_GetAPPNavgationTitle_Url networkType:NetWorkGET params:nil delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 视频列表
/** 视频列表 */
+ (void)getVideoListWithNavigationType:(NSString *)navigationType navigationObjectId:(NSString *)navigationObjectId pageSize:(NSString *)pageSize pageIndex:(NSString *)pageIndex success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"navigationType"]        = navigationType;
    params[@"navigationObjectId"]    = navigationObjectId;
    params[@"pageSize"]         = pageSize;
    params[@"pageIndex"]         = pageIndex;
    [[LXNetworkHandler sharedInstance] conURL:EVS_HomeVideoList_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 添加评论
/** 添加评论 */
+ (void)commentVideoWithContent:(NSString *)content Videotype:(NSString *)type object:(NSString *)objectID commentId:(NSString *)commentId success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"content"]        = content;
    params[@"type"]    = type;
    params[@"object"]         = objectID;
    params[@"commentId"]         = commentId;
    [[LXNetworkHandler sharedInstance] conURL:EVS_addVideoComment_Url networkType:NetWorkPOST params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 点赞
/** 点赞 */
+ (void)followVideoWithType:(NSString *)type object:(NSString *)objectID success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"type"]        = type;
    params[@"object"]    = objectID;
    [[LXNetworkHandler sharedInstance] conURL:EVS_addFollow_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 取消点赞
/**取消点赞 */
+ (void)cancelFollowVideoWithType:(NSString *)type object:(NSString *)objectID success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"type"]        = type;
    params[@"object"]    = objectID;
    [[LXNetworkHandler sharedInstance] conURL:EVS_cancelFollow_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 是否收藏
/** 是否收藏 */
+ (void)shouldCollectVideoWithType:(NSString *)type object:(NSString *)objectID success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"type"]        = type;
    params[@"object"]    = objectID;
    [[LXNetworkHandler sharedInstance] conURL:EVS_cancelFollow_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 添加收藏
/** 添加收藏 */
+ (void)addCollecttionVideoWithType:(NSString *)type object:(NSString *)objectID success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"type"]        = type;
    params[@"object"]    = objectID;
    [[LXNetworkHandler sharedInstance] conURL:EVS_cancelFollow_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}
#pragma mark - 取消收藏
/**取消收藏 */
+ (void)cancelCollecttionVideoWithType:(NSString *)type object:(NSString *)objectID success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"type"]        = type;
    params[@"object"]    = objectID;
    [[LXNetworkHandler sharedInstance] conURL:EVS_cancelFollow_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 关注用户
+ (void)followUserWithID:(NSString *)toUserId success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"toUserId"]        = toUserId;
    [[LXNetworkHandler sharedInstance] conURL:EVS_followUser_Url networkType:NetWorkPOST params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 取消关注用户
+ (void)cancelFollowUserWithID:(NSString *)toUserId success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"toUserId"]        = toUserId;
    [[LXNetworkHandler sharedInstance] conURL:EVS_unFollowUser_Url networkType:NetWorkPOST params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 关注列表
+ (void)getFollowListUserWithID:(NSString *)toUserId pageSize:(NSString *)pageSize pageIndex:(NSString *)pageIndex success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"pageSize"]         = pageSize;
    params[@"pageIndex"]         = pageIndex;
    [[LXNetworkHandler sharedInstance] conURL:EVS_followUserList_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

#pragma mark - 关注状态
+ (void)getUserFollowStatusWithID:(NSString *)toUserId success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"toUserId"]         = toUserId;
    [[LXNetworkHandler sharedInstance] conURL:EVS_followUserStatus_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}


#pragma mark - 粉丝列表
+ (void)getUserFansListUserWithID:(NSString *)toUserId pageSize:(NSString *)pageSize pageIndex:(NSString *)pageIndex success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"toUserId"]         = toUserId;
    [[LXNetworkHandler sharedInstance] conURL:EVS_userFansList_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}






@end
