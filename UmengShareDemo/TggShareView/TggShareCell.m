//
//  TggShareCell.m
//  UmengShareDemo
//
//  Created by 铁拳科技 on 16/8/25.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggShareCell.h"
#import "TggUpDownButton.h"

@interface TggShareCell ()


@property (nonatomic, strong) TggUpDownButton *button;



@end

@implementation TggShareCell

- (TggUpDownButton *)button {
    if (!_button) {
        _button = [TggUpDownButton buttonWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
                                                             title:@"titlesOfButton"
                                                              Font:[UIFont systemFontOfSize:13]
                                                           spacing:5
                                                         imageSize:CGSizeMake(50, 50)];
        [_button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        _button.backgroundColor = [UIColor clearColor];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
    }
    return _button;
}

- (void)setModel:(TggShareItem *)model {
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.button setTitle:self.model.title forState:UIControlStateNormal];
    
    [self.button setImage:[UIImage imageNamed:self.model.icon] forState:UIControlStateNormal];
}

- (void)buttonAction {
    if (self.selectedBlock) {
        self.selectedBlock();
    }
}





@end
