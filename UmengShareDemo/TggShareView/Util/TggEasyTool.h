//
//  TggEasyTextTool.h
//  TggEasyGetTextHeight
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface TggEasyTool : NSObject




/**
 *颜色转换为背景图片
 @number color  输入颜色
 */
+ (UIImage *)tggAlterToImageWithColor:(UIColor *)color;


/**
 *裁剪图片
 @params image  裁剪的图片
 @params size   最终的裁剪大小
 @params UIImage 最终裁剪的图片
 */
+ (UIImage *)tggCutImageWithImage:(UIImage *)image ToSize:(CGSize)size;





@end
