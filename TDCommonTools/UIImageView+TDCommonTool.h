//
//  UIImageView+TDCommonTool.h
//  TDCommonTools
//
//  Created by TudouDong on 16/7/24.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (TDCommonTool)

@property (nonatomic)CGContextRef context;
@property (nonatomic,assign)CGFloat imageWidth;
@property (nonatomic,assign)CGFloat imageHeight;

/**
 *  压缩图片到指定尺寸大小(会失真)
 */
- (UIImage *)compressOriginalToSize:(CGSize)size;


/**
 *  获取指定位置的UIColor
 *
 *  @param point CGPoint 位置信息
 */
- (UIColor *)getPixelColorAtLocation:(CGPoint)point;
@end
