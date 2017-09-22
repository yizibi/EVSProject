//
//  EVSLoginControllerViewController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/14.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSLoginControllerViewController.h"
#import "EVSForgetPassWordController.h"
#import "EVSRegisterViewController.h"
#import "EVSRegisterNextViewController.h"




@interface EVSLoginControllerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *warningView;

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetPassWordButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;

@end

@implementation EVSLoginControllerViewController

- (IBAction)wechatLoginButtonClick:(UIButton *)sender {
    LXLog(@"微信登录");
}

- (IBAction)weboLoginButtonClick:(UIButton *)sender {
    LXLog(@"微博登录");

}

- (IBAction)tecentQQLoginButtonClick:(UIButton *)sender {
    LXLog(@"QQ登录");

}
- (IBAction)registerButtonClicked:(UIButton *)sender {
    LXLog(@"注册");
    EVSRegisterViewController  *registerVC = [[EVSRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];

}

- (IBAction)forgetPasswordButtonClick:(UIButton *)sender {
    LXLog(@"忘记密码");
    EVSForgetPassWordController *forgetPassWordVC = [[EVSForgetPassWordController alloc] init];
    [self.navigationController pushViewController:forgetPassWordVC animated:YES];
}


- (IBAction)loginButtonClick:(UIButton *)sender {
    LXLog(@"登录");

    self.warningView.hidden = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.warningView.hidden = YES;
    });
    
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpUI];
    
    [self setUpNavBar];
    
   
}


- (void)setUpNavBar {
    self.titleText = @"登录";
    [self setNavBarLeftViewWithImage:@"navgationBarBackBlack" target:self action:@selector(leftButtonClicked:)];
    
}

- (void)setUpUI {
    
    self.containView.layer.borderColor = kUIColorFromRGB(0xBDBDBD).CGColor;
    self.containView.layer.borderWidth = 0.5;
    self.containView.layer.cornerRadius = 3;
    self.containView.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 3;
    self.loginButton.layer.masksToBounds = YES;
    
    self.warningView.hidden = YES;
    self.warningView.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    self.warningView.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
}

#pragma mark - actions
- (void)leftButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
