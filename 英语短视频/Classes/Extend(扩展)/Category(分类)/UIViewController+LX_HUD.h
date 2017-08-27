//
//  UIViewController+LX_HUD.h
//  木言
//
//  Created by 李lucy on 16/7/11.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (LX_HUD)

- (void)showProgressHUD;
- (void)showProgressHUDWithText:(NSString *)text;
- (void)showProgressHUDWithText:(NSString *)text toView:(UIView *)view;
- (void)hiddenProgressHUD;
/**
 *  显示提示文字
 *
 *  @param view 显示view
 *  @param hint 提示文字
 */
- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

/**
 *  隐藏
 */
- (void)hideHud;
/**
 *  显示蒙版
 *
 *  @param hint 提示文字
 */
- (void)showHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;
@end
