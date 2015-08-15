//
//  XLRecommendCell.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLRecommendCell.h"
#import "UIImageView+AFNetworking.h"

@interface XLRecommendCell ()
/**
 *  标题
 */
@property (nonatomic, strong) UILabel *nameLabel;
/**
 *  打分
 */
@property (nonatomic, strong) UIImageView *starImageView;
/**
 *  简介
 */
@property (nonatomic, strong) UILabel *introLabel;
/**
 *  图片
 */
@property (nonatomic, strong) UIImageView *iconImageView;
/**
 *  距离
 */
@property (nonatomic, strong) UIButton *distanceButton;
/**
 *  顶部分隔线
 */
@property (nonatomic, strong) UIView *topSepLine;

/**
 *  左边分隔线
 */
@property (nonatomic, strong) UIView *leftSepLine;

/**
 *  右边分隔线
 */
@property (nonatomic, strong) UIView *rightSepLine;

@end

@implementation XLRecommendCell

+(instancetype)recommendCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    XLRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = Random_COLOR;
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

/**
 *  分发数据
 */
- (void)setFamous:(FamousModel *)famous {
    _famous = famous;
    // 标题
    [self.nameLabel setText:famous.name];
    // 图片
    [self.iconImageView setImageWithURL:[NSURL URLWithString:famous.cover]];
    // 打分
    [self.starImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"star_%d",famous.score]]];
    // 描述
    [self.introLabel setText:famous.intro];
    // 距离
    [self.distanceButton setTitle:[NSString stringWithFormat:@"距离%d千米",famous.distance] forState:UIControlStateNormal];

}

/**
 *  设置子控件
 */
- (void)setupSubviews {
    [self addSubview:self.nameLabel];
    [self addSubview:self.starImageView];
    [self addSubview:self.iconImageView];
    
#warning 约束和子控件的添加顺序的关系
    [self addSubview:self.distanceButton];
    [self addSubview:self.introLabel];
    
    // 添加分割线
    [self addSubview:self.topSepLine];
    [self addSubview:self.leftSepLine];
    [self addSubview:self.rightSepLine];
}

/**
 *  设置约束
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    // 标题约束
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(10);
    }];
    // 评分约束
    [self.starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(60, 12));
    }];
    // 图片约束
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-5);
        make.size.mas_equalTo(CGSizeMake(53, 53));
    }];
    // 距离约束
    [self.distanceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-10);
        make.right.equalTo(self.iconImageView);
    }];
    // Label约束
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.starImageView);
        make.top.mas_equalTo(self.starImageView.mas_bottom).offset(6);
        make.right.mas_equalTo(self.distanceButton.mas_left).offset(-5);
        make.bottom.equalTo(self);
    }];
    
    
    /**
     *  设置分隔线约束
     */
    [self.topSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [self.leftSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.width.mas_equalTo(0.5);
    }];
    
    [self.rightSepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.width.mas_equalTo(0.5);
    }];
}




#pragma mark - Getter & Setter 

#warning 设置了测试数据

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = FONT(18);
        self.nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

- (UIImageView *)starImageView {
    if (!_starImageView) {
        self.starImageView = [[UIImageView alloc] init];
    }
    return _starImageView;
}

- (UILabel *)introLabel {
    if (!_introLabel) {
        self.introLabel = [[UILabel alloc] init];
        self.introLabel.textColor = [UIColor blackColor];
        self.introLabel.font = FONT(16);
        self.introLabel.numberOfLines = 0;
        self.introLabel.adjustsFontSizeToFitWidth = YES;
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

- (UIButton *)distanceButton {
    if (!_distanceButton) {
        self.distanceButton = [[UIButton alloc] init];
        [self.distanceButton setTitleColor:COLOR_RGBA(245, 173, 39, 1) forState:UIControlStateNormal];
        [self.distanceButton setImage:[UIImage imageNamed:@"home_location"] forState:UIControlStateNormal];
        self.distanceButton.titleLabel.font = FONT(10);
        self.distanceButton.enabled = NO;
        
//        [self.distanceButton setTitle:@"距离xxx米" forState:UIControlStateNormal];
//        self.distanceButton.backgroundColor = Random_COLOR;
//        [self.distanceButton sizeToFit];
    }
    return _distanceButton;
}

/**********  分隔线  **********/

- (UIView *)topSepLine {
    if (!_topSepLine) {
        self.topSepLine = [[UIView alloc] init];
        self.topSepLine.backgroundColor = Default_BG_COLOR;
    }
    return _topSepLine;
}

- (UIView *)leftSepLine {
    if (!_leftSepLine) {
        self.leftSepLine = [[UIView alloc] init];
        self.leftSepLine.backgroundColor = Default_BG_COLOR;
    }
    return _leftSepLine;
}

- (UIView *)rightSepLine {
    if (!_rightSepLine) {
        self.rightSepLine = [[UIView alloc] init];
        self.rightSepLine.backgroundColor = Default_BG_COLOR;
    }
    return _rightSepLine;
}

@end
