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
#import "TDImageView.h"
#import "UIImage+TDCommonImage.h"

typedef NS_ENUM(NSInteger,scrollEnableStatus) {

    scrollEnableStatusYES,
    scrollEnableStatusNO,
};
@interface ViewController ()

@property (nonatomic,strong) UIImageView *colorIV;
@property (nonatomic,strong) TDImageView *imageView;
@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIButton *enableScrollViewBT;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed:@"屏幕快照.png"];
    image = [image circleCornerImageWith:20];
    self.imageView.size = image.size;
    self.imageView.image = image;
    
    
    self.scrollView.contentSize = CGSizeMake(image.size.width+80, image.size.height+80);
    self.imageView.x = 40;
    self.imageView.y = 40;
    [self.scrollView addSubview:self.imageView];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.colorIV];
    [self.view addSubview:self.enableScrollViewBT];
    
    
}




#pragma mark - getter

- (TDImageView *)imageView{
    if (!_imageView) {
        _imageView = [[TDImageView alloc]initWithFrame:CGRectMake(0, 0,screenWidth , screenHeight/2.0)];
        _imageView.centerX = screenWidth/2.0;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.userInteractionEnabled = NO;
        
        
        __weak typeof(self) weakself = self;
        _imageView.getPoint = ^(CGFloat x,CGFloat y){
          
            weakself.colorIV.image = [weakself.imageView.image clipImageInRect:CGRectMake(x-5, y-5, 10, 10)];
            
        };
        
    }
    return _imageView;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 3/4.0*screenWidth, screenHeight)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        
    }
    return _scrollView;
}

- (UIImageView *)colorIV{
    if (!_colorIV) {
        _colorIV = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth*3/4.0, 0, screenWidth/4.0, screenWidth/4.0)];
        _colorIV.clipsToBounds = YES;
        _colorIV.contentMode = UIViewContentModeScaleAspectFill;
        _colorIV.backgroundColor = [UIColor clearColor];
    }
    return _colorIV;
}


- (UIButton *)enableScrollViewBT{
    if (!_enableScrollViewBT) {
        _enableScrollViewBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [_enableScrollViewBT setTitle:@"禁止滚动" forState:UIControlStateNormal];
        [_enableScrollViewBT setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [_enableScrollViewBT setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _enableScrollViewBT.tag = scrollEnableStatusYES;
        _enableScrollViewBT.frame = CGRectMake(screenWidth*3/4.0+40, screenHeight -40, screenWidth/4.0-80, 40);
        [_enableScrollViewBT addTarget:self action:@selector(enableAcion:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enableScrollViewBT;
}

#pragma mark - Action

- (void)enableAcion:(UIButton *)button{
    
    if (button.tag == scrollEnableStatusYES) {
        [self.enableScrollViewBT setTitle:@"开启滚动" forState:UIControlStateNormal];
        self.enableScrollViewBT.tag = scrollEnableStatusNO;
        self.scrollView.scrollEnabled = NO;
        self.imageView.userInteractionEnabled = YES;
    }else if(button.tag == scrollEnableStatusNO){
        
        [self.enableScrollViewBT setTitle:@"禁止滚动" forState:UIControlStateNormal];
        self.enableScrollViewBT.tag = scrollEnableStatusYES;
        self.scrollView.scrollEnabled = YES;
        self.imageView.userInteractionEnabled = NO;
    }
    
    
}

#pragma mark - 触摸事件





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
