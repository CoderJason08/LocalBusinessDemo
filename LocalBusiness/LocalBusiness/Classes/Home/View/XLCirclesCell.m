//
//  XLCirclesCell.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLCirclesCell.h"
#import "UIImageView+AFNetworking.h"


@interface XLCirclesCell ()
/**
 *  图片view
 */
@property (nonatomic, strong) UIImageView *imageView;
/**
 *  描述Label
 */
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation XLCirclesCell

/**
 *  创建CollectionView cell
 *
 *  @param collectionView collectionView
 *  @param indexPath      indexpath
 */
+ (instancetype)circlesCellWith:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{
    XLCirclesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = Random_COLOR;
    // 为cell添加点击事件
    
    return cell;
}

/**
 *  初始化方法中加载子控件
 */
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

/**
 *  设置子控件
 */
- (void)setupSubviews {
    [self addSubview:self.imageView];
    [self addSubview:self.nameLabel];
}


/**
 *  布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-5);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.nameLabel.mas_top).offset(-5);
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self).offset(12);
    }];
}


/**
 *  设置数据
 */
- (void)setGroup:(GroupModel *)group {
    _group = group;
    [self.imageView setImageWithURL:[NSURL URLWithString:group.cover]];
    self.nameLabel.text = group.title;
}

#pragma mark - Private Function



#pragma mark - Getter & Setter 

- (UIImageView *)imageView {
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        self.imageView.backgroundColor = [UIColor orangeColor];
    }
    return _imageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = FONT(14);
//        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        
        self.nameLabel.text = @"测试测试";
//        self.nameLabel.backgroundColor = [UIColor greenColor];
        
        [self.nameLabel sizeToFit];
    }
    return _nameLabel;
}

@end













