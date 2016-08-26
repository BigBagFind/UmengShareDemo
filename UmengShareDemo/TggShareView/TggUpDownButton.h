//
//  TggUpDownButton.h
//  UmengShareDemo
//
//  Created by 铁拳科技 on 16/8/25.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TggUpDownButton : UIButton

/**
 *  自定义类方法直接创建垂直的button
 *
 *  @param frame     buttonFrame
 *  @param font      titleLabel的字体大小
 *  @param spacing   image和title的间距
 *  @param imageSize image的size是否手动设置，填写CGZiseZero则为默认image的大小
 *
 *  @return TggUpDownButton
 */
+ (instancetype)buttonWithFrame:(CGRect)frame
                          title:(NSString *)title
                           Font:(UIFont *)font
                        spacing:(CGFloat)spacing
                      imageSize:(CGSize)imageSize;


@end
