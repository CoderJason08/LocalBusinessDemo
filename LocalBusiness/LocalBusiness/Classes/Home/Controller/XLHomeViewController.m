//
//  XLHomeViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLHomeViewController.h"
#import "XLNewtWorkManager.h"
#import "XLAdvertiseView.h"
#import "XLHomeModel.h"
#import "XLCirclesView.h"
#import "XLRecommendView.h"
#import "XLHeaderView.h"

@interface XLHomeViewController () <UITableViewDataSource,UITableViewDelegate>

/**
 *  广告view
 */
@property (nonatomic, strong) XLAdvertiseView *advertiseView;

@property (nonatomic, strong) XLHomeModel *homeModel;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

@implementation XLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 禁用系统分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 禁用滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    // 设置HeaderView
    self.tableView.tableHeaderView = self.advertiseView;
    
    [XLLocationManager getLocationSuccess:^(CLLocationCoordinate2D coordinate) {
        self.coordinate = coordinate;
        [self requestData];
    } error:^(NSError *error) {
        // 为地理位置设置默认值
        self.coordinate = CLLocationCoordinate2DMake(36.06, 120.38);
        [self requestData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData {
    /**
     *  设置请求参数
     */
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:[NSString stringWithFormat:@"%lf",self.coordinate.longitude] forKey:@"lon"];
    [para setObject:[NSString stringWithFormat:@"%lf",self.coordinate.latitude] forKey:@"lat"];
    [para setObject:[XLFunction getTimeStamp] forKey:@"time"];
    NSArray *paraArray = @[APP_ID,para[@"lon"],para[@"lat"],para[@"time"],APP_KEY];
    [para setObject:[XLFunction MD5SignWithParaArray:paraArray] forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    
    /**
     *  请求数据
     */
    [XLNewtWorkManager XLGET:kIndexInfo parameters:para success:^(id responseObject) {

        /**
         * 数据请求成功,设置模型数据
         */
        self.homeModel = [[XLHomeModel alloc] initWithDictionary:responseObject error:NULL];
        FocusListModel *foucusList = self.homeModel.focus;
        self.advertiseView.list = foucusList.list;
        [self.tableView reloadData];
    } error:^(id error) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) { // 第0组,圈子
        return 1;
    }else if (section == 1) { // 第1组,名店推荐
        return 1;
    }else {
        return 10;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        XLCirclesView *circlesView = [XLCirclesView circlesView];
        circlesView.list = self.homeModel.group;
        return circlesView;
    }else if (indexPath.section == 1) {
        XLRecommendView *recommendView = [XLRecommendView recommendView];
        recommendView.famousList = self.homeModel.famous;
        return recommendView;
    }else {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = Random_COLOR;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 353 * (SCREEN_WIDTH / 320) / 2.0;
    }else if (indexPath.section == 1) {
        return 400 * (SCREEN_WIDTH / 320) / 2.0;
    }else {
        return 100;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1 || section == 2) {
        return 40;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    if (section == 1) { // 名店推荐
        return [XLHeaderView headerViewWithTitle:@"名店推荐" color:COLOR_RGBA(241, 97, 100, 1)];
    }else if (section == 2) { // 猜你喜欢
        return [XLHeaderView headerViewWithTitle:@"猜你喜欢" color:COLOR_RGBA(240, 112, 171, 1)];
    }
    return nil;
}


#pragma mark - Getter & Setter 

- (XLAdvertiseView *)advertiseView {
    if (!_advertiseView) {
        self.advertiseView = [XLAdvertiseView advertiseView];
        CGFloat height = 353 * (SCREEN_HEIGHT / 568) / 2.0 ;
        self.advertiseView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    }
    return _advertiseView;
}

@end
