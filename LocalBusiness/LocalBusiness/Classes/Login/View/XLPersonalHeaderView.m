//
//  XLPersonalHeaderView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/20.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLPersonalHeaderView.h"

@interface XLPersonalHeaderView ()
/**
 *  头像
 */
@property (nonatomic, strong) UIImageView *iconView;
/**
 *  nameLabel
 */
@property (nonatomic, strong) UILabel *nameLabel;
/**
 *  orderButton
 */
@property (nonatomic, strong) XLBarButton *orderButton;
/**
 *  bottomView
 */
@property (nonatomic, strong) UIView *bottomView;
@end


@implementation XLPersonalHeaderView

+ (XLPersonalHeaderView *)personalHeaderView {
    return [[self alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 132)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}


- (void)setupSubViews {
    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.orderButton];
    [self addSubview:self.bottomView];
}

- (void)layoutSubviews {
    [self.iconView xlSetImageWithURL:[XLUserInfo sharedInfo].infoModel.small_avatar];
    NSLog(@"%@",[XLUserInfo sharedInfo].infoModel.small_avatar);
    CGFloat width = 108;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(12);
        make.left.equalTo(self).offset(15);
        make.size.mas_equalTo(CGSizeMake(width, width));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(25);
        make.top.equalTo(self).offset(30);
    }];
    
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(18);
        make.width.mas_equalTo(80);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(6);
    }];
}


#pragma mark - Getter & Setter 

- (UIImageView *)iconView {
    if (!_iconView) {
        self.iconView = [[UIImageView alloc] init];
        self.iconView.layer.cornerRadius = 54;
        [self.iconView.layer masksToBounds];
        self.iconView.backgroundColor = Random_COLOR;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = FONT(22);
        self.nameLabel.text = [XLUserInfo sharedInfo].infoModel.user_name;
        self.nameLabel.textColor = [UIColor blackColor];
        
        [self.nameLabel sizeToFit];
    }
    return _nameLabel;
}

- (XLBarButton *)orderButton {
    if (!_orderButton) {
        self.orderButton = [XLFactory buttonWithTitle:@"我的订单" image:nil type:XLButtonTypeRound];
        self.orderButton.backgroundColor = Nav_BAR_COLOR;
        
        [self.orderButton sizeToFit];
    }
    return _orderButton;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        self.bottomView = [[UIView alloc] init];
        self.bottomView.backgroundColor = Default_BG_COLOR;
    }
    return _bottomView;
}

@end
