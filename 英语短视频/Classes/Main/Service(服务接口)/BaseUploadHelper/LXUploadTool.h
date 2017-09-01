//
//  LXUploadTool.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/31.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Qiniu/QiniuSDK.h>
#import <UIKit/UIKit.h>


@interface LXUploadTool : NSObject


// 获取七牛上传token
+ (void)getQiniuUploadToken:(void (^)(NSString *token))success failure:(void (^)())failure;
/**
 *  上传图片
 *
 *  @param image    需要上传的image
 *  @param progress 上传进度block
 *  @param success  成功block 返回url地址
 *  @param failure  失败block
 */
+ (void)uploadImage:(UIImage *)image progress:(QNUpProgressHandler)progress success:(void (^)(NSString *url))success failure:(void (^)())failure;

// 上传多张图片,按队列依次上传
+ (void)uploadImages:(NSArray *)imageArray progress:(void (^)(CGFloat progress))progress success:(void (^)(NSArray*urls))success failure:(void (^)())failure;

// 上传视频
+ (void)uploadVideo:(NSData *)data progress:(QNUpProgressHandler)progress success:(void (^)(NSString *url))success failre:(void(^)())failure;

// 上传录音
+ (void)uploadAudio:(NSData *)audioData progress:(QNUpProgressHandler)progress success:(void (^)(NSString *url))success failure:(void (^)())failure;

// 上传录音wav
+ (void)uploadWAVAudio:(NSData *)audioData progress:(QNUpProgressHandler)progress success:(void (^)(NSString *url))success failure:(void (^)())failure;


@end
