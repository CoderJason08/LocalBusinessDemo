//
//  XLNewtWorkManager.h
//  LocalBusiness
//
//  Created by Jason on 15/8/12.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "AFHTTPSessionManager.h"

/**
 *  请求成功回调
 */
typedef void(^successBlock)(id responseObject);
/**
 *  请求失败回调
 */
typedef void(^failureBlock)(NSError *error);
/**
 *  请求错误回调
 */
typedef void(^errorBlock)(id error);

@interface XLNewtWorkManager : AFHTTPSessionManager


/**
 *  创建单例管理对象
 */
+ (instancetype)sharedManager;


/**
 *  封装GET请求
 *
 *  @param URLString  请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功回调方法
 *  @param error      请求错误回调方法
 *  @param failure    请求失败回调方法
 */
+ (void)XLGET:(NSString *)URLString
   parameters:(NSDictionary *)parameters
      success:(successBlock)success
        error:(errorBlock)error
      failure:(failureBlock)failure;


/**
 *  封装POST请求
 *
 *  @param URLString  请求路径
 *  @param parameters 请求参数
 *  @param success    请求成功回调方法
 *  @param error      请求错误回调方法
 *  @param failure    请求失败回调方法
 */
+ (void)XLPOST:(NSString *)URLString
    parameters:(NSDictionary *)parameters
       success:(successBlock)success
         error:(errorBlock)error
       failure:(failureBlock)failure;


/*
 - (NSURLSessionDataTask *)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
 success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
 failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
 */
@end
