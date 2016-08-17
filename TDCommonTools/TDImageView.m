//
//  TDImageView.m
//  TDCommonTools
//
//  Created by 董慧翔 on 16/7/30.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "TDImageView.h"
#import "UIImageView+TDCommonTool.h"
#import "UIImage+TDCommonImage.h"
@implementation TDImageView



#pragma mark - 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    if (point.x<0 || point.y<0 || point.x > self.frame.size.width || point.y >self.frame.size.height) {
        return;
    }
    
    if (self.getPoint) {
        self.getPoint(point.x,point.y);
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    if (point.x<0 || point.y<0 || point.x > self.frame.size.width || point.y >self.frame.size.height) {
        return;
    }
    NSLog(@"point:x:%f,y:%f",point.x,point.y);
    if (self.getPoint) {
        self.getPoint(point.x,point.y);
    }
    
    
}


@end
