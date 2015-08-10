//
//  XLNavigationViewController.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLNavigationController.h"

@interface XLNavigationController ()

@end

@implementation XLNavigationController

+ (void)initialize {
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
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
    // Dispose of any resources that can be recreated.
}



@end
