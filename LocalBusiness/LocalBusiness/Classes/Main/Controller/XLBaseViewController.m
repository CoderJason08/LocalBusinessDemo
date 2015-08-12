//
//  XLBaseViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLBaseViewController.h"
#import "XLRegisterViewController.h"
#import "XLBarButton.h"

@interface XLBaseViewController ()
@property (nonatomic, strong) UIBarButtonItem *loginButton;
@end

@implementation XLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view setBackgroundColor:Random_COLOR];
//    [self.navigationItem setTitle:@"测试"];
    self.navigationItem.rightBarButtonItem = self.loginButton;
}




#pragma mark - Event Response

- (void)loginButtonDidClicked:(UIButton *)button {
    XLRegisterViewController *registerVc = [[XLRegisterViewController alloc] init];
    registerVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:registerVc animated:YES];
}




#pragma mark - Getter & Setter

- (UIBarButtonItem *)loginButton {
    if (!_loginButton) {
        XLBarButton *button = [XLBarButton barButtonWithTitle:@"登录/注册" image:nil type:XLBarButtonTypeNormal];
        [button sizeToFit];
        [button addTarget:self action:@selector(loginButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.loginButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    return _loginButton;
}







@end
