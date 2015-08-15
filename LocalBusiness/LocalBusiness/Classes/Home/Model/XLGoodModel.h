//
//  XLGoodModel.h
//  LocalBusiness
//
//  Created by Jason on 15/8/15.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "JSONModel.h"

@protocol PreferGoodModel <NSObject>

@end

/**********  商品列表请求  **********/

@interface XLGoodModel : JSONModel
/**
 *  地址
 */
@property (nonatomic, copy) NSString *address;
/**
 *  描述内容
 */
@property (nonatomic, copy) NSString *content;
/**
 *  goods_snapshot_id
 */
@property (nonatomic, assign) int goods_snapshot_id;
/**
 *  id
 */
@property (nonatomic, assign) int id;
/**
 *  纬度
 */
@property (nonatomic, assign) double lat;
/**
 *  经度
 */
@property (nonatomic, assign) double lon;
/**
 *  电话号码
 */
@property (nonatomic, copy) NSString *phone;
/**
 *  价格
 */
@property (nonatomic, assign) double price;
/**
 *  商家id
 */
@property (nonatomic, assign) int shop_id;
/**
 *  商家名称
 */
@property (nonatomic, copy) NSString *shop_name;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  可能喜欢的商品
 */
@property (nonatomic, strong) NSArray<PreferGoodModel> *goods_list;

@end




/**********  可能喜欢  **********/

@interface PreferGoodModel : JSONModel

/**
 *  id
 */
@property (nonatomic, assign) int id;
/**
 *  图片链接
 */
@property (nonatomic, copy) NSString *cover;
/**
 *  距离
 */
@property (nonatomic, assign) int distance;
/**
 *  名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  打分
 */
@property (nonatomic, assign) int score;
/**
 *  商店名称
 */
@property (nonatomic, copy) NSString *shop_name;

@end


/*
 {
 address = "\U9752\U5c9b-\U5d02\U5c71\U533a";
 content = "\U9ed1\U849c\U53c8\U540d\U9ed1\U5927\U849c
 
 "goods_snapshot_id" = 1017;
 id = 217;
 lat = "36.1116";
 lon = "120.476156";
 phone = "";
 price = "88.00";
 "shop_id" = 3490;
 "shop_name" = "\U9752\U5c9b\U65b0\U519c\U76df\U4ea7\U4e1a\U53d1\U5c55\U4e2d\U5fc3";
 status = success;
 title = "\U65b0\U519c\U76df\U9ed1\U849c";
 }
 */

/*可能喜欢
 "goods_list" =     (
 {
 cover = "http://www.qd-life.com/static/upload/2015/03/16/index_20150316172343000000_1_53207_82.jpg";
 distance = 1591km;
 id = 81;
 name = "\U83f2\U7f8e\U679c\U56ed-\U69b4\U83b2";
 score = 0;
 "shop_name" = "\U83f2\U7f8e\U679c\U56ed\Uff08\U6d77\U53e3\U8def\U5e97\Uff09";
 },
 {
 cover = "http://www.qd-life.com/static/upload/2015/03/17/index_20150317091338000000_1_38681_69.jpg";
 distance = 1591km;
 id = 83;
 name = "\U83f2\U7f8e\U679c\U56ed-\U9f99\U773c";
 score = 0;
 "shop_name" = "\U83f2\U7f8e\U679c\U56ed\Uff08\U6d77\U53e3\U8def\U5e97\Uff09";
 }
 );
 */
