//
//  UIImage+TDCommonImage.h
//  TDCommonTools
//
//  Created by 董慧翔 on 16/7/30.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TDCommonImage)

//截取图片的某一部分
- (UIImage *)clipImageInRect:(CGRect)rect;

//高性能的给 UIImageView 加个圆角

- (UIImage *)circleCornerImageWith:(CGFloat)Radius;

@end
