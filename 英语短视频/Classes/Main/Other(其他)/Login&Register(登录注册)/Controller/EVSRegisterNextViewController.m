
//
//  EVSRegisterNextViewController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/14.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSRegisterNextViewController.h"

#import "EVSGetIdentifyCodeButton.h"


@interface EVSRegisterNextViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UITextField *inputCodeTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet EVSGetIdentifyCodeButton *vertifyCode;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;

@end

@implementation EVSRegisterNextViewController

- (IBAction)nextButtonClick:(UIButton *)sender {
    LXLog(@"下一步");
}


- (IBAction)vertifyButtonClick:(UIButton *)sender {
    LXLog(@"验证码请求");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleText = @"注册";
    self.backText = @"";
    
    [self setUpUI];
    
}


- (void)setUpUI {
    
    self.nextButton.layer.cornerRadius = 3;
    self.nextButton.layer.masksToBounds = YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
