//
//  TDImageView.h
//  TDCommonTools
//
//  Created by 董慧翔 on 16/7/30.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^getPoint)(CGFloat x,CGFloat y);
@interface TDImageView : UIImageView

@property (nonatomic,copy) getPoint getPoint;

@end
