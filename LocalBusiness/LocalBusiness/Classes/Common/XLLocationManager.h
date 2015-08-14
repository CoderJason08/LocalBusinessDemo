//
//  XLLocationManager.h
//  LocalBusiness
//
//  Created by Jason on 15/8/14.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/**
 *  定位成功的回调
 */
typedef void(^locationSuccessBlock)(CLLocationCoordinate2D coordinate);

/**
 *  定位错误的回调
 */
typedef void(^locationErrorBlock)(NSError *error);

@interface XLLocationManager : NSObject

+ (instancetype)sharedManager;

+ (void)getLocationSuccess:(locationSuccessBlock)success
                     error:(locationErrorBlock)error;

@end
