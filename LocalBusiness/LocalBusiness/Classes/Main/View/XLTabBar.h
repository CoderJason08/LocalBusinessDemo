//
//  XLTabBar.h
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLTabBar;

@protocol XLTabBarDelegate <NSObject>
@optional
- (void)tabBar:(XLTabBar *)tabBar ButtonDidClickedWithIndex:(NSInteger)index;
@end

@interface XLTabBar : UIView
@property (nonatomic, weak) id<XLTabBarDelegate> delegate;
+ (instancetype)tabBar;
@end
