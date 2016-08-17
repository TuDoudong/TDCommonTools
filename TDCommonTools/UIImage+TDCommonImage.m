//
//  UIImage+TDCommonImage.m
//  TDCommonTools
//
//  Created by 董慧翔 on 16/7/30.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "UIImage+TDCommonImage.h"

@implementation UIImage (TDCommonImage)

//截取图片的某一部分
- (UIImage *)clipImageInRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    
    return thumbScale;
    
    
}



- (UIImage *)circleCornerImageWith:(CGFloat)Radius{
    
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(Radius, Radius)].CGPath);
    CGContextClip(context);
    
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
