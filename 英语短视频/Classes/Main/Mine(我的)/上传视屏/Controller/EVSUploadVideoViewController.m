//
//  EVSUploadVideoViewController.m
//  英语短视频
//
//  Created by 长缨在手 on 2017/9/6.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSUploadVideoViewController.h"
#import "EVSUploadVideoTableViewCell.h"

@interface EVSUploadVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *EVSUploadVideoTabV;

@end

@implementation EVSUploadVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNavBar];
    [self createUI];

}
#pragma mark - UI -
- (void)setUpNavBar{
    self.titleText = @"我的视屏";
    self.backText = @"";
    self.rightText = @"上传";
}

-(void)createUI{
    [self.view addSubview:self.EVSUploadVideoTabV];
}

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVSUploadVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EVSUploadVideoTableViewCell"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105*Y_HeightScale;
}




#pragma mark - 懒加载 -
-(UITableView *)EVSUploadVideoTabV{
    if (_EVSUploadVideoTabV == nil) {
        _EVSUploadVideoTabV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:(UITableViewStyleGrouped)];
        _EVSUploadVideoTabV.delegate = self;
        _EVSUploadVideoTabV.dataSource = self;
        _EVSUploadVideoTabV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _EVSUploadVideoTabV.sectionHeaderHeight = 0.01;
        _EVSUploadVideoTabV.sectionFooterHeight = 0.01;
        _EVSUploadVideoTabV.separatorColor = LXTableSeprateLineColor;
        [_EVSUploadVideoTabV registerClass:[EVSUploadVideoTableViewCell class] forCellReuseIdentifier:@"EVSUploadVideoTableViewCell"];
    }
    return _EVSUploadVideoTabV;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
