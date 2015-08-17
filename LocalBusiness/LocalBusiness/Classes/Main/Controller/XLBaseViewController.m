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
#import "XLShopGoodsViewCell.h"
#import "IQKeyboardManager.h"

@interface XLBaseViewController () <XLNavRightButtonDelegate>

/**
 *  登陆按钮
 */
@property (nonatomic, strong) UIBarButtonItem *loginButton;


@end

@implementation XLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 添加右边注册按钮
    self.navigationItem.rightBarButtonItem = self.loginButton;
    // 设置IQKeyBoard
    // 可以点击外界退出键盘
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    
}

/**
 *  显示加载进度时,添加白色view遮罩
 */
- (void)showActivityHUD {
    [[UIApplication sharedApplication].keyWindow makeToastActivity];
}

/**
 *  移除遮罩
 */
- (void)hideActivityHUD {
    [[UIApplication sharedApplication].keyWindow hideToastActivity];
}

- (void)showSuccessMessage:(NSString *)message {
    [MBProgressHUD showSuccess:message];
}

- (void)showErrorMessage:(NSString *)message {
    [MBProgressHUD showError:message];
}

//#pragma mark - XLNavRightButtonDelegate
//
//- (void)navRightButtonDidClickWithType:(XLNavRightButtonType)type {
//    if (type == XLNavRightButtonTypeLogin) {
//        [self.navigationController pushViewController:[[XLLoginViewController alloc] init] animated:YES];
//    }else if (type == XLNavRightButtonTypeRegister) {
//        [self.navigationController pushViewController:[[XLRegisterViewController alloc] init]animated:YES];
//    }
//}

#pragma mark - Event Response

- (void)loginButtonDidClicked:(XLBarButton *)button {
    [self.navigationController pushViewController:[[XLLoginViewController alloc] init] animated:YES];
}

#pragma mark - Getter & Setter

- (UIBarButtonItem *)loginButton {
    if (!_loginButton) {
        
        UIButton *rightButton = [XLFactory buttonWithTitle:@"登陆/注册" image:nil type:XLButtonTypeNormal];
//        rightButton.backgroundColor = Random_COLOR;
        [rightButton sizeToFit];
        [rightButton addTarget:self action:@selector(loginButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.loginButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }
    return _loginButton;
}






@end
