//
//  XLTabBar.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLTabBar.h"
#import "XLTabBarButton.h"



@interface XLTabBar ()
/**
 *  当前选中的按钮
 */
@property (nonatomic, weak) XLTabBarButton *currentSelectedButton;

@end

@implementation XLTabBar

+ (instancetype)tabBar {
    return [[self alloc] init];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

/**
 *  为tabBar添加Button
 */
- (void)setupSubViews {
    static NSUInteger barButtonCount = 5;
    for (int index = 0; index < barButtonCount; index++) {
        XLTabBarButton *button = [XLTabBarButton buttonWithType:UIButtonTypeCustom];
        NSString *normal = [NSString stringWithFormat:@"home_%d",index];
        NSString *selected = [NSString stringWithFormat:@"home_%d_pressed",index];
        [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
        [button setTag:index];
        [button setFrame:CGRectMake(index * Button_WIDTH, 0, Button_WIDTH, TabBar_HEIGHT)];
        [button addTarget:self action:@selector(tabBarButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:button];
        if (index == 0) {
            button.selected = YES;
            self.currentSelectedButton = button;
        }
    }
}

- (void)tabBarButtonDidClicked:(XLTabBarButton *)button{
    self.currentSelectedButton.selected = NO;
    button.selected = YES;
    self.currentSelectedButton = button;
    if ([self.delegate respondsToSelector:@selector(tabBar:ButtonDidClickedWithIndex:)]) {
        [self.delegate tabBar:self ButtonDidClickedWithIndex:button.tag];
    }
}


@end
