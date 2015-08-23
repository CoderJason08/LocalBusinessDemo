//
//  XLToolDetailViewController.m
//  LocalBusiness
//
//  Created by Jason on 15/8/22.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLToolDetailViewController.h"

@interface XLToolDetailViewController () <UIWebViewDelegate>

@end

@implementation XLToolDetailViewController {
    UIWebView *_webView;
}

- (void)loadView {
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _webView.delegate = self;
    self.view = _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *request = [NSURLRequest requestWithURL:[self.parameter objectForKey:@"url"]];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self showActivityHUD];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self hideActivityHUD];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
