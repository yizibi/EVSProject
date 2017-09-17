
//
//  EVSRegisterViewController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/14.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSRegisterViewController.h"
#import "EVSRegisterNextViewController.h"


@interface EVSRegisterViewController ()


@property (weak, nonatomic) IBOutlet UIView *topContainView;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation EVSRegisterViewController

- (IBAction)agreeButtonClicked:(UIButton *)sender {
    LXLog(@"同意协议");
    
}


- (IBAction)nextButtonClick:(UIButton *)sender {
    LXLog(@"下一步");
    EVSRegisterNextViewController *registerNextVC = [[EVSRegisterNextViewController alloc] init];
    [self.navigationController pushViewController:registerNextVC animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleText = @"注册";
    self.backText = @"";
    
    [self setUpUI];
    
}


- (void)setUpUI {
    
    self.topContainView.layer.borderColor = kUIColorFromRGB(0xBDBDBD).CGColor;
    self.topContainView.layer.borderWidth = 0.5;
    self.topContainView.layer.cornerRadius = 3;
    self.topContainView.layer.masksToBounds = YES;
    self.nextButton.layer.cornerRadius = 3;
    self.nextButton.layer.masksToBounds = YES;
    
    self.agreeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    self.agreeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
