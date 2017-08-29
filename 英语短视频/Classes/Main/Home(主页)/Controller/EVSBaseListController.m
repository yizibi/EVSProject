
//
//  EVSBaseListController.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/27.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSBaseListController.h"
#import "YZDisplayViewHeader.h"
#import "EVSHomeVideoCell.h"


@interface EVSBaseListController ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;

@end


@implementation EVSBaseListController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.customNavBar.hidden = YES;

    self.view.backgroundColor = LXUIRandomColor;
    
    [self.view addSubview:self.tableView];
    
    
    /****滚动完成请求数据*******/
    
    // 如果想要滚动完成或者标题点击的时候，加载数据，需要监听通知
    
    // 监听滚动完成或者点击标题，只要滚动完成，当前控制器就会发出通知
    
    // 只需要监听自己发出的，不需要监听所有对象发出的通知，否则会导致一个控制器发出，所有控制器都能监听,造成所有控制器请求数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:YZDisplayViewClickOrScrollDidFinshNote object:self];

}


- (void)loadData{
    
    [self showProgressHUD];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHud];
        
        [self.tableView reloadData];
        
    });
}

- (void)dealloc{
    [EVS_NotificationCenter removeObserver:self];
}


#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EVSHomeVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:EVSHomeVideoCellID];
    return cell;
}



#pragma mark - lazyUI 
- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 220 *Y_HeightScale;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        //注册cell
        [_tableView registerClass:[EVSHomeVideoCell class] forCellReuseIdentifier:EVSHomeVideoCellID];
        
    }
    
    return _tableView;
}


@end
