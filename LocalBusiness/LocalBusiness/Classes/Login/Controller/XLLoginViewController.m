//
//  XLLoginViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLLoginViewController.h"

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
    self.navigationItem.rightBarButtonItem = nil;
    
    /**********  创建控制器上的子控件  **********/
    [self.view addSubview:self.firstView];

    
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
        make.height.mas_equalTo(50);
    }];
    
    [self.iconImageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.firstView);
        make.width.mas_equalTo(self.firstView.mas_height);
    }];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageVIew.mas_right);
        make.right.equalTo(self.firstView);
        make.top.bottom.equalTo(self.firstView);
    }];
    
    
}


#pragma mark - Getter & Setter 

- (UIView *)firstView {
    if (!_firstView) {
        self.firstView = [[UIView alloc] init];
        
        [self.firstView addSubview:self.accountTextField];
        [self.firstView addSubview:self.iconImageVIew];
        
        self.firstView.backgroundColor = Random_COLOR;
        self.firstView.layer.cornerRadius = 5;
        [self.firstView.layer masksToBounds];
    }
    return _firstView;
}

- (UITextField *)accountTextField {
    if (!_accountTextField) {
        self.accountTextField = [[UITextField alloc] init];
        self.accountTextField.placeholder = @"用户名";
        
        self.accountTextField.layer.cornerRadius = 5;
        [self.accountTextField.layer masksToBounds];
        
        self.accountTextField.backgroundColor = Random_COLOR;
    }
    return _accountTextField;
}

- (UIImageView *)iconImageVIew {
    if (!_iconImageVIew) {
        self.iconImageVIew = [[UIImageView alloc] init];
        self.iconImageVIew.image = [UIImage imageNamed:@"nav_user"];
    }
    return _iconImageVIew;
}

@end
