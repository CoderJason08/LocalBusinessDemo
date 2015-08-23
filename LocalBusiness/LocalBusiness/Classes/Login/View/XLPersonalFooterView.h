//
//  XLPersonalFooterView.h
//  LocalBusiness
//
//  Created by Jason on 15/8/21.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XLPersonalFooterViewDelegate <NSObject>
@optional
- (void)didClickexitButton;
@end

@interface XLPersonalFooterView : UIView

@property (nonatomic, weak) id<XLPersonalFooterViewDelegate> delegate;

+ (XLPersonalFooterView *)personalFooterView;

@end
