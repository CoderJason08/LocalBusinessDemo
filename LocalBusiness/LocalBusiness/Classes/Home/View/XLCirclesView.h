//
//  XLCirclesView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLHomeModel.h"
@class XLCirclesView;


/**
 *  协议,实现点击cell之后将cell对应的Model回传
 */
@protocol XLCirclesViewDelegate <NSObject>
@optional
- (void)circlesView:(XLCirclesView *)circlesView didSelectedItemWith:(GroupModel *)model;
@end


@interface XLCirclesView : UITableViewCell
/**
 *  分组模型
 */
@property (nonatomic, strong) GroupListModel *list;

@property (nonatomic, weak) id<XLCirclesViewDelegate> delegate;

+ (instancetype)circlesView;
@end
