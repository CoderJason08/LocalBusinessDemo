//
//  XLHomeModel.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLHomeModel.h"



@implementation XLHomeModel


/**
 *  归档方法
 */
- (void)encodeWithCoder:(NSCoder *)enCoder {
    [enCoder encodeObject:_focus forKey:@"focus"];
    [enCoder encodeObject:_group forKey:@"group"];
    [enCoder encodeObject:_famous forKey:@"famous"];
    [enCoder encodeObject:_guess forKey:@"guess"];
}

/**
 *  解档方法
 */
- (id)initWithCoder:(NSCoder *)deCoder {
    if (self = [super init]) {
        self.focus = [deCoder decodeObjectForKey:@"focus"];
        self.group = [deCoder decodeObjectForKey:@"group"];
        self.famous = [deCoder decodeObjectForKey:@"famous"];
        self.guess = [deCoder decodeObjectForKey:@"guess"];
    }
    return self;
}

@end


/********** 焦点图   **********/
@implementation FocusListModel
@end

@implementation FocusModel
@end

/**********  分组  **********/

@implementation GroupListModel
@end

@implementation GroupModel
@end

/**********  推荐  **********/

@implementation FamousListModel
@end

@implementation FamousModel
@end

/**********  猜你喜欢  **********/

@implementation GuessListModel
@end

@implementation GuessModel
@end




