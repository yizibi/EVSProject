
//
//  EVSCustomTwoLineView.m
//  英语短视频
//
//  Created by 李lucy on 2017/9/16.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "EVSCustomTwoLineView.h"


@interface EVSCustomTwoLineView()

/** 上面的文字 */
@property (nonatomic, strong) UILabel *topLable;
/** 下面的文字 */
@property (nonatomic, strong) UILabel *bottomLable;



@end


@implementation EVSCustomTwoLineView


- (instancetype)initWithFirstText:(NSString *)firstText secondText:(NSString *)secondText {
    
    self.firstText = firstText;
    
    self.secondText = secondText;
    
    return [EVSCustomTwoLineView customTwoLineViewWithFirstText:firstText secondText:secondText];
}


+ (instancetype)customTwoLineViewWithFirstText:(NSString *)firstText secondText:(NSString *)secondText {
    
    
    EVSCustomTwoLineView *customView = [[EVSCustomTwoLineView alloc] init];
    
    customView.firstText = firstText;
    customView.secondText = secondText;
    
    return customView;
    
}


- (instancetype)init {
    if (self = [super init]) {
        [self setUpSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpSubViews];
    }
    return self;
}


- (void)setFirstText:(NSString *)firstText {
    if (firstText.length) {
        _firstText = firstText;
        
        _topLable.text = _firstText;
    }

}

- (void)setSecondText:(NSString *)secondText {
 
    if (secondText.length) {
        _secondText = secondText;
        
        _bottomLable.text = secondText;
    }
}

- (void)setUpSubViews {
    
    [self addSubview:self.topLable];
    [self addSubview:self.bottomLable];
    
//    [self.topLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.mas_left);
//        make.right.mas_equalTo(self.mas_right);
//        make.top.mas_equalTo(self.mas_top).mas_offset(0);
//    }];
//    
    [self.bottomLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.topLable.mas_left);
        make.right.mas_equalTo(self.topLable.mas_right);
        make.top.mas_equalTo(self.topLable.mas_bottom).mas_offset(6);

    }];
}


- (UILabel *)topLable {
    if (!_topLable) {
        _topLable = [UILabel lableWithTitle:_firstText textColor:kUIColorFromRGB(0x060606) font:21.0 textAlignmengt:NSTextAlignmentLeft lins:0];
        _topLable.frame = CGRectMake(25, 0, (SCREEN_WIDTH-135)/3, 20);
    }
    return _topLable;
}

- (UILabel *)bottomLable {
    if (!_bottomLable) {
        _bottomLable = [UILabel lableWithTitle:_secondText textColor:kUIColorFromRGB(0x060606) font:10.0 textAlignmengt:NSTextAlignmentLeft lins:0];
        
    }
    return _bottomLable;
}

@end
