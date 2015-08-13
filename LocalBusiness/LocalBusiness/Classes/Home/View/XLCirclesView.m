//
//  XLCirclesView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLCirclesView.h"
#import "XLCirclesCell.h"


@interface XLCirclesView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation XLCirclesView

+ (instancetype)circlesViews {
    return [[self alloc] init];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

/**
 *  设置子控件
 */
- (void)setupSubviews {
    [self addSubview:self.collectionView];
    self.backgroundColor = [UIColor blueColor];
}

//- (void)layoutSubviews {
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.equalTo(self);
//        make.center.equalTo(self);
//    }];
//}


#pragma mark - Getter & Setter 

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // 创建collectionView时必须设置一个布局参数
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 353 * (SCREEN_WIDTH / 320) / 2.0) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        
        // 设置数据源和代理
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        // 注册cell
        [self.collectionView registerClass:[XLCirclesCell class] forCellWithReuseIdentifier:reuseIdentifier];
        self.collectionView.backgroundColor = [UIColor redColor];
    }
    return _collectionView;
}

/**
 *  设置cell的布局
 */
- (void)layoutSubviews {
    // 设置collectionView布局参数
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.frame.size.width / 4, self.frame.size.height / 2);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [self.collectionView setCollectionViewLayout:layout];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XLCirclesCell *cell = [XLCirclesCell circlesCellWith:collectionView indexPath:indexPath];
    return cell;
}


@end





