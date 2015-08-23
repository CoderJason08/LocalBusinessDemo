//
//  UIButton+XLWebImage.m
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "UIButton+XLWebImage.h"
#import "UIButton+AFNetworking.h"

@implementation UIButton (XLWebImage)

- (void)xlSetImageWithURL:(NSString *)url {
    [self setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:url]];
}

- (void)xlSetBackgroundImageWithURL:(NSString *)url {
    [self setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:url]];
}

@end
