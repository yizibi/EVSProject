//
//  LXShareItem.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/2.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "LXShareItem.h"
#import <Social/Social.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h>

NSString *const  LXPlatformNameSina = @"LXPlatformNameSina";
NSString *const  LXPlatformNameQQ = @"LXPlatformNameQQ";
NSString *const  LXPlatformNameEmail = @"LXPlatformNameEmail";
NSString *const  LXPlatformNameSms = @"LXPlatformNameSms";
NSString *const  LXPlatformNameWechat = @"LXPlatformNameWechat";
NSString *const  LXPlatformNameAlipay = @"LXPlatformNameAlipay";
NSString *const  LXPlatformNameQQCircle = @"LXPlatformNameQQCircle";//qq空间
NSString *const  LXPlatformNameWechatCircle = @"LXPlatformNameWechatCircle";//微信朋友圈


//NSString *const  LXPlatformNameTwitter = @"LXPlatformNameTwitter";
//NSString *const  LXPlatformNameFacebook = @"LXPlatformNameFacebook";
//NSString *const  LXPlatformNameInstagram = @"LXPlatformNameInstagram";
//NSString *const  LXPlatformNameNotes = @"LXPlatformNameNotes";
//NSString *const  LXPlatformNameReminders = @"LXPlatformNameReminders";
//NSString *const  LXPlatformNameiCloud = @"LXPlatformNameiCloud";


NSString *const  LXPlatformHandleSina = @"LXPlatformHandleSina";
NSString *const  LXPlatformHandleQQ = @"LXPlatformHandleQQ";
NSString *const  LXPlatformHandleEmail = @"LXPlatformHandleEmail";
NSString *const  LXPlatformHandleSms = @"LXPlatformHandleSms";
NSString *const  LXPlatformHandleWechat = @"LXPlatformHandleWechat";
NSString *const  LXPlatformHandleAlipay = @"LXPlatformHandleAlipay";
NSString *const  LXPlatformHandleTwitter = @"LXPlatformHandleTwitter";
NSString *const  LXPlatformHandleFacebook = @"LXPlatformHandleFacebook";
NSString *const  LXPlatformHandleInstagram = @"LXPlatformHandleInstagram";
NSString *const  LXPlatformHandleNotes = @"LXPlatformHandleNotes";
NSString *const  LXPlatformHandleReminders = @"LXPlatformHandleReminders";
NSString *const  LXPlatformHandleiCloud = @"LXPlatformHandleiCloud";
NSString *const  LXPlatformHandleQQCilcle = @"LXPlatformHandleQQCilcle";//qq空间
NSString *const  LXPlatformHandleWeChatCilcle = @"LXPlatformHandleWeChatCilcle";//微信朋友圈
@interface LXShareItem()<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@end

@implementation LXShareItem

#pragma mark - 初始化方法

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                       action:(shareHandle)action
{
    NSParameterAssert(title.length || image);
    
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _action = action;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                   actionName:(NSString *)actionName
{
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _action = [self actionFromString:actionName];
    }
    return self;
}

- (instancetype)initWithPlatformName:(NSString *)platformName{
    
    /******************************各种平台***********************************************/
    NSDictionary *messageDict;
    if ([platformName isEqualToString:LXPlatformNameSina]) {
        messageDict = @{@"image":@"share_sina",@"title":@"新浪微博",@"action":LXPlatformHandleSina};
    }
    if ([platformName isEqualToString:LXPlatformNameQQ]) {
        messageDict = @{@"image":@"share_qq",@"title":@"QQ",@"action":LXPlatformHandleQQ};
    }
    //新增
    if ([platformName isEqualToString:LXPlatformNameQQCircle]) {
        messageDict = @{@"image":@"share_qqCircle",@"title":@"QQ空间",@"action":LXPlatformHandleQQCilcle};
    }
    //朋友圈
    if ([platformName isEqualToString:LXPlatformNameWechatCircle]) {
        messageDict = @{@"image":@"share_weixinCircle",@"title":@"朋友圈",@"action":LXPlatformHandleWeChatCilcle};
    }
    
    if ([platformName isEqualToString:LXPlatformNameEmail]) {
        messageDict = @{@"image":@"share_email",@"title":@"邮件",@"action":LXPlatformHandleEmail};
    }
    if ([platformName isEqualToString:LXPlatformNameSms]) {
        messageDict = @{@"image":@"share_sms",@"title":@"短信",@"action":LXPlatformHandleSms};
    }
    if ([platformName isEqualToString:LXPlatformNameWechat]) {
        messageDict = @{@"image":@"share_weixin",@"title":@"微信",@"action":LXPlatformHandleWechat};
    }
    if ([platformName isEqualToString:LXPlatformNameAlipay]) {
        messageDict = @{@"image":@"share_alipay",@"title":@"支付宝",@"action":LXPlatformHandleAlipay};
    }
    
    /*********************************end************************************************/
    
    self = [super init];
    if (self) {
        _title = (messageDict[@"title"] ? messageDict[@"title"] : @"");
        _image = [UIImage imageNamed:[@"LXShareImage.bundle" stringByAppendingPathComponent:messageDict[@"image"]]];
        _action = [self actionFromString:messageDict[@"action"]];
    }
    return self;
}

#pragma mark - 私有方法

//字符串转 Block
- (shareHandle)actionFromString:(NSString *)handleName{
    
    shareHandle handle = ^(LXShareItem *item){
        NSString *tipPlatform;
        if ([handleName isEqualToString:LXPlatformHandleEmail]) {
            [self sendmailTO:@""];
            return ;
        }
        if ([handleName isEqualToString:LXPlatformHandleSms]) {
            [self sendMessageTO:@""];
            return ;
        }
        /******************************各种平台***********************************************/
        NSString *platformID;
        if ([handleName isEqualToString:LXPlatformHandleSina]) {
            platformID = @"com.apple.share.SinaWeibo.post";
            tipPlatform = @"新浪微博";
        }
        if ([handleName isEqualToString:LXPlatformHandleQQ]) {
            platformID = @"com.tencent.mqq.ShareExtension";
            tipPlatform = @"QQ";
        }
        if ([handleName isEqualToString:LXPlatformHandleWechat]) {
            platformID = @"com.tencent.xin.sharetimeline";
            tipPlatform = @"微信";
        }
        if ([handleName isEqualToString:LXPlatformHandleAlipay]) {
            platformID = @"com.alipay.iphoneclient.ExtensionSchemeShare";
            tipPlatform = @"支付宝";
        }
        
        if ([handleName isEqualToString:LXPlatformHandleQQCilcle]) {
            platformID = @"com.tencent.mqq.ShareExtension";
            tipPlatform = @"qq空间";
        }
        if ([handleName isEqualToString:LXPlatformHandleWeChatCilcle]) {
            platformID = @"com.tencent.xin.sharetimeline";
            tipPlatform = @"微信朋友圈";
        }
        if ([handleName isEqualToString:LXPlatformHandleTwitter]) {
            platformID = @"com.apple.share.Twitter.post";
            tipPlatform = @"推特";
        }
        if ([handleName isEqualToString:LXPlatformHandleFacebook]) {
            platformID = @"com.apple.share.Facebook.post";
            tipPlatform = @"脸书";
        }
        if ([handleName isEqualToString:LXPlatformHandleInstagram]) {
            platformID = @"com.burbn.instagram.shareextension";
            tipPlatform = @"instagram";
        }
        if ([handleName isEqualToString:LXPlatformHandleNotes]) {
            platformID = @"com.apple.mobilenotes.SharingExtension";
            tipPlatform = @"备忘录";
        }
        if ([handleName isEqualToString:LXPlatformHandleReminders]) {
            platformID = @"com.apple.reminders.RemindersEditorExtension";
            tipPlatform = @"提醒事项";
        }
        if ([handleName isEqualToString:LXPlatformHandleiCloud]) {
            platformID = @"com.apple.mobileslideshow.StreamShareService";
            tipPlatform = @"iCloud";
        }
        
        /********************************end*************************************************/
        
        NSString *UNLoginTip = [NSString stringWithFormat:@"没有配置%@相关的帐号",tipPlatform];
        NSString *UNInstallTip = [NSString stringWithFormat:@"没有安装%@",tipPlatform];
        
        SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:platformID];
        if (composeVc == nil){
            ALERT_MSG(@"提示",UNInstallTip,_presentVC);
            return;
        }
        if (![SLComposeViewController isAvailableForServiceType:platformID]) {
            ALERT_MSG(@"提示",UNLoginTip,_presentVC);
            return;
        }
        if (_shareText) [composeVc setInitialText:_shareText];
        if (_shareImage) [composeVc addImage:_shareImage];
        if (_shareUrl) [composeVc addURL:_shareUrl];
        
        [_presentVC presentViewController:composeVc animated:YES completion:nil];
        composeVc.completionHandler = ^(SLComposeViewControllerResult result){
            if (result == SLComposeViewControllerResultCancelled) {
                NSLog(@"点击了取消");
            } else {
                NSLog(@"点击了发送");
            }
        };
        
    };
    return handle;
}

- (void)sendmailTO:(NSString *)email
{
    if (![MFMailComposeViewController canSendMail]) {
        ALERT_MSG(@"提示",@"手机未设置邮箱",_presentVC);
        return;
    }
    
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    [controller setToRecipients:@[email]];
    if (_shareText) {
        [controller setSubject:_shareText];
    }
    if (_shareUrl) {
        [controller setMessageBody:[NSString stringWithFormat:@"%@",_shareUrl] isHTML:YES];
    }
    if (_shareImage) {
        NSData *imageData = UIImagePNGRepresentation(_shareImage);
        [controller addAttachmentData:imageData mimeType:@"image/png" fileName:@"图片.png"];
    }
    
    [controller setMailComposeDelegate:self];
    
    [_presentVC presentViewController:controller animated:YES completion:nil];
}
- (void)sendMessageTO:(NSString *)phoneNum{
    
    if(![MFMessageComposeViewController canSendText] ){
        ALERT_MSG(@"提示",@"设备不能发短信",_presentVC);
        return;
    }
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    [controller setRecipients:@[phoneNum]];
    NSString *bodySting = @"";
    if (_shareText) [bodySting stringByAppendingString:_shareText];
    if (_shareUrl) [bodySting stringByAppendingString:[NSString stringWithFormat:@"%@",_shareUrl]];
    controller.messageComposeDelegate =self;
    
    [_presentVC presentViewController:controller animated:YES completion:nil];;
    
}

#pragma mark - 邮件、短息代理方法

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [_presentVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [_presentVC dismissViewControllerAnimated:YES completion:nil];
}

@end
