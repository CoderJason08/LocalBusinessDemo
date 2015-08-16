//
//  XLShopLocationViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLShopLocationViewController.h"
#import "XLAnnotation.h"

@interface XLShopLocationViewController ()
@property (nonatomic, strong) UIButton *bottomView;
@end

@implementation XLShopLocationViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"商家地图"];
    // 创建地图
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:mapView];
    // 添加大头针
    double lat = [self.parameter[@"lat"] doubleValue];
    double lon = [self.parameter[@"lon"] doubleValue];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lon);
    XLAnnotation *anno = [XLAnnotation annotationWithCoordinate:coordinate title:self.parameter[@"name"] subtitle:nil];
    MKPinAnnotationView *annotation = [[MKPinAnnotationView alloc] initWithAnnotation:anno reuseIdentifier:@"anno"];
    annotation.canShowCallout = YES;
    [mapView addAnnotation:(id)annotation];
//    [mapView convertCoordinate:coordinate toPointToView:self.view];
    // 添加底部view
    [self.view addSubview:self.bottomView];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIButton *)bottomView {
    if (!_bottomView) {
        self.bottomView = [[UIButton alloc] init];
        [self.bottomView setBackgroundColor:[UIColor whiteColor]];
        [self.bottomView setImage:[UIImage imageNamed:@"home_location_big"] forState:UIControlStateNormal];
        [self.bottomView setTitle:self.parameter[@"address"] forState:UIControlStateNormal];
        [self.bottomView setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.bottomView setContentMode:UIViewContentModeLeft];
        [self.bottomView setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    }
    return _bottomView;
}

@end
