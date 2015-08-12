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

@interface XLHomeViewController ()
/**
 *  广告view
 */
@property (nonatomic, strong) XLAdvertiseView *advertiseView;
@end

@implementation XLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.tableHeaderView = self.advertiseView;
    
    [self requestData];
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
    [para setObject:@"120.38" forKey:@"lon"];
    [para setObject:@"36.06" forKey:@"lat"];
    [para setObject:[XLFunction getTimeStamp] forKey:@"time"];
    NSArray *paraArray = @[APP_ID,para[@"lon"],para[@"lat"],para[@"time"],APP_KEY];
    [para setObject:[XLFunction MD5SignWithParaArray:paraArray] forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    
    [XLNewtWorkManager XLGET:kIndexInfo parameters:para success:^(id responseObject) {
        XLHomeModel *home = [[XLHomeModel alloc] initWithDictionary:responseObject error:NULL];
        FocusListModel *foucusList = home.focus;
        
        self.advertiseView.list = foucusList.list;
        
        
    } error:^(id error) {
        NSLog(@"%@",error);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
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
