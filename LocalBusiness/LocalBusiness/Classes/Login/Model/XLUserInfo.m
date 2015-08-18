//
//  XLUserInfo.m
//  LocalBusiness
//
//  Created by Jason on 15/8/18.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLUserInfo.h"

@interface XLUserInfo ()
/**
 *  用户信息模型
 */
@property (nonatomic, strong) XLUserInfoModel *infoModel;

@end

@implementation XLUserInfo

+ (XLUserInfo *)sharedInfo {
    static XLUserInfo *userInfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[XLUserInfo alloc] init];
    });
    return userInfo;
}

+ (void)userInfoWithModel:(XLUserInfoModel *)model {
    if (!model) { // 如果取到的模型为空,直接返回
        return;
    }
    [[XLUserInfo sharedInfo] setInfoModel:model];
    [XLUserInfo sharedInfo].isLogin = YES;
}

@end
