//
//  XLNavRightButton.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    XLNavRightButtonTypeLogin,
    XLNavRightButtonTypeRegister,
}XLNavRightButtonType;

@protocol XLNavRightButtonDelegate <NSObject>
@optional
- (void)navRightButtonDidClickWithType:(XLNavRightButtonType)type;
@end

@interface XLNavRightButton : UIView
@property (nonatomic, weak) id<XLNavRightButtonDelegate> delegate;
@end
