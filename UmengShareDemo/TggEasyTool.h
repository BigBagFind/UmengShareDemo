//
//  TggEasyTextTool.h
//  TggEasyGetTextHeight
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface TggEasyTool : NSObject



+ (NSString *)specialSymbolsCharacter;

/**
 *  版本比对
 *
 *  @param oldver 老的版本
 *  @param newver 心的版本
 *
 *  @return  是否更新Bool
 */
+ (BOOL)tggVersion:(NSString *)oldver lessthan:(NSString *)newver;


/**
 *判断中英混合的的字符串长度
 @params strtemp        传入的string
 @params NSUInteger     返回的int长度
 */
+ (NSUInteger)tggConvertToInt:(NSString*)strtemp;


/**
 *标准时间字符串转自定义时间串
 @params dateStr  传入的标准%@|%@
 @params NSString＊  返回的%@-%@
 */
+ (NSString *)tggAlterDoubleStringWithVerticalBar:(NSString *)string;


/**
 *标准时间字符串转自定义时间串
 @params dateStr  传入的标准时间字符串
 @params NSString＊  返回的自定义时间串
 */
+ (NSString *)calculateTimeToMyTime:(NSString *)dateStr;

/**
 *中文数组按拼音排序
 @params model  传入的模型
 @params NSDictionary  返回的字典
 */
+ (NSMutableDictionary *)convertModelToDictionary:(id)model;

/**
 *中文数组按拼音排序
 @number array  传入中文数组
 */
+ (NSMutableArray *)sortData:(NSArray *)array;

/**
 *颜色转换为背景图片
 @number color  输入颜色
 */
+ (UIImage *)tggAlterToImageWithColor:(UIColor *)color;

/**
 *打电话
 @number image  电话号码
 */
+ (void)tggCallPhoneNumber:(NSString *)number;

/**
 *裁剪图片
 @params image  裁剪的图片
 @params size   最终的裁剪大小
 @params UIImage 最终裁剪的图片
 */
+ (UIImage *)tggCutImageWithImage:(UIImage *)image ToSize:(CGSize)size;

/**
 *播放系统声音
 @params name 系统文件名称
 @params type 系统文件类型
 @params isVibrate 是否开启震动
 */
+ (void)tggPlaySystemSoundWithSystemName:(NSString *)soundName SystemType:(NSString *)soundType IsVibrate:(BOOL)isVibrate;

/**
 *播放自定义声音
 @params name 系统文件名称
 @params type 系统文件类型
  @params isVibrate 是否开启震动
 */
+ (void)tggPlayCustomSoundWithSystemName:(NSString *)soundName SystemType:(NSString *)soundType IsVibrate:(BOOL)isVibrate;

/**
 *获取文字高度
 @params text 文字
 @params width 文字间距
 @params fontSize 系统文字大小
 @params linespace 文字间距 默认为0，需加首行高度5
 */
+ (CGFloat)tggEasyGetTextHeightWithText:(NSString *)text
                                  width:(CGFloat)width
                               fontSize:(CGFloat)fontSize
                              linespace:(CGFloat)linespace;

+ (CGFloat)tggEasyGetTextWidthWithText:(NSString *)text
                                 width:(CGFloat)width
                              fontSize:(CGFloat)fontSize;

+ (NSString *)calculateTimeWithInterval:(NSNumber *)interval;

+ (NSString *)parse:(NSString *)CS webaddress:(NSString *)webaddress;


/**
 *为控件字体改多种颜色
 @params view  buttonOrlabel
 @params loc   起始位置
 @params len   需要变色的长度
 @params color 最终转换的颜色
 */
+ (void)tggChanggeTextColorWithView:(UIView *)view
                           location:(NSUInteger)loc
                             length:(NSUInteger)len
                          textColor:(UIColor *)color;

/**
 *为控件字体改多种大小
 @params view  buttonOrlabel
 @params loc   起始位置
 @params len   需要变色的长度
 @params textFont 最终转换的颜色
 */
+ (void)tggChangeTextFontWithView:(UIView *)view
                         location:(NSUInteger)loc
                           length:(NSUInteger)len
                         textFont:(CGFloat)textFont;


+ (NSMutableAttributedString *)tggChanggeTextColorWithText:(NSString *)text
                           location:(NSUInteger)loc
                             length:(NSUInteger)len
                          textColor:(UIColor *)color;

/**
 *为控件添加划线
 @params view buttonOrlabel
 @params type 添加划线的种类 >
 >>>>>>>>>>>>>>>>>>>>>>>>>>>1: 中划线 2: 下划线
 */
+ (void)tggAddSingelLineWithTextView:(UIView *)view LineType:(NSInteger)type;


+ (NSInteger)tgEasyGetCurrentWeekDay;


+ (NSString *)tgEasyGetCurrentDate; //年.月.日



@end
