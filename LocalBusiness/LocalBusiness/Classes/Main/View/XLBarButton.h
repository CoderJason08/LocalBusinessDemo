//
//  XLTabBarButton.h
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    XLBarButtonTypeNormal,
    XLBarButtonTypeRound,
}XLBarButtonType;

@interface XLBarButton : UIButton
+ (instancetype)barButtonWithTitle:(NSString *)title
                             image:(UIImage *)image
                              type:(XLBarButtonType)type;
@end
