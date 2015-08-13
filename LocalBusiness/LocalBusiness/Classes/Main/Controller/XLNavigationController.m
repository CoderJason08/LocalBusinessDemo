//
//  XLNavigationViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLNavigationController.h"
#import "XLTabBarController.h"

@interface XLNavigationController ()

@end

@implementation XLNavigationController

+ (void)initialize {
    [[UINavigationBar appearance] setBarTintColor:Nav_BAR_COLOR];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSDictionary *titleAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Menlo-Bold" size:22]};
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttributes];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
    XLTabBarController *tabBar = (XLTabBarController *)[[UIApplication sharedApplication].keyWindow rootViewController];
    [tabBar setPopBarHidden:YES];
    viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
    
}



@end
