//
//  XLFactory.m
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLFactory.h"

@implementation XLFactory

+ (XLBarButton *)buttonWithTitle:(NSString *)title image:(UIImage *)image type:(XLButtonType)type {
    XLBarButton *button = [[XLBarButton alloc] init];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT(16);
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    
    switch (type) {
        case XLButtonTypeRound:
            button.layer.cornerRadius = 5;
            break;
        default:
            break;
    }
    button.layer.masksToBounds = YES;
    return button;
}


@end
