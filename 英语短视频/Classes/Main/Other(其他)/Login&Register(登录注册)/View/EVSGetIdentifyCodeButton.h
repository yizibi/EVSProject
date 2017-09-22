//
//  EVSGetIdentifyCodeButton.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/14.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark - 验证码类型
typedef NS_ENUM(NSInteger,VertifyCodeType) {
    VertifyCodeTypeRegister = 1, /** 注册 */
    VertifyCodeTypeModifyPassWord = 2, /** 修改密码 */
    VertifyCodeTypeModifyPersonInfo = 3, /** 修改密码 */
    VertifyCodeTypeModifyMobilePhone = 4, /** 修改手机号 */
};

@interface EVSGetIdentifyCodeButton : UIButton
+ (instancetype)indentifyCodeButton;
+ (CGSize)getDefaultSize;
- (void)getIdentifyCodeWithPhoneNumber:(NSString *)phoneNumber
                                  type:(NSString *)type
                              areaCode:(NSString *)areaCode
                               success:(void (^)(NSDictionary *result))success
                                  fail:(void (^)(NSError *error))fail;
- (void)commitVerificationCode:(NSString *)verificationCode phoneNumber:(NSString *)phoneNumber;
@end
