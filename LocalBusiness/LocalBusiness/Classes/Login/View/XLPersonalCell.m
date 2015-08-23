//
//  XLPersonalCell.m
//  LocalBusiness
//
//  Created by Jason on 15/8/21.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLPersonalCell.h"

@interface XLPersonalCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIView *bottomView;

@end

@implementation XLPersonalCell

+ (XLPersonalCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *reuseIdentifier = @"cell";
    XLPersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[XLPersonalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.rightLabel];
    [self addSubview:self.bottomView];
}

- (void)layoutSubviews {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(150);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right);
        make.top.bottom.equalTo(self);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

- (void)setParameter:(NSMutableDictionary *)parameter {
    _parameter = parameter;
    self.titleLabel.text = [parameter valueForKey:@"left"];
    self.rightLabel.text = [parameter valueForKey:@"right"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FONT(18);
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)rightLabel {
    if (!_rightLabel) {
        self.rightLabel = [[UILabel alloc] init];
        self.rightLabel.font = FONT(18);
        self.rightLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _rightLabel;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        self.bottomView = [[UIView alloc] init];
        self.bottomView.backgroundColor = Default_BG_COLOR;
    }
    return _bottomView;
}

@end
