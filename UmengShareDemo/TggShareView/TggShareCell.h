//
//  TggShareCell.h
//  UmengShareDemo
//
//  Created by 铁拳科技 on 16/8/25.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TggShareItem.h"

typedef void(^SelectedBlock)();


@interface TggShareCell : UICollectionViewCell


@property (nonatomic, strong) TggShareItem *model;

@property (nonatomic, copy) SelectedBlock selectedBlock;



@end
