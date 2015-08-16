//
//  XLGuessCell.m
//  LocalBusiness
//
//  Created by Jason on 15/8/15.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLGuessCell.h"
#import "UIImageView+AFNetworking.h"

@interface XLGuessCell ()

/**
 *  图标
 */
@property (nonatomic, strong) UIImageView *iconImageView;
/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 *  简介
 */
@property (nonatomic, strong) UILabel *introLabel;
/**
 *  价格
 */
@property (nonatomic, strong) UILabel *priceLabel;
/**
 *  顶部分隔线
 */
@property (nonatomic, strong) UIView *topSepLine;

@end

@implementation XLGuessCell

+ (instancetype)guessCellWithTableView:(UITableView *)tableView {
    static NSString *reuseIdentifier = @"XLGuessCell";
    XLGuessCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[XLGuessCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XLGuessCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:@"XLGuessCell"]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setModel:(GuessModel *)model {
    _model = model;
    [self.iconImageView setImageWithURL:[NSURL URLWithString:model.cover]];
    [self.titleLabel setText:model.title];
    [self.introLabel setText:model.intro];
    [self.priceLabel setText:[NSString stringWithFormat:@"价格:%.2lf元",model.price]];
}



/**
 *  设置子控件
 */
- (void)setupSubviews {
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.introLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.topSepLine];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.topSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(86, 81));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(6);
        make.top.equalTo(self.iconImageView);
    }];
    
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self).offset(-10);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.mas_equalTo(self.introLabel.mas_bottom).offset(10);
    }];
}

#pragma mark - Getter & Setter 

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FONT(18);
        self.titleLabel.textColor = COLOR_RGBA(40, 40, 40, 1);
        
//        self.titleLabel.text = @"味多美糕点";
//        self.titleLabel.backgroundColor = Random_COLOR;
        
        [self.titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)introLabel {
    if (!_introLabel) {
        self.introLabel = [[UILabel alloc] init];
        self.introLabel.textColor = COLOR_RGBA(52, 52, 52, 1);
        self.introLabel.font = FONT(16);
        self.introLabel.numberOfLines = 0;
        self.introLabel.adjustsFontSizeToFitWidth = YES;
        
//        self.introLabel.text = @"黑蒜原价106元/桶，现价88元/桶。";
//        self.introLabel.backgroundColor = Random_COLOR;
    }
    return _introLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        self.iconImageView = [[UIImageView alloc] init];
        
//        self.iconImageView.backgroundColor = [UIColor greenColor];
    }
    return _iconImageView;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.textColor = kYellowColor;
        self.priceLabel.font = FONT(14);
        
//        self.priceLabel.text = @"价格:123元";
//        self.priceLabel.backgroundColor = Random_COLOR;
    }
    return _priceLabel;
}

- (UIView *)topSepLine {
    if (!_topSepLine) {
        self.topSepLine = [[UIView alloc] init];
        self.topSepLine.backgroundColor = Default_BG_COLOR;
    }
    return _topSepLine;
}

@end
