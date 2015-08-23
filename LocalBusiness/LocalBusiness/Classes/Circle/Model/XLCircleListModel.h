//
//  XLCircleModel.h
//  LocalBusiness
//
//  Created by Jason on 15/8/21.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "JSONModel.h"

@protocol XLCircleModel <NSObject>
@end

@interface XLCircleListModel : JSONModel

@property (nonatomic, strong) NSArray<XLCircleModel> *list;

@end

@interface XLCircleModel : JSONModel
/**
 *  图片
 */
@property (nonatomic, copy) NSString *cover;
/**
 *  id
 */
@property (nonatomic, assign) int id;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
@end
