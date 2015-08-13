//
//  XLHeaderView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLHeaderView.h"

@interface XLHeaderView ()

/**
 *  HeaderTitle Label
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 *  分割线
 */
@property (nonatomic, strong) UIView *seprateView;

@end


@implementation XLHeaderView


+ (instancetype)headerViewWithTitle:(NSString *)title color:(UIColor *)color {
    XLHeaderView *headerView = [[XLHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.titleLabel.text = title;
    headerView.titleLabel.textColor = color;
    return headerView;
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
    [self addSubview:self.seprateView];
    [self addSubview:self.titleLabel];
    
    
}

- (void)layoutSubviews {
    
    [self.seprateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(6);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.seprateView.mas_bottom);
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(15);
    }];
}


#pragma mark - Getter & Setter 

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FONT(22);
    }
    return _titleLabel;
}

- (UIView *)seprateView {
    if (!_seprateView) {
        self.seprateView = [[UIView alloc] init];
        self.seprateView.backgroundColor = Default_BG_COLOR;
    }
    return _seprateView;
}


@end
