//
//  XLShopModel.h
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "JSONModel.h"

@protocol ShopCommentModel <NSObject>
@end

/**********  商家模型  **********/

@interface XLShopModel : JSONModel
/**
 *  商家地址
 */
@property (nonatomic, copy) NSString *address;
/**
 *  评论总页数
 */
@property (nonatomic, assign) int comment_totalPage;
/**
 *  商家图片链接
 */
@property (nonatomic, copy) NSString *cover;
/**
 *  商家id
 */
@property (nonatomic, assign) int id;
/**
 *  商家描述
 */
@property (nonatomic, copy) NSString *intro;
/**
 *  纬度
 */
@property (nonatomic, assign) double lat;
/**
 *  经度
 */
@property (nonatomic, assign) double lon;
/**
 *  商家名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  商家电话
 */
@property (nonatomic, copy) NSString *phone;
/**
 *  商家得分
 */
@property (nonatomic, assign) int score;
/**
 *  服务类型
 */
@property (nonatomic, copy) NSString *server;
/**
 *  评论列表
 */
@property (nonatomic, strong) NSMutableArray<ShopCommentModel> *comment_list;
/**
 *  商品
 */
//  没有数据
@property (nonatomic, strong) NSArray *goods;
@end


/**********  评论模型  **********/

@interface ShopCommentModel : JSONModel
/**
 *  用户头像地址
 */
@property (nonatomic, copy) NSString *avatar;
/**
 *  评论内容
 */
@property (nonatomic, copy) NSString *content;
/**
 *  评论日期
 */
@property (nonatomic, copy) NSString *date;
/**
 *  评论id
 */
@property (nonatomic, assign) int id;
/**
 *  评论人name
 */
@property (nonatomic, copy) NSString *name;
/**
 *  评分
 */
@property (nonatomic, assign) int score;
/**
 *  评论人id
 */
@property (nonatomic, assign) int user_id;

@end

/**
 {
 address = "\U9752\U5c9b\U5e02\U9ec4\U5c9b\U533a\U7075\U5c71\U8def10\U53f7";
 "comment_list" =     (
    ...
 );
 "comment_totalPage" = 4;
 cover = "http://www.qd-life.com/static/upload/2015/04/03/info_20150403135622000000_1_109155_62.jpg";
 goods =     (
 );
 id = 3083;
 intro = "\U4ee5\U5241\U8fa3\U6912\U7684\U201c\U54b8\U201d\U548c\U201c\U8fa3\U201d\U6c81\U5165\U9c7c\U5934\Uff0c\U98ce\U5473\U72ec\U5177\U4e00\U683c\U3002\U83dc\U54c1\U8272\U6cfd\U7ea2\U4eae\U3001\U5473\U6d53\U3001\U8089\U8d28\U7ec6\U5ae9\U3002\U80a5\U800c\U4e0d\U817b\U3001\U53e3\U611f\U8f6f\U7cef\U3001\U9c9c\U8fa3\U9002\U53e3\U3002";
 lat = "35.877694";
 lon = "120.018593";
 name = "\U6e14\U7c73\U4e4b\U6e58\U65b0\U6982\U5ff5\U6e58\U83dc\U9986";
 phone = "0532-87122588";
 score = 0;
 server = "\U7f8e\U98df";
 status = success;
 totalPage = 0;
 }
 */

/*
 (
 {
 avatar = "http://www.qd-life.com/images/default/general.gif";
 content = "\U8fd8\U6709\U7684";
 date = "08-15 15:53";
 id = 780;
 name = jason;
 score = 0;
 "user_id" = 626;
 },
 {
 avatar = "http://www.qd-life.com/static/upload/2015/08/16/small_14396554962012.jpg";
 content = "I love you so much fun and addicting but I don&#039;t know what to do with the same time I try to get a new one is the best thing ever is when you have to be a good ";
 date = "08-15 15:52";
 id = 779;
 name = qiruihua;
 score = 5;
 "user_id" = 101;
 }
 )
 */
