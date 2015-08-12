//
//  XLTabBarButton.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLBarButton.h"

@implementation XLBarButton

/**
 *  重写取消点击高亮效果
 */
- (void)setHighlighted:(BOOL)highlighted {}

+ (instancetype)barButtonWithTitle:(NSString *)title image:(UIImage *)image type:(XLBarButtonType)type {
    XLBarButton *button = [[XLBarButton alloc] init];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Menlo-Bold" size:18];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    return button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
