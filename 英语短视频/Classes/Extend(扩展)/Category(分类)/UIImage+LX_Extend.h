//
//  UIImage+LX_Extend.h
//  木眼
//
//  Created by 李lucy on 16/3/24.
//  Copyright © 2016年 com.liluxin.test.Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LX_Extend)

/** 修复关于从相册旋转的问题 */
- (UIImage *)imageWithfixrotation:(UIImage *)image;

/**
 获取视频的首贞缩略图

 @param videoURL 视频url
 @param time     time description
 */
+ (instancetype)imageThumbnailWithVideoUrl:(NSString *)videoURL atTime:(NSTimeInterval)time;

/**
 *  压缩图片到指定大小
 *
 *  @param frame 尺寸
 *
 *  @return 一张指定尺寸的图片
 */
- (UIImage *)scaleImageFrame:(CGRect)frame;
/**
 *  根据颜色,尺寸生成一张图片
 */
+(instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithCurrentColor:(UIColor *)color;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
/**
 *  返回一张拉伸的图片
 */
+(instancetype)imageResizeWithNamed:(NSString *)imageName;
/**
 *  返回一张自定义拉伸的图片
 */
+(instancetype)imageResizeWithNamed:(NSString *)imageName left:(CGFloat)left andTop:(CGFloat)top;
/**
 *
 *
 *  @return 返回一张圆形图片
 */
- (instancetype)circleImag;
- (instancetype)circleImagnamed:(NSString *)imageName;
+ (instancetype)circleImage:(NSString *)name;
@end
