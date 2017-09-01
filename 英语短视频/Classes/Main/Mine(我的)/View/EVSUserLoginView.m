
//
//  EVSUserLoginView.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSUserLoginView.h"


#define MARGIN_BUTTON_LEFT_RIGHT 40 //距离屏幕左右间距
#define MARGIN_BUTTON  20 //按钮之间的间距


@interface EVSUserLoginView()



@end

@implementation EVSUserLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self creatLoginButtons];
    }
    return self;
}


#pragma mark - actions
- (void)loginButtonDidClicked:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(mineLoginHeadButtonClick:)]) {
        [self.delegate mineLoginHeadButtonClick:button];
    }
}


- (void)creatLoginButtons {
    
    //初始化按钮数组
    NSArray *buttonTitles = @[@"手机",@"分享-微信",@"微博",@"分享-qq"];
    
    CGFloat buttonW = (SCREEN_WIDTH-(MARGIN_BUTTON_LEFT_RIGHT)*2-MARGIN_BUTTON*3)/4;
    
    for (int i = 0; i < 4; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSString *imageName = [NSString stringWithFormat:@"%@",buttonTitles[i]];
        
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        CGFloat buttonX = MARGIN_BUTTON_LEFT_RIGHT + (buttonW + MARGIN_BUTTON) * i;
        
        
        button.tag = 1000 + i;
        
        button.frame = CGRectMake(buttonX,30, buttonW, buttonW);
        
        [button addTarget:self action:@selector(loginButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        
    }

    
}

@end
