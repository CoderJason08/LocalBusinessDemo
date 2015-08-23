//
//  XLOursViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLToolsViewController.h"
#import "XLToolsListModel.h"
#import "XLToolsCollectionViewCell.h"
#import "XLToolDetailViewController.h"

@interface XLToolsViewController () <UICollectionViewDelegate,UICollectionViewDataSource,XLToolsCollectionViewCellDelegate>
@property (nonatomic, strong) XLToolsListModel *toolsList;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation XLToolsViewController {
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
    [_collectionView registerNib:[UINib nibWithNibName:@"XLToolsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"XLToolsCollectionViewCell"];
    
    self.flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 3, SCREEN_WIDTH / 3);
    self.flowLayout.minimumLineSpacing = 20;
    self.flowLayout.minimumInteritemSpacing = 0;
    [_collectionView setCollectionViewLayout:self.flowLayout];
    
    [self requestData];
}

- (void)requestData {
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:[XLFunction getTimeStamp] forKey:@"time"];
    [para setObject:[XLFunction MD5SignWithParaArray:@[APP_ID,para[@"time"],APP_KEY]] forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    [para setObject:APP_KEY forKey:@"key"];
    
    [self showActivityHUD];
    [XLNewtWorkManager XLPOST:kTools parameters:para success:^(id responseObject) {
        self.toolsList = [[XLToolsListModel alloc] initWithDictionary:responseObject error:NULL];
        [_collectionView reloadData];
        [self hideActivityHUD];
    } error:^(id error) {
        NSLog(@"%@",error);
         [self hideActivityHUD];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
         [self hideActivityHUD];
    }];
    
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.toolsList.tools_list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XLToolsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XLToolsCollectionViewCell" forIndexPath:indexPath];
    cell.tool = self.toolsList.tools_list[indexPath.row];
    cell.delegate = self;
    return cell;
}

#pragma mark - XLToolsCollectionViewCellDelegate

- (void)toolsCollectionViewCell:(XLToolsCollectionViewCell *)cell didClickWithURL:(NSURL *)url title:(NSString *)title {
    XLToolDetailViewController *vc =  [[XLToolDetailViewController alloc] init];
    [vc.navigationItem setTitle:title];
    [vc.parameter setObject:url forKey:@"url"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
