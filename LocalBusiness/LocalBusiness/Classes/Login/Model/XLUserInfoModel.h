//
//  XLUserInfoModel.h
//  LocalBusiness
//
//  Created by Jason on 15/8/18.
//  Copyright (c) 2015年 Jason. All rights reserved.
//


#import "JSONModel.h"
/**
 *  用户模型数据
 */
@interface XLUserInfoModel : JSONModel <NSCoding>
/**
 *  性别
 */
@property (nonatomic, assign) int gender;
/**
 *  用户名
 */
@property (nonatomic, copy) NSString *user_name;
/**
 *  用户id
 */
@property (nonatomic, copy) NSString *user_id;
/**
 *  手机号
 */
@property (nonatomic, copy) NSString *mobile;
/**
 *  小图
 */
@property (nonatomic, copy) NSString *small_avatar;
/**
 *  大图
 */
@property (nonatomic, copy) NSString *middle_avatar;

@end