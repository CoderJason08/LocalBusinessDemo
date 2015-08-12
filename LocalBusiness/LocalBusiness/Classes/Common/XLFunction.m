//
//  XLFunction.m
//  LocalBusiness
//
//  Created by Jason on 15/8/12.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLFunction.h"
#import "MD5.h"
@implementation XLFunction

+ (NSString *)getTimeStamp {
    return [NSString stringWithFormat:@"%lf",[[NSDate date]timeIntervalSince1970]];
}

+ (NSString *)MD5SignWithParaArray:(NSArray *)para {
    NSMutableString *string = [NSMutableString string];
    [para enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL *stop) {
        [string appendString:str];
    }];
    return [MD5 MD5Encrypt:string];
}
@end
