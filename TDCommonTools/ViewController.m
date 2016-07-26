//
//  ViewController.m
//  TDCommonTools
//
//  Created by 董慧翔 on 16/6/28.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+TDCommonTool.h"
#import "TDMonitorTools.h"
#import "UIView+TDFrameChange.h"
@interface ViewController ()

@property (nonatomic,strong) UIView *colorView;
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imageView];
 
    [self.view addSubview:self.colorView];
    
    
    
}




#pragma mark - getter

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,screenWidth , screenHeight/2.0)];
        _imageView.centerX = screenWidth/2.0;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        UIImage *image = [UIImage imageNamed:@"angel.jpg"];
        _imageView.size = image.size;
        _imageView.image = image;
    }
    return _imageView;
}

- (UIView *)colorView{
    if (!_colorView) {
        _colorView = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight*3/4.0, screenWidth, screenHeight/4.0)];
        _colorView.backgroundColor  = [UIColor whiteColor];
    }
    return _colorView;
}

#pragma mark - 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.imageView];
    //NSLog(@"point:x:%f,y:%f",point.x,point.y);
    UIColor *currentColor = [self.imageView getPixelColorAtLocation:point];
    [self.colorView setBackgroundColor:currentColor];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
