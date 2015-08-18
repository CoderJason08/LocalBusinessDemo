//
//  XLBaseViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLBaseViewController.h"
#import "XLLoginViewController.h"
#import "XLBarButton.h"
#import "XLNavRightButton.h"
#import "XLShopGoodsViewCell.h"
#import "XLPersonalViewController.h"
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
  
#warning 用通知实现?如何拿到所有右边按钮
    // 监听是否改变用户登录状态
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLoginState) name:kNotificationChangeLoginState object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationItem.rightBarButtonItem == nil) {
        return;
    }
    XLBarButton *rightButton = (XLBarButton *)self.loginButton.customView;
    if ([XLUserInfo sharedInfo].isLogin) {
        [rightButton setImage:[UIImage imageNamed:@"nav_user"] forState:UIControlStateNormal];
        [rightButton setTitle:nil forState:UIControlStateNormal];
    }else {
        [rightButton setTitle:@"登录/注册" forState:UIControlStateNormal];
        [rightButton setImage:nil forState:UIControlStateNormal];
    }
    [rightButton sizeToFit];
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





#pragma mark - Event Response

- (void)loginButtonDidClicked:(XLBarButton *)button {
    if ([XLUserInfo sharedInfo].isLogin) {
         [self.navigationController pushViewController:[[XLPersonalViewController alloc] init] animated:YES];
    }else {
        [self.navigationController pushViewController:[[XLLoginViewController alloc] init] animated:YES];
    }
}



/**
 *  通知响应事件,修改右边按钮
 */
- (void)changeLoginState {
    XLBarButton *rightButton = (XLBarButton *)self.loginButton.customView;
    if ([XLUserInfo sharedInfo].isLogin) {
        rightButton = [XLFactory buttonWithTitle:nil image:[UIImage imageNamed:@"nav_user"] type:XLButtonTypeNormal];
        [rightButton setImage:[UIImage imageNamed:@"nav_user"] forState:UIControlStateNormal];
    }else {
        rightButton = [XLFactory buttonWithTitle:@"登录" image:nil type:XLButtonTypeNormal];
    }
    [rightButton sizeToFit];
}

#pragma mark - Getter & Setter

- (UIBarButtonItem *)loginButton {
    if (!_loginButton) {
        XLBarButton *rightButton = [XLFactory buttonWithTitle:nil image:nil type:XLButtonTypeNormal];
        [rightButton addTarget:self action:@selector(loginButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.loginButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }
    return _loginButton;
}

@end
