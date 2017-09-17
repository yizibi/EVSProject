
//
//  EVSMineHeadView.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSMineHeadView.h"

@interface EVSMineHeadView()


@end


@implementation EVSMineHeadView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews{
    
    [self addSubview:self.loginView];
    
    [self addSubview:self.alreadyView];
    
//    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.mas_equalTo(self.mas_left);
//        make.right.mas_equalTo(self.mas_right);
//        make.top.mas_equalTo(self.mas_top).mas_offset(0);
//        make.bottom.mas_equalTo(self.mas_bottom);
//    }];
    
    
    
    [self.alreadyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
    
}


-(EVSUserLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[EVSUserLoginView alloc] init];
        _loginView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
        _loginView.hidden = YES;
//        _loginView.backgroundColor = [UIColor redColor];
    }
    return _loginView;
}



- (EVSUserAlreadyLoginView *)alreadyView{
    if (!_alreadyView) {
        _alreadyView = [[EVSUserAlreadyLoginView alloc] init];
        _alreadyView.hidden = NO;
    }
    return _alreadyView;
}

@end
