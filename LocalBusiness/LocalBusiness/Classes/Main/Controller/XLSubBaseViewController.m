//
//  XLSubBaseViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLSubBaseViewController.h"
#import "XLBarButton.h"

@interface XLSubBaseViewController ()

@property (nonatomic, strong) UIBarButtonItem *backButton;

@end

@implementation XLSubBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = self.backButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backButtonDidClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  后退按钮方法
 */
- (UIBarButtonItem *)backButton {
    if (!_backButton) {
        XLBarButton *button = [XLFactory buttonWithTitle:nil image:[UIImage imageNamed:@"nav_back"] type:XLButtonTypeNormal];
        button.frame = CGRectMake(0, 0, 44, 44);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(backButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];
        self.backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    return _backButton;
}

#pragma mark - Getter & Setter 

-  (NSMutableDictionary *)parameter{
    if (!_parameter) {
        self.parameter = [NSMutableDictionary dictionary];
    }
    return _parameter;
}




@end
