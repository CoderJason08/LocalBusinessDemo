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
@property (nonatomic, strong) UIBarButtonItem *backButton;
@end

@implementation XLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view setBackgroundColor:Random_COLOR];
//    [self.navigationItem setTitle:@"测试"];
    self.navigationItem.rightBarButtonItem = self.loginButton;
    self.navigationItem.leftBarButtonItem = self.backButton;
}




#pragma mark - Event Response

- (void)loginButtonDidClicked:(UIButton *)button {
    XLRegisterViewController *registerVc = [[XLRegisterViewController alloc] init];
    registerVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:registerVc animated:YES];
}

- (void)backButtonDidClicked {
    [self.navigationController popViewControllerAnimated:YES];
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

- (UIBarButtonItem *)backButton {
    if (!_backButton) {
        XLBarButton *button = [XLBarButton barButtonWithTitle:nil image:[UIImage imageNamed:@"nav_back"] type:XLBarButtonTypeNormal];
        button.frame = CGRectMake(0, 0, 44, 44);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(backButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];
        self.backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    return _backButton;
}





@end
