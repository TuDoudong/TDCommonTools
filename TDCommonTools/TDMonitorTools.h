//
//  TDMonitorTools.h
//  TDCommonTools
//
//  Created by 董慧翔 on 16/7/8.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TDMonitorTools : NSObject



+ (unsigned long)GetCurrentTaskUsedMemory;

/**
 *  通过runtime 获取StatusBar上电池电量控件类私有变量的值
 *
 *  @return 百分比的量(如：80)
 */
+ (int)getCurrentBatteryLevel;

/**
 *  通过苹果官方文档里面UIDevice public API来获取
 *
 *  @return 百分比（如：69%）(网上说是1%的误差，但经我测试发现并没有)
 */
+ (float)getCurrentBatteryLevelFromPublicAPI;
@end
