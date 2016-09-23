//
//  TggEasyTextTool.m
//  TggEasyGetTextHeight
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "TggEasyTool.h"
#import <AudioToolbox/AudioToolbox.h>
#import <objc/runtime.h>

@implementation TggEasyTool


+ (UIImage *)tggAlterToImageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (UIImage *)tggCutImageWithImage:(UIImage *)image ToSize:(CGSize)size{
    CGSize itemSize = size;
    
    UIGraphicsBeginImageContext(itemSize);
    
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    
    [image drawInRect:imageRect];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}




@end
