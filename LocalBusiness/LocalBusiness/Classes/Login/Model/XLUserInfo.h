//
//  XLUserInfo.h
//  LocalBusiness
//
//  Created by Jason on 15/8/18.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "JSONModel.h"
#import "XLUserInfoModel.h"

@interface XLUserInfo : NSObject
/**
 *  不能在外界修改Model属性
 */
@property (nonatomic, strong,readonly) XLUserInfoModel *infoModel;
/**
 *  判断是否登录
 */
@property (nonatomic, assign) BOOL isLogin;

/**
 *  创建单例
 */
+ (XLUserInfo *)sharedInfo;

+ (void)userInfoWithModel:(XLUserInfoModel *)model;

@end


