//
//  XLLocationManager.m
//  LocalBusiness
//
//  Created by Jason on 15/8/14.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLLocationManager.h"


@interface XLLocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;
/**
 *  定位成功的回调
 */
@property (nonatomic, copy) locationSuccessBlock success;
/**
 *  定位失败的回调
 */
@property (nonatomic, copy) locationErrorBlock error;

@end

@implementation XLLocationManager

+ (instancetype)sharedManager {
    static XLLocationManager *localManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localManager = [[XLLocationManager alloc] init];
    });
    return localManager;
}


- (instancetype)init {
    if (self = [super init]) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
            [self.manager requestAlwaysAuthorization];
        }
//        [self.manager startUpdatingLocation];
    }
    return self;
}


#pragma mark - CLLocationManagerDelegate 

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocationCoordinate2D coordinate = [[locations lastObject] coordinate];
    /**
     *  标记是否定位成功
     */
    static BOOL flag = NO;
    if (flag) {
        return;
    }
    self.success(coordinate);
    [self.manager stopUpdatingLocation];
    flag = YES;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if ( status == kCLAuthorizationStatusDenied) {
        self.error(nil);
    }
    [self.manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.error(error);
    [self.manager stopUpdatingLocation];
}

+ (void)getLocationSuccess:(locationSuccessBlock)success error:(locationErrorBlock)error {
    [[self sharedManager] getLocationSuccess:success error:error];
}

- (void)getLocationSuccess:(locationSuccessBlock)success error:(locationErrorBlock)error {
    self.success = success;
    self.error = error;
    [self.manager startUpdatingLocation];
}

@end
