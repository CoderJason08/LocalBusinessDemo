//
//  XLBaseViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLBaseViewController.h"

@interface XLBaseViewController ()
@property (nonatomic, strong) UIBarButtonItem *loginButton;
@property (nonatomic, strong) UIBarButtonItem *backButton;
@end

@implementation XLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:Random_COLOR];
//    [self.navigationItem setTitle:@"测试"];
    self.navigationItem.rightBarButtonItem = self.loginButton;
    self.navigationItem.leftBarButtonItem = self.backButton;
}




#pragma mark - Event Response

- (void)loginButtonDidClicked:(UIButton *)button {
    static BOOL flag = YES;
    if (flag) {
        [button setImage:[UIImage imageNamed:@"nav_user"] forState:UIControlStateNormal];
        [button setTitle:nil forState:UIControlStateNormal];
        [button sizeToFit];
    }else {
        [button setImage:nil forState:UIControlStateNormal];
        [button setTitle:@"登录/注册" forState:UIControlStateNormal];
        [button sizeToFit];
    }
    flag = !flag;
}

- (void)backButtonDidClicked {
    
}


#pragma mark - Getter & Setter

- (UIBarButtonItem *)loginButton {
    if (!_loginButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"登录/注册" forState:UIControlStateNormal];
        [button sizeToFit];
        [button setBackgroundColor:[UIColor orangeColor]];
        [button addTarget:self action:@selector(loginButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.loginButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    return _loginButton;
}

- (UIBarButtonItem *)backButton {
    if (!_backButton) {
        self.backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backButtonDidClicked)];
    }
    return _backButton;
}





@end
