//
//  XLCircleViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLCircleViewController.h"
#import "XLCircleListModel.h"
#import "XLAllCirclesCollectionCell.h"

@interface XLCircleViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
/**
 *  圈子模型
 */
@property (nonatomic, strong) XLCircleListModel *circlesList;
/**
 *  布局参数
 */
@property (nonatomic, strong)  UICollectionViewFlowLayout *flowLayout;
/**
 *  
 */

@end

@implementation XLCircleViewController {
    UICollectionView *_collectionView;
}

- (void)loadView {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.view = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) collectionViewLayout:self.flowLayout];
    _collectionView = (UICollectionView *)self.view;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CGFloat padding = 20;
    CGFloat itemWidth = _collectionView.frame.size.width / 4;
    CGFloat itemHeight = itemWidth + 10;
    self.flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    [_collectionView setCollectionViewLayout:self.flowLayout];
//    [_collectionView registerClass:[XLAllCirclesCollectionCell class] forCellWithReuseIdentifier:@"XLAllCirclesCollectionCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"XLAllCirclesCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"XLAllCirclesCollectionCell"];
    
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData {
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:[XLFunction getTimeStamp] forKey:@"time"];
    [para setObject:[XLFunction MD5SignWithParaArray:@[APP_ID,para[@"time"],APP_KEY]] forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    
    [self showActivityHUD];
    [XLNewtWorkManager XLGET:kAllCircles parameters:para success:^(id responseObject) {
        [self hideActivityHUD];
        self.circlesList = [[XLCircleListModel alloc] initWithDictionary:responseObject error:NULL];
        [_collectionView reloadData];
    } error:^(id error) {
        [self hideActivityHUD];
        NSLog(@"%@",error);
    } failure:^(NSError *error) {
        [self hideActivityHUD];
        NSLog(@"%@",error);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.circlesList.list.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XLAllCirclesCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XLAllCirclesCollectionCell" forIndexPath:indexPath];
    cell.model = self.circlesList.list[indexPath.row];
    return cell;
}
@end
