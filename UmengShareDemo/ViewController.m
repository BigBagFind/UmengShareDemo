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
    
 
    TggUpDownButton *button = [TggUpDownButton buttonWithFrame:CGRectMake(100, 100, 100, 100)
                                                         title:@"titlesOfButton"
                                                          Font:[UIFont systemFontOfSize:13]
                                                       spacing:5
                                                     imageSize:CGSizeZero];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
}


- (void)action {
    [TggShareView presentShareView];
}


@end
