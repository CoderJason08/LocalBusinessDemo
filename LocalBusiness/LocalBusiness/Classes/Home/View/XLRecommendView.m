//
//  XLRecommendView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLRecommendView.h"
#import "XLRecommendCell.h"

@interface XLRecommendView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation XLRecommendView

+ (instancetype)recommendView {
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

- (void)setFamousList:(FamousListModel *)famousList {
    _famousList = famousList;
    [self.collectionView reloadData];
}

/**
 *  设置子控件
 */
- (void)setupSubviews {
    [self addSubview:self.collectionView];
}



#pragma mark - Getter & Setter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // 创建collectionView时必须设置一个布局参数
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 400 * (SCREEN_WIDTH / 320) / 2.0)  collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        // 设置数据源和代理
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        // 注册cell
        [self.collectionView registerClass:[XLRecommendCell class] forCellWithReuseIdentifier:reuseIdentifier];
        
        //        self.collectionView.backgroundColor = [UIColor redColor];
    }
    return _collectionView;
}


/**
 *  设置cell的布局
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 设置collectionView布局参数
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.frame.size.width / 2, self.frame.size.height / 2);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [self.collectionView setCollectionViewLayout:layout];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XLRecommendCell *cell = [XLRecommendCell recommendCell:collectionView indexPath:indexPath];
    cell.famous = self.famousList.list[indexPath.row];

    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(recommendView:didSelectedItemWith:)]) {
        // 取出对应的模型
        GroupModel *model = self.famousList.list[indexPath.row];
        [self.delegate recommendView:self didSelectedItemWith:model];
    }
}


@end
