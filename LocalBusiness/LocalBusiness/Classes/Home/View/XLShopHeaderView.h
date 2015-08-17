//
//  XLShopHeaderView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLShopModel.h"
@class XLShopHeaderView;

@protocol XLShopHeaderViewDelegate <NSObject>
@optional
- (void)shopHeaderView:(XLShopHeaderView *)headerView locationButtonDidClickWithModel:(XLShopModel *)shopModel;
- (void)shopHeaderView:(XLShopHeaderView *)headerView phoneButtonDidClickWithModel:(XLShopModel *)shopModel;
- (void)shopHeaderView:(XLShopHeaderView *)headerView shareButtonDidClickWithModel:(XLShopModel *)shopModel;
@end


@interface XLShopHeaderView : UIView

@property (nonatomic, strong) XLShopModel *shopModel;


@property (nonatomic, weak) id<XLShopHeaderViewDelegate> delegate;

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
