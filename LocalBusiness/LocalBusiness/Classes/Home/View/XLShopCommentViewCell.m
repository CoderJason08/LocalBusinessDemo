//
//  XLShopCommentViewCell.m
//  LocalBusiness
//
//  Created by Amisear on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLShopCommentViewCell.h"

@interface XLShopCommentViewCell()

/**
 *  用户头像
 */
@property (strong, nonatomic) IBOutlet UIImageView *userIcon;

/**
 *  用户名
 */
@property (strong, nonatomic) IBOutlet UILabel *userName;

/**
 *  日期
 */
@property (strong, nonatomic) IBOutlet UILabel *day;

/**
 *  评分
 */
@property (strong, nonatomic) IBOutlet UIImageView *comment;

/**
 *  评价内容
 */
@property (strong, nonatomic) IBOutlet UILabel *commentLable;



@end

@implementation XLShopCommentViewCell



- (void)awakeFromNib {
    // Initialization code
}


- (void)setModel:(ShopCommentModel *)model {
    
    _model = model;
    
    [_userIcon xlSetImageWithURL:model.avatar];
    
    _userName.text = _model.name;
    
    _day.text = _model.date;
    
    _commentLable.text = _model.content;
    
    int i = _model.score;
    //star_0
    NSString *imagName = [NSString stringWithFormat:@"star_%d",i];
    [_comment setImage:[UIImage imageNamed:imagName]];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
