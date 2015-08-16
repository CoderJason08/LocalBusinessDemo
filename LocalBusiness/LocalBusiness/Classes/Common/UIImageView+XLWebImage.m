//
//  UIImageView+XLWebImage.m
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "UIImageView+XLWebImage.h"
#import "UIImageView+AFNetworking.h"

@implementation UIImageView (XLWebImage)

- (void)xlSetImageWithURL:(NSString *)url {
    [self setImageWithURL:[NSURL URLWithString:url]];
}

@end
