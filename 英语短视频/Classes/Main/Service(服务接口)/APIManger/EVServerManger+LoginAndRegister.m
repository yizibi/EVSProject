//
//  EVServerManger+LoginAndRegister.m
//  英语短视频
//
//  Created by lilx on 2017/9/19.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVServerManger+LoginAndRegister.h"


@implementation EVServerManger (LoginAndRegister)

/** 获取验证码 */
+ (void)getVerificationCodeByMobile:(NSString *)phoneNumber type:(NSString *)type areaCode:(NSString *)areaCode success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"phone"]         = phoneNumber;
    params[@"type"]         = type;
    [[LXNetworkHandler sharedInstance] conURL:EVS_GetVertifyCode_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        if (success) {
            success(returnData);
        }
    } failureBlock:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];

}

#pragma mark - 登陆
/** 登录 */
+ (void)userLoginWithUserName:(NSString *)phoneNumber password:(NSString *)password completionBlock:(void (^)(id))completionBlock{
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"phone"]            = phoneNumber;
    params[@"password"]          = [password MD5];
    [[LXNetworkHandler sharedInstance] conURL:EVS_UserLogin_Url networkType:NetWorkPOST params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
        completionBlock(returnData);
    } failureBlock:^(NSError *error) {
        if (completionBlock) {
            completionBlock(error);
        }
    }];
}

#pragma mark - 注册
/** 注册 */
+ (void)userRegisterMobile:(NSString *)mobile password:(NSString *)password nickname:(NSString *)nickname vertifyCode:(NSString *)vertifyCode success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail {
    NSMutableDictionary *params  = [NSMutableDictionary dictionary];
    params[@"phone"]         = mobile;
    params[@"passWord"]         = [password MD5];
    params[@"captcha"]         = vertifyCode;
    [[LXNetworkHandler sharedInstance] conURL:EVS_UserRegister_Url networkType:NetWorkGET params:params delegate:nil showHUD:NO successBlock:^(id returnData) {
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
