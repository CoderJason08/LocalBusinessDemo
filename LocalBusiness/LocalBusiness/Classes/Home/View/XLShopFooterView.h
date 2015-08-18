//
//  XLShopFooterView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLShopModel.h"
@class XLShopFooterView;

@protocol XLShopFooterViewDelegate <NSObject>
@optional
- (void)shopFooter:(XLShopFooterView *)shopFooterView sendCommentButtonDidClickWith:(ShopCommentModel *)commentModel;
- (void)pushLoginViewController;
@end
@interface XLShopFooterView : UIView

@property (nonatomic, weak) id<XLShopFooterViewDelegate> delegate;

/**
 *  初始化FooterView
 */
+ (XLShopFooterView *)shopFooterView;

@end
