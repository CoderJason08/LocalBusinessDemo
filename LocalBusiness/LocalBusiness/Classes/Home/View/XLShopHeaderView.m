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
@property (nonatomic, strong) UIButton *iconImageButton;
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
/**
 *  top分隔线
 */
@property (nonatomic, strong) UIView *topSepLine;
/**
 *  地理位置Button
 */
@property (nonatomic, strong) XLBarButton *locationButton;
/**
 *  电话Button
 */
@property (nonatomic, strong) XLBarButton *phoneButton;
/**
 *  垂直分割线
 */
@property (nonatomic, strong) UIView *verticleSepLine;
/**
 *  center分隔线
 */
@property (nonatomic, strong) UIView *centerSepLine;
/**
 *  描述Label
 */
@property (nonatomic, strong) UILabel *introLabel;

@end

@implementation XLShopHeaderView


/**
 *  return headerView
 */
+ (XLShopHeaderView *)shopHeaderView {
    return [[self alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

#pragma mark - initialize

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setShopModel:(XLShopModel *)shopModel {
    _shopModel = shopModel;
    /**
     *  set model
     */
    [self.iconImageButton xlSetImageWithURL:shopModel.cover];
    [self.titleLabel setText:shopModel.name];
    [self.starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"star_%d",shopModel.score]]];
    [self.starLabel setText:[NSString stringWithFormat:@"%d分",shopModel.score]];
    [self.serverLabel setText:shopModel.server];
    [self.phoneButton setTitle:shopModel.phone forState:UIControlStateNormal];
    [self.locationButton setTitle:shopModel.address forState:UIControlStateNormal];
    [self.introLabel setText:shopModel.intro];
}

/**
 *  add subViews
 */
- (void)setupSubviews {
    [self addSubview:self.iconImageButton];
    [self addSubview:self.titleLabel];
    [self addSubview:self.starImageView];
    [self addSubview:self.starLabel];
    [self addSubview:self.serverLabel];
    [self addSubview:self.shareButton];
    [self addSubview:self.topSepLine];
    [self addSubview:self.locationButton];
    [self addSubview:self.verticleSepLine];
    [self addSubview:self.phoneButton];
    [self addSubview:self.centerSepLine];
    [self addSubview:self.introLabel];
}

/**
 *  layout subViews
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.iconImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.left.mas_equalTo(self.iconImageButton.mas_right).offset(10);
    }];
    
    [self.starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    
    [self.starLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.starImageView);
        make.left.mas_equalTo(self.starImageView.mas_right).offset(5);
    }];
    
    [self.serverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.starImageView);
        make.top.mas_equalTo(self.starImageView.mas_bottom).offset(10);
    }];
    
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.serverLabel);
        make.right.equalTo(self).offset(-10);
        make.width.mas_equalTo(80);
    }];
    
    [self.topSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shareButton.mas_bottom).offset(5);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [self.phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topSepLine).offset(1);
        make.right.equalTo(self).offset(-5);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(150);
    }];
    
    [self.verticleSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topSepLine).offset(4);
        make.bottom.equalTo(self.phoneButton).offset(-4);
        make.right.mas_equalTo(self.phoneButton.mas_left).offset(-2);
        make.width.mas_equalTo(0.5);
    }];
    
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.topSepLine).offset(1);
        make.right.mas_equalTo(self.verticleSepLine.mas_left);
        make.height.equalTo(self.phoneButton);
    }];
    
    [self.centerSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.mas_equalTo(self.phoneButton.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.mas_equalTo(self.centerSepLine.mas_bottom);
    }];
}

/**
 *  update HeaderView Frame
 */
- (CGRect)updateFrame {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:FONT(16) forKey:NSFontAttributeName];
    CGSize size = [self.introLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return CGRectMake(0, 0, SCREEN_WIDTH, 140 + size.height);
}

#pragma mark - Action

- (void)locationButtonDidClick {
    if ([self.delegate respondsToSelector:@selector(shopHeaderView:locationButtonDidClickWithModel:)]) {
        [self.delegate shopHeaderView:self locationButtonDidClickWithModel:self.shopModel];
    }
}

- (void)shareButtonClicked {
    if ([self.delegate respondsToSelector:@selector(shopHeaderView:shareButtonDidClickWithModel:)]) {
        [self.delegate shopHeaderView:self shareButtonDidClickWithModel:self.shopModel];
    }
}

- (void)phoneButtonClicked {
    if ([self.delegate respondsToSelector:@selector(shopHeaderView:phoneButtonDidClickWithModel:)]) {
        [self.delegate shopHeaderView:self phoneButtonDidClickWithModel:self.shopModel];
    }
}

#pragma mark - Getter & Setter

- (UIButton *)iconImageButton {
    if (!_iconImageButton) {
        self.iconImageButton = [[UIButton alloc] init];
        
//        self.iconImageButton.backgroundColor = Random_COLOR;
    }
    return _iconImageButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FONT(19);
        self.titleLabel.textColor = COLOR_RGBA(40, 40, 40, 1);
    }
    return _titleLabel;
}

- (UIImageView *)starImageView {
    if (!_starImageView) {
        self.starImageView = [[UIImageView alloc] init];
    }
    return _starImageView;
}

- (UILabel *)starLabel {
    if (!_starLabel) {
        self.starLabel = [[UILabel alloc] init];
        self.starLabel.font = FONT(16);
        self.starLabel.textColor = kOrangeColor;
    }
    return _starLabel;
}

- (UILabel *)serverLabel {
    if (!_serverLabel) {
        self.serverLabel = [[UILabel alloc] init];
        self.serverLabel.textColor = COLOR_RGBA(135, 135, 135, 1);
        self.serverLabel.font = FONT(12);
    }
    return _serverLabel;
}


- (XLBarButton *)shareButton {
    if (!_shareButton) {
        self.shareButton = [XLFactory buttonWithTitle:@"分享" image:nil type:XLButtonTypeRound];
        self.shareButton.tintColor = [UIColor whiteColor];
        self.shareButton.backgroundColor = Nav_BAR_COLOR;
        [self.shareButton addTarget:self action:@selector(shareButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}

- (UIView *)topSepLine {
    if (!_topSepLine) {
        self.topSepLine = [[UIView alloc] init];
        self.topSepLine.backgroundColor = Default_BG_COLOR;
    }
    return _topSepLine;
}

- (XLBarButton *)locationButton {
    if (!_locationButton) {
        self.locationButton = [XLFactory buttonWithTitle:nil image:[UIImage imageNamed:@"home_location_big"] type:XLButtonTypeNormal];
        [self.locationButton setTitleColor:kYellowColor forState:UIControlStateNormal];
        self.locationButton.titleLabel.font = FONT(14);
        [self.locationButton addTarget:self action:@selector(locationButtonDidClick) forControlEvents:UIControlEventTouchDown];
//        self.locationButton.backgroundColor = Random_COLOR;
    }
    return _locationButton;
}

- (XLBarButton *)phoneButton {
    if (!_phoneButton) {
        self.phoneButton = [XLFactory buttonWithTitle:nil image:[UIImage imageNamed:@"home_phone"] type:XLButtonTypeNormal];
        self.phoneButton.titleLabel.font = FONT(14);
        [self.phoneButton addTarget:self action:@selector(phoneButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.phoneButton setTitleColor:kOrangeColor forState:UIControlStateNormal];
        [self.phoneButton sizeToFit];
//        self.phoneButton.backgroundColor = Random_COLOR;
    }
    return _phoneButton;
}

- (UIView *)verticleSepLine {
    if (!_verticleSepLine) {
        self.verticleSepLine = [[UIView alloc] init];
        self.verticleSepLine.backgroundColor = Default_BG_COLOR;
    }
    return _verticleSepLine;
}


- (UIView *)centerSepLine {
    if (!_centerSepLine) {
        self.centerSepLine = [[UIView alloc] init];
        self.centerSepLine.backgroundColor = Default_BG_COLOR;
    }
    return _centerSepLine;
}

- (UILabel *)introLabel {
    if (!_introLabel) {
        self.introLabel = [[UILabel alloc] init];
        self.introLabel.textColor = COLOR_RGBA(66, 66, 66, 1);
        self.introLabel.font = FONT(16);
        self.introLabel.numberOfLines = 0;
        self.introLabel.adjustsFontSizeToFitWidth = YES;
        
        self.introLabel.text = @"";
    }
    return _introLabel;
}

@end
