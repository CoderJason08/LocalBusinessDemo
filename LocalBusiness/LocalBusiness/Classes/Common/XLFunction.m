//
//  XLFunction.m
//  LocalBusiness
//
//  Created by Jason on 15/8/12.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLFunction.h"
#import "MD5.h"
#import "XLUserInfo.h"

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

+ (void)saveUserInfoWith:(XLUserInfoModel *)model {
    [NSKeyedArchiver archiveRootObject:model toFile:[XLFunction getUserInfoPath]];
}

+ (void)loadUserInfo {

    XLUserInfoModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:[XLFunction getUserInfoPath]];
    [XLUserInfo userInfoWithModel:model];
}

+ (NSString *)getUserInfoPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"userInfo.data"];
    return filePath;
}
@end
