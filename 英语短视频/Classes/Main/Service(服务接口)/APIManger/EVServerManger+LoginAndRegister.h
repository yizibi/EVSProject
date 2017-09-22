//
//  EVServerManger+LoginAndRegister.h
//  英语短视频
//
//  Created by lilx on 2017/9/19.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVServerManger.h"

@interface EVServerManger (LoginAndRegister)


/**
 发送验证码
 
 @param phoneNumber 手机号
 @param type        类型
 @param areaCode    区域码
 @param success     success description
 @param fail        fail description
 */
+(void)getVerificationCodeByMobile:(NSString *)phoneNumber
                              type:(NSString *)type
                          areaCode:(NSString *)areaCode
                           success:(void (^)(NSDictionary *result))success
                              fail:(void (^)(NSError *error))fail;


/**
 用户注册
 
 @param mobile   手机号
 @param password 密码
 @param nickname 昵称
 @param success  success description
 @param fail     fail description
 */
+ (void)userRegisterMobile:(NSString *)mobile
                  password:(NSString *)password
                  nickname:(NSString *)nickname
               vertifyCode:(NSString *)vertifyCode
                   success:(void (^)(NSDictionary *result))success
                      fail:(void (^)(NSError *error))fail;


/**
 登录

 @param phoneNumber 手机号
 @param password 密码
 @param completionBlock completionBlock description
 */
+ (void)userLoginWithUserName:(NSString *)phoneNumber
                     password:(NSString *)password
              completionBlock:(void (^)(id responseObject))completionBlock;


@end
