//
//  XLShopHeaderView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLShopModel.h"

@interface XLShopHeaderView : UIView

@property (nonatomic, strong) XLShopModel *shopModel;
/**
 *  初始化一个商品详情的顶部视图
 */
//+ (XLShopHeaderCell *)shopHeaderWithTableView:(UITableView *)tableView;
+ (XLShopHeaderView *)shopHeaderView;

/**
 *  更新frame
 */
- (CGRect)updateFrame;

@end
