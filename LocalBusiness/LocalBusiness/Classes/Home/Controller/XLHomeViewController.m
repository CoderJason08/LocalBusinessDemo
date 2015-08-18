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
#import "XLGuessCell.h"
#import "XLShopViewController.h"
#import "XLGoodsViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"


#define HomeModelPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"homeModel.data"]

@interface XLHomeViewController () <UITableViewDataSource,UITableViewDelegate,XLCirclesViewDelegate,XLRecommendViewDelegate>

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
//    NSLog(@"%@",[XLUserInfo sharedInfo].infoModel);
    // 禁用系统分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 禁用滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    // 设置HeaderView
    self.tableView.tableHeaderView = self.advertiseView;
    
    // 使用FDTemplateLayoutCell必须注册cell
    [self.tableView registerClass:[XLGuessCell class] forCellReuseIdentifier:@"XLGuessCell"];
    
//  无法解档 已解决,在initWithCoder方法中,调用父类的init方法;
    // 解档保存的模型数据
//    self.homeModel = [NSKeyedUnarchiver unarchiveObjectWithFile:HomeModelPath];
    
    
    [XLLocationManager getLocationSuccess:^(CLLocationCoordinate2D coordinate) {
        self.coordinate = coordinate;
        [self requestHomeData];
    } error:^(NSError *error) {
        // 为地理位置设置默认值
        self.coordinate = CLLocationCoordinate2DMake(36.06, 120.38);
        [self requestHomeData];
    }];
    
    [self requestHomeData];
    
#warning  监听键盘弹出
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowNotification) name:@"UIKeyboardDidShowNotification" object:nil];
}

- (void)dealloc {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)setHomeModel:(XLHomeModel *)homeModel {
    _homeModel = homeModel;
    self.advertiseView.list = self.homeModel.focus;
    [self.tableView reloadData];
}

#pragma mark - 数据请求

- (void)requestHomeData {
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
    
    // 显示菊花
    [self showActivityHUD];
    /**
     *  请求数据
     */
    [XLNewtWorkManager XLGET:kIndexInfo parameters:para success:^(id responseObject) {
        
        [self hideActivityHUD];
        /**
         * 数据请求成功,设置模型数据
         */
        self.homeModel = [[XLHomeModel alloc] initWithDictionary:responseObject error:NULL];
        [self.tableView reloadData];
        // 归档数据
        [NSKeyedArchiver archiveRootObject:self.homeModel toFile:HomeModelPath];
        
    } error:^(id error) {
        [self hideActivityHUD];
        // 处理错误
        // ...
    } failure:^(NSError *error) {
        [self hideActivityHUD];
        // 处理失败
        // ...
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
//        return self.homeModel.guess.list.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) { // 第0组,创建圈子View
        XLCirclesView *circlesView = [XLCirclesView circlesView];
        circlesView.delegate = self;
        circlesView.list = self.homeModel.group;
        return circlesView;
    }else if (indexPath.section == 1) { // 第1组,创建推荐view
        XLRecommendView *recommendView = [XLRecommendView recommendView];
        recommendView.delegate = self;
        recommendView.famousList = self.homeModel.famous;
        return recommendView;
    }else { // 第2组 猜你喜欢
        XLGuessCell *cell = [XLGuessCell guessCellWithTableView:tableView];
        cell.model = self.homeModel.guess.list[indexPath.row % 3];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return Home_Group_Height;
    }else if (indexPath.section == 1) {
        return Home_Recommend_Height;
    }else {
        return 120;
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


#pragma mark - UITableViewCellDelegate

/**
 *  点击猜你喜欢cell,跳转至对应的商品详情控制器
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        GuessModel *model = self.homeModel.guess.list[indexPath.row % 3];
        XLGoodsViewController *vc = [[XLGoodsViewController alloc] init];
        
        // 传递参数
        [vc.parameter setObject:[NSString stringWithFormat:@"%d",model.id] forKey:@"good_id"];
        [vc.parameter setObject:[NSString stringWithFormat:@"%lf",self.coordinate.latitude] forKey:@"lat"];
        [vc.parameter setObject:[NSString stringWithFormat:@"%lf",self.coordinate.longitude] forKey:@"lon"];
        // push控制器
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - XLCirclesViewDelegate

/**
 *  点击圈子item之后push一个控制器
 */
- (void)circlesView:(XLCirclesView *)circlesView didSelectedItemWith:(GroupModel *)model {

    XLSubBaseViewController *vc = [[XLSubBaseViewController alloc] init];
    [vc.navigationItem setTitle:model.title];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - XLRecommendViewDelegate

/**
 *  点击名店推荐cell之后,push对应的商家详情控制器
 */
- (void)recommendView:(XLRecommendView *)recommendView didSelectedItemWith:(FamousModel *)model {
    
    XLShopViewController *vc = [[XLShopViewController alloc] init];
    [vc.parameter setObject:[NSString stringWithFormat:@"%d",model.id] forKey:@"shop_id"];
    [self.navigationController pushViewController:vc animated:YES];
    
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
