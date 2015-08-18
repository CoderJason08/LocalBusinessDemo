//
//  XLPersonalViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/18.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLPersonalViewController.h"

@interface XLPersonalViewController ()

@property (nonatomic, strong) XLBarButton *exitButton;

@end

@implementation XLPersonalViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.navigationItem setTitle:@"个人中心"];
    // 隐藏右边按钮
    self.navigationItem.rightBarButtonItem = nil;
    
    [self.view addSubview:self.exitButton];
    
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
}


#pragma mark - Action

- (void)exitButtonDidClick {
    NSFileManager *fmr = [NSFileManager defaultManager];
    [fmr removeItemAtPath:[XLFunction getUserInfoPath] error:NULL];
    // 退出登录
    [XLUserInfo sharedInfo].isLogin = NO;
    [self.navigationController popViewControllerAnimated:YES];
    [self showSuccessMessage:@"退出登录"];
}


#pragma mark - Getter & Setter

- (XLBarButton *)exitButton {
    if (!_exitButton) {
        self.exitButton = [XLFactory buttonWithTitle:@"退出登录" image:nil type:XLButtonTypeRound];
        self.exitButton.backgroundColor = Random_COLOR;
//        self.exitButton.frame = CGRectMake(0, 0, 100, 50);
        [self.exitButton addTarget:self action:@selector(exitButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitButton;
}

@end
