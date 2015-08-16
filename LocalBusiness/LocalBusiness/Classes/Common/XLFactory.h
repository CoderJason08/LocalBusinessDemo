//
//  XLFactory.h
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLBarButton.h"

typedef enum {
    XLButtonTypeNormal,
    XLButtonTypeRound,
    XLButtonTypeCircle,
}XLButtonType;

@interface XLFactory : NSObject
/**
 *  快速创建Button
 *
 *  @param title Button文字
 *  @param image Button图片
 *  @param type  Button类型
 *
 */
+ (XLBarButton *)buttonWithTitle:(NSString *)title
                             image:(UIImage *)image
                              type:(XLButtonType)type;

@end
