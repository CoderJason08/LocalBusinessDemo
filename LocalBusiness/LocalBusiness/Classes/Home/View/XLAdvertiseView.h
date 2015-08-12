//
//  XLAdvView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLHomeModel.h"

@interface XLAdvertiseView : UIView
/**
 *  广告模型数组
 */
@property (nonatomic, strong) NSArray *list;

/**
 *  快速创建广告View
 */
+ (instancetype)advertiseView;

@end
