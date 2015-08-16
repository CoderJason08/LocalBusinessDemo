//
//  XLAnnotation.m
//  0806CoreLocation
//
//  Created by Jason on 15/8/6.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLAnnotation.h"

@implementation XLAnnotation


- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle {
    if (self = [super init]) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
    }
    return self;
    
}

+ (instancetype)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle {
    XLAnnotation *anno = [[XLAnnotation alloc] initWithCoordinate:coordinate title:title subtitle:subtitle];
    return anno;
}
@end
