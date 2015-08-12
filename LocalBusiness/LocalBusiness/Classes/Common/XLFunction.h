//
//  XLFunction.h
//  LocalBusiness
//
//  Created by Jason on 15/8/12.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLFunction : NSObject
/**
 *  获取时间戳
 *
 *  @return 当前时间戳
 */
+ (NSString *)getTimeStamp;

/**
 *  根据参数数组返回加密的md5
 *
 *  @param para 参数数组
 *
 *  @return 加密后的sign
 */
+ (NSString *)MD5SignWithParaArray:(NSArray *)para;
@end
