//
//  TDMonitorTools.m
//  TDCommonTools
//
//  Created by 董慧翔 on 16/7/8.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "TDMonitorTools.h"
#import <mach/task_info.h>
#import <mach/mach.h>
#import <objc/runtime.h>
#import <mach/port.h>

@implementation TDMonitorTools

+ (unsigned long)GetCurrentTaskUsedMemory {
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO, (task_info_t)&taskInfo, &infoCount);
    
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    
    return  taskInfo.resident_size / 1024.0 / 1024.0;
}


+ (int)getCurrentBatteryLevel
{
    
    UIApplication *app = [UIApplication sharedApplication];
    if (app.applicationState == UIApplicationStateActive||app.applicationState==UIApplicationStateInactive) {
        Ivar ivar=  class_getInstanceVariable([app class],"_statusBar");
        id status  = object_getIvar(app, ivar);
        for (id aview in [status subviews]) {
            int batteryLevel = 0;
            for (id bview in [aview subviews]) {
                if ([NSStringFromClass([bview class]) caseInsensitiveCompare:@"UIStatusBarBatteryItemView"] == NSOrderedSame&&[[[UIDevice currentDevice] systemVersion] floatValue] >=6.0)
                {
                    
                    Ivar ivar=  class_getInstanceVariable([bview class],"_capacity");
                    if(ivar)
                    {
                        batteryLevel = ((int (*)(id, Ivar))object_getIvar)(bview, ivar);
                        //这种方式也可以
                        /*ptrdiff_t offset = ivar_getOffset(ivar);
                         unsigned char *stuffBytes = (unsigned char *)(__bridge void *)bview;
                         batteryLevel = * ((int *)(stuffBytes + offset));*/
                        NSLog(@"电池电量:%d",batteryLevel);
                        if (batteryLevel > 0 && batteryLevel <= 100) {
                            return batteryLevel;
                            
                        } else {
                            return 0;
                        }
                    }
                    
                }
                
            }
        }
    }
    
    return 0;
}
+ (float)getCurrentBatteryLevelFromPublicAPI{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [UIDevice currentDevice].batteryLevel;
}
@end
