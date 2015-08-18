//
//  XLLoginViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLLoginViewController.h"
#import "XLRegisterViewController.h"
#import "SSKeychain.h"
#import "XLUserInfo.h"

@interface XLLoginViewController ()
/**
 *  第一个view
 */
@property (nonatomic, strong) UIView *firstView;
/**
 *  账号输入框
 */
@property (nonatomic, strong) UITextField *accountTextField;
/**
 *  头像
 */
@property (nonatomic, strong) UIImageView *iconImageVIew;
/**
 *  密码View
 */
@property (nonatomic, strong)UIView *secretView;
/**
 *  锁图
 */
@property (nonatomic, strong)UIImageView *lockImageView;
/**
 *  用户密码
 */
@property (nonatomic, strong)UITextField *userSecretText;
/**
 *  登录注册View
 */
@property (nonatomic, strong)UIView *thirdView;
/**
 *  记住密码点击框
 */
@property (nonatomic, strong)XLBarButton *remSecretButton;
/**
 *  记住密码Lable
 */
@property (nonatomic, strong)XLBarButton *remSecretLable;
/**
 *  忘记密码Button
 */
@property (nonatomic, strong)XLBarButton *forgetSecretButton;
/**
 *  登录按钮
 */
@property (nonatomic, strong)XLBarButton *logiButton;
/**
 *  注册按钮
 */
@property (nonatomic, strong)XLBarButton *registerButton;



@end

@implementation XLLoginViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
    /**
     *  设置导航栏title
     */
    [self.navigationItem setTitle:@"登录"];
    /**
     *  隐藏导航栏右边按钮
     */
    [self.navigationItem setRightBarButtonItem:nil];
    
    /**********  创建控制器上的子控件  **********/
    
//    [self.secretView addSubview:self.lockImageView];
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.secretView];
    [self.view addSubview:self.thirdView];
    [self.view addSubview:self.registerButton];

    
    [self setupConstraints];
}



#pragma mark - Praivte Function
/**
 *  设置约束
 */
- (void)setupConstraints {
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20 + 44 +33);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    
    [self.iconImageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.firstView);
        make.width.mas_equalTo(self.firstView.mas_height);
    }];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageVIew.mas_right).offset(5);
        make.right.equalTo(self.firstView).offset(-5);
        make.top.bottom.equalTo(self.firstView);
    }];
    
    [self.secretView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(40);
        make.left.equalTo(self.firstView);
        make.right.equalTo(self.firstView);
        make.height.equalTo(self.firstView);
        make.top.mas_equalTo(self.firstView.mas_bottom).offset(35);
        
    }];
    
    [self.lockImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secretView);
        make.left.equalTo(self.secretView);
        make.height.equalTo(self.secretView);
        make.width.mas_equalTo(self.firstView.mas_height);
        
    }];
    
    [self.userSecretText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lockImageView.mas_right).offset(5);
        make.right.equalTo(self.secretView).offset(-5);
        make.height.mas_equalTo(self.lockImageView.mas_height);
        make.top.equalTo(self.secretView).offset(0);
        
    }];
    
    [self.thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.secretView.mas_bottom);
        make.left.mas_equalTo(self.secretView.mas_left);
        make.right.mas_equalTo(self.secretView.mas_right);
        make.height.mas_equalTo(260);
        
    }];
    
    [self.remSecretButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
        make.left.equalTo(self.thirdView).offset(0);
        make.top.equalTo(self.thirdView).offset(20);
        
    }];
    
    [self.remSecretLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.remSecretButton.mas_right).offset(-10);
        make.top.mas_equalTo(self.remSecretButton.mas_top);
        make.height.mas_equalTo(self.remSecretButton.mas_height);
        make.width.mas_equalTo(80);
        
    }];
    
    [self.forgetSecretButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.remSecretLable.mas_top);
        make.right.mas_equalTo(self.thirdView.mas_right);
        make.height.mas_equalTo(self.remSecretLable.mas_height);
        make.width.mas_equalTo(self.remSecretLable.mas_width);
        
    }];
    
    [self.logiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.remSecretLable.mas_bottom).offset(30);
        make.left.mas_equalTo(self.thirdView.mas_left);
        make.height.mas_equalTo(self.firstView.mas_height);
        make.width.mas_equalTo(self.thirdView.mas_width);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logiButton.mas_bottom).offset(33);
        make.centerX.equalTo(self.view);
    }];
}


#pragma mark - Getter & Setter 

- (UIView *)firstView {
    if (!_firstView) {
        self.firstView = [[UIView alloc] init];
        
        [self.firstView addSubview:self.accountTextField];
        [self.firstView addSubview:self.iconImageVIew];
        
        self.firstView.backgroundColor = COLOR_RGBA(103, 194, 251, 1);
        self.firstView.layer.cornerRadius = 5;
        [self.firstView.layer masksToBounds];
    }
    return _firstView;
}

- (UITextField *)accountTextField {
    if (!_accountTextField) {
        self.accountTextField = [[UITextField alloc] init];
        
        // 设置字体
        self.accountTextField.font = FONT(18);
        self.accountTextField.textColor = [UIColor blackColor];
        // 设置占位字体
        self.accountTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"用户名" attributes:@{NSFontAttributeName : FONT(16),NSForegroundColorAttributeName:[UIColor whiteColor]}];

        self.accountTextField.backgroundColor = COLOR_RGBA(103, 194, 251, 1);
    }
    return _accountTextField;
}

- (UIImageView *)iconImageVIew {
    if (!_iconImageVIew) {
        self.iconImageVIew = [[UIImageView alloc] init];
        self.iconImageVIew.image = [UIImage imageNamed:@"nav_user"];
        self.iconImageVIew.backgroundColor = Nav_BAR_COLOR;
        
//        [self.iconImageVIew.layer setMask:self.firstView.layer];
        self.iconImageVIew.layer.cornerRadius = 5;
        [self.iconImageVIew.layer masksToBounds];
    }
    return _iconImageVIew;
}

- (UIView *)secretView {
    if (!_secretView) {
        self.secretView = [[UIView alloc]init];
        [self.secretView addSubview:self.lockImageView];
        [self.secretView addSubview:self.userSecretText];
        self.secretView.backgroundColor = COLOR_RGBA(103, 194, 251, 1);
        self.secretView.layer.cornerRadius = 5;
        [self.secretView.layer masksToBounds];
        
    }
    return _secretView;
}

- (UIImageView *)lockImageView {
    
    if (!_lockImageView) {
        self.lockImageView = [[UIImageView alloc]init];
        self.lockImageView.image = [UIImage imageNamed:@"user_passwd"];
        self.lockImageView.backgroundColor = Nav_BAR_COLOR;
        self.lockImageView.layer.cornerRadius = 5;
        [self.lockImageView.layer masksToBounds];
    }
    return _lockImageView;
}

- (UITextField *)userSecretText {
    
    if (!_userSecretText) {
        self.userSecretText = [[UITextField alloc]init];
        // 设置字体
        self.userSecretText.font = FONT(18);
        self.userSecretText.textColor = [UIColor blackColor];
        // 设置占位字体
        self.userSecretText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSFontAttributeName : FONT(16),NSForegroundColorAttributeName:[UIColor whiteColor]}];

        self.userSecretText.backgroundColor = COLOR_RGBA(103, 194, 251, 1);
        
        self.userSecretText.secureTextEntry = YES;
//        self.userSecretText.layer.cornerRadius = 5;
//        [self.userSecretText.layer masksToBounds];
        
    }
    return _userSecretText;
}

- (UIView *)thirdView {
    
    if (!_thirdView) {
        self.thirdView = [[UIView alloc]init];
        [self.thirdView addSubview:self.remSecretButton];
        [self.thirdView addSubview:self.remSecretLable];
        [self.thirdView addSubview:self.forgetSecretButton];
        [self.thirdView addSubview:self.logiButton];
        
//        self.thirdView.backgroundColor = Random_COLOR;
    }
    return _thirdView;
    
}

- (XLBarButton *)remSecretButton {

    if (!_remSecretButton) {
        self.remSecretButton = [[XLBarButton alloc]init];
        self.remSecretButton.highlighted = NO;
        [self.remSecretButton setImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateNormal];
        [self.remSecretButton setImage:[UIImage imageNamed:@"btn_selected"] forState:UIControlStateSelected];
        [self.remSecretButton addTarget:self action:@selector(remSecretButtonDidChilk:) forControlEvents:UIControlEventTouchDown];
        
        
    }
    return _remSecretButton;
}

- (XLBarButton *)remSecretLable{
    if (!_remSecretLable) {
        self.remSecretLable = [[XLBarButton alloc]init];
        self.remSecretLable.backgroundColor = [UIColor clearColor];
        [self.remSecretLable setTitleColor:COLOR_RGBA(70, 185, 210, 1) forState:UIControlStateNormal];
        [self.remSecretLable setTitle:@"记住密码" forState:UIControlStateNormal];
        [self.remSecretLable addTarget:self action:@selector(remSecretLableDidClik) forControlEvents:UIControlEventTouchUpInside];
        self.remSecretLable.titleLabel.font = FONT(15);
        
    }
    return _remSecretLable;
}

- (XLBarButton *)forgetSecretButton {
    
    if (!_forgetSecretButton) {
        self.forgetSecretButton = [[XLBarButton alloc]init];
        self.forgetSecretButton.backgroundColor = [UIColor clearColor];
        [self.forgetSecretButton setAttributedTitle:[[NSAttributedString alloc] initWithString:@"忘记密码" attributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleThick),NSFontAttributeName:FONT(15),NSForegroundColorAttributeName:COLOR_RGBA(70, 185, 210, 1)}] forState:UIControlStateNormal];
        
//        self.forgetSecretButton.titleLabel.font = FONT(15);
//        [self.forgetSecretButton setTitleColor:COLOR_RGBA(70, 185, 210, 1) forState:UIControlStateNormal];
        [self.forgetSecretButton addTarget:self action:@selector(forgetSecretButtonDidClik:) forControlEvents:UIControlEventTouchUpInside];
        [self.forgetSecretButton sizeToFit];
    }
    return _forgetSecretButton;
    
}

- (XLBarButton *)logiButton {
    if (!_logiButton) {
        self.logiButton = [[XLBarButton alloc]init];
        self.logiButton.backgroundColor = Nav_BAR_COLOR;
        [self.logiButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.logiButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        self.logiButton.layer.cornerRadius = 5;
        [self.logiButton.layer masksToBounds];
        self.logiButton.titleLabel.font = FONT(18);
//        self.logiButton.backgroundColor = [UIColor redColor];
        [self.logiButton addTarget:self action:@selector(logiButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logiButton;
    
}

- (XLBarButton *)registerButton {
    if (!_registerButton) {
        self.registerButton = [XLFactory buttonWithTitle:@"还没有账号?立即注册" image:nil type:XLButtonTypeNormal];
        [self.registerButton setTitleColor:COLOR_RGBA(255, 97, 154, 1) forState:UIControlStateNormal];
        [self.registerButton addTarget:self action:@selector(registerButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
//        [self.registerButton sizeToFit];

    }
    return _registerButton;
}



#pragma mark - 按钮点击响应方法
/**
 *  记住密码
 */
- (void)remSecretButtonDidChilk:(XLBarButton *)bt {
    bt.selected = !bt.isSelected;
}
- (void)remSecretLableDidClik {
    [self remSecretButtonDidChilk:self.remSecretButton];
}

- (void)forgetSecretButtonDidClik:(XLBarButton *)bt {
    
}

- (void)registerButtonDidClick {
    XLRegisterViewController *vc = [[XLRegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  登陆按钮点击事件
 */
- (void)logiButtonDidClick {
    // 获取bundleID
    NSString *identifier = [NSBundle mainBundle].bundleIdentifier;
    // 从info.plist中获取
//    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
//    NSString *id = infoDict[@"CFBundleIdentifier"];
    
    // service使用bundleID,保证唯一性
    [SSKeychain setPassword:self.userSecretText.text forService:identifier account:self.accountTextField.text];

    // 设置请求参数
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:self.accountTextField.text forKey:@"curr_account"];
    [para setObject:self.userSecretText.text forKey:@"password"];
    [para setObject:[XLFunction getTimeStamp ] forKey:@"time"];
    NSArray *paraArray = @[APP_ID,para[@"password"],para[@"time"],APP_KEY];
    NSString *sign = [XLFunction MD5SignWithParaArray:paraArray];
    [para setObject:sign forKey:@"sign"];
    [para setObject:APP_ID forKey:@"app_id"];
    
    [self showActivityHUD];
    [XLNewtWorkManager XLPOST:kLogin parameters:para success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        XLUserInfoModel *model = [[XLUserInfoModel alloc] initWithDictionary:responseObject error:NULL];
        // 获取数据
        [XLUserInfo userInfoWithModel:model];
        // 将数据保存在沙盒
        [XLFunction saveUserInfoWith:model];
        [self hideActivityHUD];
        // 发送通知,改变了登录状态
//        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationChangeLoginState object:self];
        
        [self showSuccessMessage:@"登录成功"];
        [self.navigationController popViewControllerAnimated:YES];
        
        
    } error:^(id error) {
        NSLog(@"%@",error);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}



@end
