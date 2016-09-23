//
//  ViewController.m
//  UmengShareDemo
//
//  Created by 铁拳科技 on 16/8/25.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "ViewController.h"
#import "TggShareView.h"
#import "TggUpDownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 自定义的一个button，测试下随便出发分享页面*/
    TggUpDownButton *button = [TggUpDownButton buttonWithFrame:CGRectMake(100, 100, 100, 100)
                                                         title:@"PresentShareView"
                                                          Font:[UIFont systemFontOfSize:13]
                                                       spacing:5
                                                     imageSize:CGSizeZero];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 提示下你
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 50)];
    [self.view addSubview:label];
    label.text = @"👆👆👆点击上面的按钮就会弹出分享页面";
    label.textColor = [UIColor blackColor];
    
    
}


- (void)action {
    // 一句弹出不多说
    [TggShareView presentShareView];
}








@end
