//
//  TDViewCommonTool.m
//  TDCommonTools
//
//  Created by 董慧翔 on 16/6/28.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "TDViewCommonTool.h"

@implementation TDViewCommonTool

+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    UIImage *resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return resultImage;
}
@end
