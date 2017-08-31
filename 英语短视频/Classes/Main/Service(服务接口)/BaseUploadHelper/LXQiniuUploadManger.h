//
//  LXQiniuUploadManger.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/31.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXQiniuUploadManger : NSObject


@property (copy, nonatomic) void (^singleSuccessBlock)(NSString *);
@property (copy, nonatomic)  void (^singleFailureBlock)();

+ (instancetype)sharedUploadHelper;
@end
