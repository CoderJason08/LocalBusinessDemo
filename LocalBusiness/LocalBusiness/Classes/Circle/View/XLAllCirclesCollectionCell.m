//
//  XLAllCirclesCollectionCell.m
//  LocalBusiness
//
//  Created by Jason on 15/8/21.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLAllCirclesCollectionCell.h"

@interface XLAllCirclesCollectionCell ()
@property (weak, nonatomic) IBOutlet UIButton *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation XLAllCirclesCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(XLCircleModel *)model {
    _model = model;
    [self.iconImageView xlSetBackgroundImageWithURL:model.cover];
    [self.titleLabel setText:_model.title];
}

@end
