
//
//  EVSHotSearchFooterView.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/19.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSHotSearchFooterView.h"
#import "EVSHotSearchButton.h"


@interface EVSHotSearchFooterView()


/** 大家都在搜 */
@property (nonatomic, strong) UILabel *commonSearchLable;

@end

@implementation EVSHotSearchFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setUpSubViews];

    }
    return self;
}

- (void)setUpSubViews {
    [self addSubview:self.commonSearchLable];
    [self layoutSubviewsContrains];
    //创建热门搜索
    self.hotSearchArray = @[@"2017英语大赛",@"小女孩侧脸",@"小猫小狗狗子花田月下",@"13个集团军",@"VR的未来",@"英国铁娘子"];
    [self creatButtonWithArray:self.hotSearchArray];
}

- (void)creatButtonWithArray:(NSArray *)squares {
    // 方块个数
    NSUInteger count = squares.count;
    
    // 方块的尺寸
    NSUInteger maxColsCount = 2; // 一行的最大列数
    CGFloat buttonW = SCREEN_WIDTH / maxColsCount;
    CGFloat buttonH = 40;
    
    // 创建所有的方块
    for (NSUInteger i = 0; i < count; i++) {
        // 创建按钮
        EVSHotSearchButton *button = [EVSHotSearchButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = LXUIRandomColor;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[NSString stringWithFormat:@"%@",squares[i]] forState:UIControlStateNormal];
        [button setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentLeft;
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        // 设置frame
        button.lx_x = (i % maxColsCount) * buttonW;
        button.lx_y = 50 + (i / maxColsCount) * buttonH;
        button.lx_width = buttonW;
        button.lx_height = buttonH;

        [self addSubview:button];
        
        
    }
    
    // 设置footer的高度 == 最后一个按钮的bottom(最大Y值)
    self.lx_height = self.subviews.lastObject.lx_bottom;
    
    // 设置tableView的contentSize
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData]; // 重新刷新数据(会重新计算
}

- (void)buttonClick:(EVSHotSearchButton *)button {
    LXLog(@"热门搜索");
}

- (void)layoutSubviewsContrains {
    [self.commonSearchLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(15);
        make.top.mas_equalTo(self.mas_top).mas_offset(10);
        make.height.mas_equalTo(40);
    }];
}

- (UILabel *)commonSearchLable
{
    if (!_commonSearchLable) {
        _commonSearchLable = [[UILabel alloc] initWithTitle:@"大家都在搜" textColor:kUIColorFromRGB(0x666666) font:14 textAlignmengt:NSTextAlignmentLeft lins:0];
    }
    return _commonSearchLable;
}


@end
