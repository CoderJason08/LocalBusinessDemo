//
//  XLUserInfoModel.m
//  LocalBusiness
//
//  Created by Jason on 15/8/18.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLUserInfoModel.h"

@implementation XLUserInfoModel

- (void)encodeWithCoder:(NSCoder *)enCoder {
    [enCoder encodeObject:_user_id forKey:@"user_id"];
    [enCoder encodeObject:_user_name forKey:@"user_name"];
    [enCoder encodeObject:_mobile forKey:@"mobile"];
    [enCoder encodeObject:_small_avatar forKey:@"small_avatar"];
    [enCoder encodeObject:_middle_avatar forKey:@"_middle_avatar"];
    [enCoder encodeInt:_gender forKey:@"gender"];
}

- (id)initWithCoder:(NSCoder *)deCoder {
    if (self = [super init]) {
        self.user_id = [deCoder decodeObjectForKey:@"user_id"];
        self.user_name = [deCoder decodeObjectForKey:@"user_name"];
        self.mobile = [deCoder decodeObjectForKey:@"mobile"];
        self.small_avatar = [deCoder decodeObjectForKey:@"small_avatar"];
        self.middle_avatar = [deCoder decodeObjectForKey:@"middle_avatar"];
        self.gender = [deCoder decodeIntForKey:@"gender"];
    }
    return self;
}

@end
