//
//  XLNewtWorkManager.m
//  LocalBusiness
//
//  Created by Jason on 15/8/12.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLNewtWorkManager.h"

@implementation XLNewtWorkManager


+ (instancetype)sharedManager {
    static XLNewtWorkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[XLNewtWorkManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    });
    return manager;
}


+ (void)XLGET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(successBlock)success error:(errorBlock)error failure:(failureBlock)failure {
    [[XLNewtWorkManager sharedManager] GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"success"]) {
            if (success) {
                success(responseObject);
            }
        }else if ([responseObject[@"status"] isEqualToString:@"error"]) {
            [MBProgressHUD showError:@"网络异常,请稍后再试"];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)XLPOST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(successBlock)success error:(errorBlock)error failure:(failureBlock)failure {
    [[XLNewtWorkManager sharedManager] POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"success"]) {
            if (success) {
                success(responseObject);
            }
        }else if ([responseObject[@"status"] isEqualToString:@"error"]) {
            [MBProgressHUD showError:@"网络异常,请稍后再试"];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
