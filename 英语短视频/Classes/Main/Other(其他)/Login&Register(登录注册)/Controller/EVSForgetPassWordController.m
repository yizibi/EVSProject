//
//  EVSForgetPassWordController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/14.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSForgetPassWordController.h"
#import "EVSGetIdentifyCodeButton.h"

@interface EVSForgetPassWordController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet EVSGetIdentifyCodeButton *vertifyCode;
@property (weak, nonatomic) IBOutlet UITextField *vertifyTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *setPassword;
@property (weak, nonatomic) IBOutlet UITextField *setAgainPassword;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation EVSForgetPassWordController
- (IBAction)nextButtonClick:(UIButton *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];


    self.titleText = @"忘记密码";
    self.backText = @"";
    
    self.nextButton.layer.cornerRadius = 3;
    self.nextButton.layer.masksToBounds = YES;

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
