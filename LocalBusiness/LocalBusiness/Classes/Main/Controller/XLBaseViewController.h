//
//  XLBaseViewController.h
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Toast.h"
#import "MBProgressHUD+PKX.h"

@interface XLBaseViewController : UITableViewController

/**
 *  显示成功信息
 */
- (void)showSuccessMessage:(NSString *)message;

/**
 *  显示错误信息
 */
- (void)showErrorMessage:(NSString *)message;

/**
 *  显示进度
 */
- (void)showActivityHUD;

/**
 *  隐藏进度
 */
- (void)hideActivityHUD;

@end
