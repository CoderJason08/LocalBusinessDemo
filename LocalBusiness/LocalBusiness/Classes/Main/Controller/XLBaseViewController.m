//
//  XLBaseViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLBaseViewController.h"
#import "XLLoginViewController.h"
#import "XLRegisterViewController.h"
#import "XLBarButton.h"
#import "XLNavRightButton.h"

@interface XLBaseViewController () <XLNavRightButtonDelegate>
@property (nonatomic, strong) UIBarButtonItem *loginButton;
@end

@implementation XLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = self.loginButton;
}


#pragma mark - XLNavRightButtonDelegate

- (void)navRightButtonDidClickWithType:(XLNavRightButtonType)type {
    if (type == XLNavRightButtonTypeLogin) {
        [self.navigationController pushViewController:[[XLLoginViewController alloc] init] animated:YES];
    }else if (type == XLNavRightButtonTypeRegister) {
        [self.navigationController pushViewController:[[XLRegisterViewController alloc] init]animated:YES];
    }
}



#pragma mark - Getter & Setter


- (UIBarButtonItem *)loginButton {
    if (!_loginButton) {
        XLNavRightButton *rightButton = [[[NSBundle mainBundle] loadNibNamed:@"XLNavRightButton" owner:nil options:nil] lastObject];
        rightButton.delegate = self;
        self.loginButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }
    return _loginButton;
}







@end
