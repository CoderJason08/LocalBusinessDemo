//
//  XLNavRightButton.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLNavRightButton.h"

@interface XLNavRightButton ()

@end

@implementation XLNavRightButton

- (IBAction)loginButtonDidClicked {
    if ([self.delegate respondsToSelector:@selector(navRightButtonDidClickWithType:)]) {
        [self.delegate navRightButtonDidClickWithType:XLNavRightButtonTypeLogin];
    }
}

- (IBAction)registerButtonDidClicked {
    if ([self.delegate respondsToSelector:@selector(navRightButtonDidClickWithType:)]) {
        [self.delegate navRightButtonDidClickWithType:XLNavRightButtonTypeRegister];
    }

}

@end
