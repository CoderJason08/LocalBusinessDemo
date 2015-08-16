//
//  XLShopHeaderView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLShopHeaderView.h"


@interface XLShopHeaderView ()
/**
 *  图标
 */
@property (nonatomic, strong) UIImageView *iconImageView;
/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 *  评分ImageView
 */
@property (nonatomic, strong) UIImageView *starImageView;
/**
 *  评分Label
 */
@property (nonatomic, strong) UILabel *starLabel;
/**
 *  服务类型
 */
@property (nonatomic, strong) UILabel *serverLabel;
/**
 *  分享按钮
 */
@property (nonatomic, strong) XLBarButton *shareButton;

@end

@implementation XLShopHeaderView

/**
 *  初始化一个商品详情的顶部视图
 */
+ (XLShopHeaderView *)shopHeaderView {
    return [[self alloc] init];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
}


#pragma mark - Getter & Setter 

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        self.iconImageView = [[UIImageView alloc] init];
        
        self.iconImageView.backgroundColor = Random_COLOR;
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        
        self.titleLabel.backgroundColor = Random_COLOR;
    }
    return _<#name#>;
}

@end
