//
//  UIImage+LX_Extend.m
//  木言
//
//  Created by 李lucy on 16/3/24.
//  Copyright © 2016年 com.liluxin.test.Co.,Ltd. All rights reserved.
//

#import "UIImage+LX_Extend.h"
#import <AVFoundation/AVFoundation.h>

#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define Default_ImageWidth SCREEN_WIDTH
#define Default_ImageHeight 64
#define Default_ImageSize CGSizeMake(Default_ImageWidth, Default_ImageHeight)

@implementation UIImage (LX_Extend)


/** 修复关于从相册旋转的问题 */
- (UIImage *)imageWithfixrotation:(UIImage *)image{
    if (image.imageOrientation == UIImageOrientationUp) return image;
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
    
}

/** 获取视频的首真图片  */
+ (instancetype)imageThumbnailWithVideoUrl:(NSString *)videoURL atTime:(NSTimeInterval)time{
    
    if (videoURL.length && ![videoURL isEqual:[NSNull null]]) {
        
        NSURL *videoUrl = [NSURL URLWithString:videoURL];
        AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoUrl options:nil];
        NSParameterAssert(asset);
        AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
        assetImageGenerator.appliesPreferredTrackTransform = YES;
        assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
        
        CGImageRef thumbnailImageRef = NULL;
        CFTimeInterval thumbnailImageTime = time;
        NSError *thumbnailImageGenerationError = nil;
        thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
        
        if(!thumbnailImageRef)
            NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
        
        UIImage*thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
        
        return thumbnailImage;
    }else{
        return [UIImage imageNamed:@"home_teacherInfo_video"];
    }
}

- (UIImage *)scaleImageFrame:(CGRect)frame{
    CGSize size = frame.size;
    UIGraphicsBeginImageContext(size);
    [self drawInRect:frame];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
/**
 *  根据指定的颜色,生成一张图片
 *
 *  @param color 颜色
 *  @param size  尺寸
 *
 *  @return 新生成的图片
 */
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (!color) return nil;
    CGSize currentSize = Default_ImageSize;
    if (size.width != 0 && size.height != 0) {
        currentSize = size;
    }
    
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(currentSize, YES, 0);
    //获取上下文
    CGContextRef colorRef = UIGraphicsGetCurrentContext();
    //设置上下文的尺寸
    CGContextAddRect(colorRef, CGRectMake(0, 0, currentSize.width, currentSize.height));
    //填充颜色
    CGContextSetFillColorWithColor(colorRef, color.CGColor);
    //填充路径
    CGContextFillPath(colorRef);
    //生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}


+ (UIImage *)imageWithColor:(UIColor *)color{
    return [self imageWithColor:color size:CGSizeZero];
}

/**
 *  根据指定颜色,创建一张图片,
 *
 *  @param color UIColor
 *
 *  @return 图片
 */
+ (UIImage *)imageWithCurrentColor:(UIColor *)color{
    
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}


/**
 *  返回一张可拉伸的图片
 *
 *  @param imageName 图片名
 *
 *  @return 返回一张可拉伸的图片
 */
+(instancetype)imageResizeWithNamed:(NSString *)imageName
{
    return [self imageResizeWithNamed:imageName left:0.5 andTop:0.5];
}
/**
 *
 *
 *  @param imageName 图片名
 *  @param left      左边
 *  @param top       上边
 *
 *  @return 自定义拉伸的图片
 */
+ (instancetype)imageResizeWithNamed:(NSString *)imageName left:(CGFloat)left andTop:(CGFloat)top
{
    UIImage *image = [self imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];

}
/**
 *  圆形图片
 *
 *  @return 圆形图片
 */
- (instancetype)circleImag
{
//    //开启图片上下文
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
//    //创建路径
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
//    [path addClip];
//    [self drawAtPoint:CGPointZero];
//    UIImage *cirImage = UIGraphicsGetImageFromCurrentImageContext();
//    //关闭图片上下文
//    UIGraphicsEndImageContext();
//    
//    return cirImage;

    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef imgRef = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(imgRef, rect);
    
    CGContextClip(imgRef);
    
    [self drawInRect:rect];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}
- (instancetype)circleImagnamed:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] circleImag];
}


+ (instancetype)circleImage:(NSString *)name{
    return [self imageNamed:name].circleImag;
}


@end
