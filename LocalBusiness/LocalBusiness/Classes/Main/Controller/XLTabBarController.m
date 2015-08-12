//
//  XLTabBarViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLTabBarController.h"
#import "XLTabBar.h"
#import "XLTabPopBar.h"
#import "XLNavigationController.h"
#import "XLHomeViewController.h"
#import "XLNewsViewController.h"
#import "XLCircleViewController.h"
#import "XLToolsViewController.h"
#import "XLAboutViewController.h"
#import "XLOnlineViewController.h"
#import "XLShakeViewController.h"

@interface XLTabBarController () <XLTabBarDelegate, XLTabPopBarDelegate>
@property (nonatomic, strong) XLTabBar *bottomTabBar;
@property (nonatomic, strong) XLTabPopBar *popBar;
@end

@implementation XLTabBarController

#pragma mark - Life Circle 

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tabBar addSubview:self.bottomTabBar];
//     Do any additional setup after loading the view.
    
    // 创建子控制器
    // 首页
    [self addViewController:[[XLHomeViewController alloc] init] title:@"首页"];
    // 新闻
    [self addViewController:[[XLNewsViewController alloc] init] title:@"热点"];
    // 圈子
    [self addViewController: [[XLCircleViewController alloc] init] title:@"圈子"];
    // 我们
    [self addViewController:[[XLToolsViewController alloc] init] title:@"工具"];
    // 占位导航控制器，没有效果，为了让tabBar的按钮数量和自定义的相同。
    [self addViewController:[[UIViewController alloc] init] title:nil];
    // 关于
    [self addViewController:[[XLAboutViewController alloc] init] title:@"关于"];
    // 在线
    [self addViewController:[[XLOnlineViewController alloc] init] title:@"在线"];
    // 摇一摇
    [self addViewController:[[XLShakeViewController alloc] init] title:@"摇一摇"];
    
}

/**
 *  创建自定义tabBar覆盖系统tabBar，添加popBar
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBar addSubview:self.bottomTabBar];
    [self.view addSubview:self.popBar];    
    [self.popBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-TabBar_HEIGHT);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(TabBar_HEIGHT);
    }];
}

- (void)setPopBarHidden:(BOOL)flag {
    self.popBar.hidden = flag;
}

#pragma mark - Private Function

- (void)addViewController:(UIViewController *)viewController title:(NSString *)title {
    [viewController.navigationItem setTitle:title];
    XLNavigationController *navController = [[XLNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navController];
}



#pragma mark - XLTabBarDelegate

- (void)tabBar:(XLTabBar *)tabBar ButtonDidClickedWithIndex:(NSInteger)index {
    if (index == 4) {
        self.popBar.hidden = !self.popBar.isHidden;
        return;
    }
    self.popBar.hidden = YES;
    [self setSelectedIndex:index];
}

#pragma mark - XLTabPopBarDelegate

- (void)popBar:(XLTabPopBar *)popBar buttonDidClickedWithIndex:(NSInteger)index {
    [self setSelectedIndex:index];
    self.popBar.hidden = YES;
}


#pragma mark - Getter & Setter  

- (XLTabBar *)bottomTabBar {
    if (!_bottomTabBar) {
        self.bottomTabBar = [XLTabBar tabBar];
        self.bottomTabBar.delegate = self;
        self.bottomTabBar.frame = self.tabBar.bounds;
    }
    return _bottomTabBar;
}

- (XLTabPopBar *)popBar {
    if (!_popBar) {
        self.popBar = [[XLTabPopBar alloc] init];
        self.popBar.hidden = YES;
        self.popBar.delegate = self;
    }
    return _popBar;
}

@end
