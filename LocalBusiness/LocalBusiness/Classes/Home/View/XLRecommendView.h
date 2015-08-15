//
//  XLRecommendView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLHomeModel.h"
@class XLRecommendView;

/**
 *  协议,实现点击cell之后将cell对应的Model回传
 */
@protocol XLRecommendViewDelegate <NSObject>
@optional
- (void)recommendView:(XLRecommendView *)recommendView didSelectedItemWith:(FamousModel *)model;
@end


@interface XLRecommendView : UITableViewCell

/**
 *  推荐模型
 */
@property (nonatomic, strong) FamousListModel *famousList;

@property (nonatomic, weak) id<XLRecommendViewDelegate> delegate;

/**
 *  快速创建推荐View
 */
+ (instancetype)recommendView;
@end
