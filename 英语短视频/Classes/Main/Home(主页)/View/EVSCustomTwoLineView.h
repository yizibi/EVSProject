//
//  EVSCustomTwoLineView.h
//  英语短视频
//
//  Created by 李lucy on 2017/9/16.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVSCustomTwoLineView : UIView

/** 上面的文字 */
@property (nonatomic, copy) NSString *firstText;
/** 下面的文字 */
@property (nonatomic, copy) NSString *secondText;


- (instancetype)initWithFirstText:(NSString *)firstText secondText:(NSString *)secondText;
+ (instancetype)customTwoLineViewWithFirstText:(NSString *)firstText secondText:(NSString *)secondText;


@end
