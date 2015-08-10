//
//  XLTabPopBar.h
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLTabPopBar;

@protocol XLTabPopBarDelegate <NSObject>
@optional
- (void)popBar:(XLTabPopBar *)popBar buttonDidClickedWithIndex:(NSInteger)index;
@end

/**
 *  弹出的菜单栏
 */
@interface XLTabPopBar : UIView
@property (nonatomic, weak) id<XLTabPopBarDelegate> delegate;
+ (instancetype)popBar;
@end
