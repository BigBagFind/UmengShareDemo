//
//  UIView+ViewController.m
//  新浪微博
//
//  Created by 吴玉铁 on 15/9/15.
//  Copyright (c) 2015年 铁哥. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)


- (UIViewController *)viewController{
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    } while (next != nil);
    return nil;
}



@end
