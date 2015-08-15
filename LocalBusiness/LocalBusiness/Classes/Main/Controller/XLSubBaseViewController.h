//
//  XLSubBaseViewController.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLBaseViewController.h"

@interface XLSubBaseViewController : XLBaseViewController

/**
 *  传递参数的字典,子类控制器之间传递数据直接使用这个字典
 */
@property (nonatomic, strong) NSMutableDictionary *parameter;

@end
