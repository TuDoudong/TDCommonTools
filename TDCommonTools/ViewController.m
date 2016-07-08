//
//  ViewController.m
//  TDCommonTools
//
//  Created by 董慧翔 on 16/6/28.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "ViewController.h"
#import "TDViewCommonTool.h"
#import "TDMonitorTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    do {
        sleep(3);
        [TDMonitorTools print_free_memory];
        
    } while (1);
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
