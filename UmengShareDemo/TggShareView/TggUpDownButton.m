//
//  TggUpDownButton.m
//  UmengShareDemo
//
//  Created by 铁拳科技 on 16/8/25.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggUpDownButton.h"

@implementation TggUpDownButton{
    /** 文字的矩形框 */
    CGSize _textSize;
    /** image的矩形框 */
    CGSize _imageSize;
    /** spacing,上下间距 */
    CGFloat _spacing;
}




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
                      imageSize:(CGSize)imageSize {
    TggUpDownButton *instance = [[TggUpDownButton alloc] initWithFrame:frame
                                                               title:title
                                                                Font:font
                                                             spacing:spacing imageSize:imageSize];
    return instance;
}

/**
 *  重写initWithFrame方法，扩展参数
 *
 *  @param frame     buttonFrame
 *  @param font      titleLabel的字体大小
 *  @param spacing   image和title的间距
 *  @param imageSize image的size是否手动设置，填写CGZiseZero则为默认image的大小
 *
 *  @return TggUpDownButton
 */
- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                         Font:(UIFont *)font
                      spacing:(CGFloat)spacing
                    imageSize:(CGSize)imageSize {
    self = [super initWithFrame:frame];
    if (self) {
        // titleLabel
        [self setTitle:title forState:UIControlStateNormal];
        [self.titleLabel setFont:font];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        _textSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(10000,50)
                                                               options:NSStringDrawingUsesLineFragmentOrigin
                                                            attributes:@{NSFontAttributeName:font}
                                                               context:nil].size;
        // contentImage
        UIImage *image = [UIImage imageNamed:@"share_friend.png"];
        [self setImage:image forState:UIControlStateNormal];
        if (CGSizeEqualToSize(imageSize, CGSizeZero)) {
            _imageSize = image.size;
        } else {
            _imageSize = imageSize;
        }
        
        // spacing
        if (spacing > 0) {
            _spacing = spacing;
            _imageSize.height += spacing;
        }
    }
    return self;
}


/** 重写imageRect，在titleRect..方法后执行 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = (self.frame.size.width - _imageSize.width) / 2;
    CGFloat imageY =  (self.frame.size.height - _imageSize.height - _textSize.height) / 2;
    return CGRectMake(imageX, imageY, _imageSize.width, _spacing > 0 ? _imageSize.height - _spacing : _imageSize.height);
    
}

/** 重写titleRect */
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = (self.frame.size.width - _textSize.width) / 2;
    CGFloat imageY = (self.frame.size.height - _imageSize.height - _textSize.height) / 2 + _imageSize.height;
    return CGRectMake(imageX, imageY, _textSize.width, _textSize.height);
    
}





@end
