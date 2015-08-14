//
//  XLRecommendView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLHomeModel.h"

@interface XLRecommendView : UITableViewCell

@property (nonatomic, strong) FamousListModel *famousList;

/**
 *  快速创建推荐View
 */
+ (instancetype)recommendView;
@end
