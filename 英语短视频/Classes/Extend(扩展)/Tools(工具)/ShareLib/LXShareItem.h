//
//  LXShareItem.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/2.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

#define  ALERT_MSG(TITLE,MESSAGE,CONTROLLER) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:TITLE message:MESSAGE preferredStyle:UIAlertControllerStyleAlert];\
[alertController addAction:[UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:nil]];\
[CONTROLLER presentViewController:alertController animated:YES completion:nil];

#define  LXCustomColor(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

@class LXShareItem;
typedef void (^__nullable shareHandle)(LXShareItem *item);

//预制的分享平台
extern NSString *const  LXPlatformNameSina;// 新浪微博
extern NSString *const  LXPlatformNameQQ;//QQ
extern NSString *const  LXPlatformNameEmail;//邮箱
extern NSString *const  LXPlatformNameSms;//短信
extern NSString *const  LXPlatformNameWechat;//微信
extern NSString *const  LXPlatformNameAlipay;//支付宝
extern NSString *const  LXPlatformNameQQCircle;//qq空间
extern NSString *const  LXPlatformNameWechatCircle;//微信朋友圈


/******************************没有图片、待补充***********************************************/
//extern NSString *const  LXPlatformNameTwitter;//推特
//extern NSString *const  LXPlatformNameFacebook;//脸书
//extern NSString *const  LXPlatformNameInstagram;//instagram
//extern NSString *const  LXPlatformNameNotes;//备忘录
//extern NSString *const  LXPlatformNameReminders;//提醒事项
//extern NSString *const  LXPlatformNameiCloud;//iCloud


//预制的分享事件
extern NSString *const  LXPlatformHandleSina;// 新浪微博
extern NSString *const  LXPlatformHandleQQ;//QQ
extern NSString *const  LXPlatformHandleEmail;//邮箱
extern NSString *const  LXPlatformHandleSms;//短信
extern NSString *const  LXPlatformHandleWechat;//微信
extern NSString *const  LXPlatformHandleAlipay;//支付宝
extern NSString *const  LXPlatformHandleTwitter;//推特
extern NSString *const  LXPlatformHandleFacebook;//脸书
extern NSString *const  LXPlatformHandleInstagram;//instagram
extern NSString *const  LXPlatformHandleNotes;//备忘录
extern NSString *const  LXPlatformHandleReminders;//提醒事项
extern NSString *const  LXPlatformHandleiCloud;//iCloud
extern NSString *const  LXPlatformHandleQQCilcle;//qq空间
extern NSString *const  LXPlatformHandleWeChatCilcle;//微信朋友圈


@interface LXShareItem : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, weak)UIViewController *presentVC;
@property (nonatomic, copy) shareHandle action;

@property (nullable, nonatomic, strong) NSString *shareText;
@property (nullable, nonatomic, strong) UIImage *shareImage;
@property (nullable, nonatomic, strong) NSURL *shareUrl;

/*
 * 调用以下代码获取手机中装的App的所有Share Extension的ServiceType
 
 SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
 
 * 我获得的部分数据
 
 com.taobao.taobao4iphone.ShareExtension  淘宝
 com.apple.share.Twitter.post  推特
 com.apple.share.Facebook.post 脸书
 com.apple.share.SinaWeibo.post 新浪微博
 com.apple.share.Flickr.post 雅虎
 com.burbn.instagram.shareextension   instagram
 com.amazon.AmazonCN.AWListShareExtension 亚马逊
 com.apple.share.TencentWeibo.post 腾讯微博
 com.smartisan.notes.SMShare 锤子便签
 com.zhihu.ios.Share 知乎
 com.tencent.mqq.ShareExtension QQ
 com.tencent.xin.sharetimeline 微信
 com.alipay.iphoneclient.ExtensionSchemeShare 支付宝
 com.apple.mobilenotes.SharingExtension  备忘录
 com.apple.reminders.RemindersEditorExtension 提醒事项
 com.apple.Health.HealthShareExtension      健康
 com.apple.mobileslideshow.StreamShareService  iCloud
 
 */


- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                       action:(shareHandle)action;

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                   actionName:(NSString *)actionName;

- (instancetype)initWithPlatformName:(NSString *)platformName;


@end

NS_ASSUME_NONNULL_END

