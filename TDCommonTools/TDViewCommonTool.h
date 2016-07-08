//
//  TDViewCommonTool.h
//  TDCommonTools
//
//  Created by 董慧翔 on 16/6/28.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TDViewCommonTool : NSObject

/**
 *  压缩图片到指定尺寸大小
 */
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

@end
