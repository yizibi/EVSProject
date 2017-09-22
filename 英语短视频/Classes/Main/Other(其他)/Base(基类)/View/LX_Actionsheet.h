//
//  LX_Actionsheet.h
//  LX_Actionsheet
//
//  Created by 李lucy on 16/5/12.
//  Copyright © 2016年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>




@class LX_Actionsheet;


@protocol LX_ActionsheetDelegate <NSObject>

@optional

- (void)actionsheet:(LX_Actionsheet *)actionsheet didClickButtonIndex:(NSInteger)buttonIndex;
- (void)actionsheet:(LX_Actionsheet *)actionsheet didClickCancelButton:(UIButton *)cancelButton;

@end

@interface LX_Actionsheet : UIView

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 字体颜色 */
@property (nonatomic, strong) UIColor *textColor;
/** 字体大小 */
@property (nonatomic, strong) UIFont *textFont;
/** 标题按钮数组 */
@property (nonatomic, strong) NSMutableArray *buttonTitles;

/** 取消按钮 */
@property (nonatomic, strong) UIButton *cancelBtn;
/** 底部的按钮 */
@property (nonatomic, copy) NSString *cancelTitle;

- (void)show;
- (void)setAlertShow:(void (^)(NSInteger btnTag))block;


#pragma mark - Delegate Way

/**
 *  返回一个 ActionSheet 对象, 类方法
 *
 *  @param title          提示标题
 *  @param buttonTitles   所有按钮的标题
 *  @param redButtonIndex 红色按钮的 index
 *  @param delegate       代理
 *
 *  Tip: 如果没有红色按钮, redButtonIndex 给 `-1` 即可
 */
+ (instancetype)sheetWithTitle:(NSString *)title
                  buttonTitles:(NSArray *)buttonTitles
                redButtonIndex:(NSInteger)redButtonIndex
                      delegate:(id<LX_ActionsheetDelegate>)delegate;

+ (instancetype)sheetWithTitle:(NSString *)title buttonTitles:(NSArray *)buttonTitles redButtonIndex:(NSInteger)redButtonIndex;

@end
