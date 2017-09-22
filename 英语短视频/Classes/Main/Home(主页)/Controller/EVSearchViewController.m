//
//  EVSearchViewController.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/1.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSearchViewController.h"
#import "EVSHotSearchFooterView.h"
#import "EVSHotSearchCell.h"


static NSString *const EVSHotSearchCellID = @"EVSHotSearchCellID";
@interface EVSearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *dismissBtn;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) EVSHotSearchFooterView *footerView;
@end

@implementation EVSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpNavBar];
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVSHotSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:EVSHotSearchCellID];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



- (void)setUpNavBar {
    self.customNavBar.hiddenLeftView = YES;
    [self setNavBarRightViewWithBtnText:@"取消" textColor:kUIColorFromRGB(0x333333) target:self action:@selector(dismiss)];
    
    __weak typeof(self) weakSelf = self;
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-60, 44)];
    searchView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"请输入关键词";
    
    searchBar.backgroundImage = [UIImage imageWithCurrentColor:[UIColor whiteColor]];
    [searchBar setSearchFieldBackgroundImage:[self GetImageWithColor:kUIColorFromRGB(0xEEEEEE) andHeight:30] forState:UIControlStateNormal];
    [searchBar setImage:[UIImage imageNamed:@"首页-搜索"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    searchBar.returnKeyType = UIReturnKeySearch;
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, searchView.lx_width, searchView.lx_height);
    searchBar.showsCancelButton = NO;
    self.searchBar = searchBar;
    
    [searchView addSubview:searchBar];
    
    [self.customNavBar addSubview:searchView];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = LXrayColor(239);
    [self.customNavBar addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.customNavBar.mas_left);
        make.right.mas_equalTo(weakSelf.customNavBar.mas_right);
        make.bottom.mas_equalTo(weakSelf.customNavBar.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = kUIColorFromRGB(0xE6E6E6);
    return view;
}

- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _tableView.separatorColor = kUIColorFromRGB(0xE6E6E6);
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 50;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        _tableView.tableFooterView = [[EVSHotSearchFooterView alloc] init];
        //注册cell
        [_tableView registerClass:[EVSHotSearchCell class] forCellReuseIdentifier:EVSHotSearchCellID];
        
    }
    
    return _tableView;
}




/**
 *  生成图片
 *
 *  @param color  图片颜色
 *  @param height 图片高度
 *
 *  @return 生成的图片
 */
- (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
