//
//  UIViewController+LX_HUD.m
//  木言
//
//  Created by 李lucy on 16/7/11.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "UIViewController+LX_HUD.h"
#import <MBProgressHUD.h>
#import <objc/runtime.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (LX_HUD)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    for (UIView *subHud in view.subviews) {
        if ([subHud isKindOfClass:[HUD class]]) {
            [subHud removeFromSuperview];
        }
    }
    [view addSubview:HUD];
    
    [HUD show:YES]; //隐藏转圈
    
    [self setHUD:HUD];
}

- (void)showHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 180;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 180;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)hideHud{
    [[self HUD] hide:YES];
}



#pragma mark - 网络加载提示
- (void)showProgressHUD {
    [self showProgressHUDWithText:@"正在加载..."];
}

- (void)showProgressHUDWithText:(NSString *)text {
    [self showProgressHUDWithText:text toView:self.view];
}

- (void)showProgressHUDWithText:(NSString *)text toView:(UIView *)view {
    [self showHudInView:view hint:text];
}

- (void)hiddenProgressHUD {
    [self hideHud];
}



@end
