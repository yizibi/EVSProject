//
//  EVSGetIdentifyCodeButton.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/14.
//  Copyright © 2017年 英语短视频. All rights reserved.
//


#import "EVSGetIdentifyCodeButton.h"


static CGFloat const kDefaultIdentifyCodeButtonWidth  = 127;
static CGFloat const kDefaultIdentifyCodeButtonHeight = 45;


@interface EVSGetIdentifyCodeButton()
{
@private
    NSInteger _countdown;
    BOOL _isCountdown; // 是否已经在倒计时
}
@property (nonatomic, strong) NSTimer *countdownTimer;

//选中的按钮
@property (nonatomic, strong) UIButton *selectedBtn;

@end
@implementation EVSGetIdentifyCodeButton
#pragma mark - System Methods
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self setupSubviews];
    }
    return self;
}

#pragma mark - Interface
+ (instancetype)indentifyCodeButton {
    return [[EVSGetIdentifyCodeButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 125, kDefaultIdentifyCodeButtonHeight)];
}

+ (CGSize)getDefaultSize {
    return CGSizeMake(kDefaultIdentifyCodeButtonWidth, kDefaultIdentifyCodeButtonHeight);
}


- (void)getIdentifyCodeWithPhoneNumber:(NSString *)phoneNumber type:(VertifyCodeType)type areaCode:(NSString *)areaCode success:(void (^)(NSDictionary *))success fail:(void (^)(NSError *))fail{
    // 如果已经开始倒计时，此时不响应获取新的验证码事件
    self.selectedBtn.selected = NO;
    self.selected = YES;
    self.selectedBtn = self;
    
    if (_isCountdown) return;
    
    // 开始定时器(1s执行一次)
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownTimer:) userInfo:nil repeats:YES];
    
    _countdown = 60;
    _isCountdown = YES;
    
    /*
    [LX_NetWorkManger getVerificationCodeByMobile:phoneNumber type:type areaCode:areaCode success:^(NSDictionary *result) {
        if (success) {
            success(result);
        }
    } fail:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
     */
}
- (void)getIdentifyCodeWithPhoneNumber:(NSString *)phoneNumber {
    // 如果已经开始倒计时，此时不响应获取新的验证码事件
    if (_isCountdown) return;
    
    // 开始定时器(1s执行一次)
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownTimer:) userInfo:nil repeats:YES];
    
    _countdown = 60;
    _isCountdown = YES;
    
    
    //    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneNumber zone:@"86" customIdentifier:@"" result:^(NSError *error) {
    //
    //        if (!error) {
    //        }
    //        else {
    //        }
    //
    //    }];
    
}

- (void)commitVerificationCode:(NSString *)verificationCode phoneNumber:(NSString *)phoneNumber {
    
    [self.countdownTimer invalidate];
    self.countdownTimer = nil;
    _isCountdown = NO;
    [self setTitle:@"重新获取" forState:UIControlStateNormal];
    
    //    [SMSSDK commitVerificationCode:verificationCode phoneNumber:phoneNumber zone:@"86" result:^(NSError *error) {
    //        if (error) {
    //
    //            NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
    //            resultDict[@"result"] = @"fail";
    //
    //            [HP_NotificationCenter postNotificationName:kCommitVertificationCodeNotification object:nil userInfo:resultDict];
    //
    //        }else {
    //
    //            NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
    //            resultDict[@"result"] = @"success";
    //            resultDict[@"mobile"] = phoneNumber;
    //            [HP_NotificationCenter postNotificationName:kCommitVertificationCodeNotification object:nil userInfo:resultDict];
    //        }
    //    }];
}

#pragma mark - Event Response
- (void)setupSubviews{
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.backgroundColor = kUIColorFromRGB(0xdedede);
    self.adjustsImageWhenHighlighted = NO;
    [self setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [self setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [self setTitle:@"验证" forState:UIControlStateNormal];
    
    [self setBackgroundImage:[UIImage imageWithColor:kUIColorFromRGB(0x37b0a4)] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:kUIColorFromRGB(0xdedede)] forState:UIControlStateSelected];
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
}

- (void)countDownTimer:(NSTimer *)timer{
    [self setTitle:[NSString stringWithFormat:@"%zd s",_countdown] forState:UIControlStateNormal];
    _countdown --;
    
    if (_countdown < 0) {
        [self.countdownTimer invalidate];
        self.countdownTimer = nil;
        
        self.selectedBtn.selected = NO;
        
        [self setTitle:@"重新获取" forState:UIControlStateNormal];
        
        _isCountdown = NO;
    }
}



@end
