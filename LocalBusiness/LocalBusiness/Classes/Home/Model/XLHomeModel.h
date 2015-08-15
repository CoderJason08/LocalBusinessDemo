//
//  XLHomeModel.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "JSONModel.h"
@class FocusListModel;
@class GroupListModel;
@class FamousListModel;
@class GuessListModel;


@interface XLHomeModel : JSONModel <NSCoding>
/**
 *  首页焦点图模型
 */
@property (nonatomic, strong) FocusListModel *focus;
/**
 *  首页分组模型
 */
@property (nonatomic, strong) GroupListModel *group;
/**
 *  名店推荐模型
 */
@property (nonatomic, strong) FamousListModel *famous;
/**
 *  猜你喜欢模型
 */
@property (nonatomic, strong) GuessListModel *guess;

@end

/**********  首页焦点图模型  **********/

@protocol FocusModel <NSObject>
@end

@interface FocusListModel : JSONModel
/**
 *  焦点图模型列表
 */
@property (nonatomic, strong) NSArray<FocusModel> *list;
@end

@interface FocusModel : JSONModel
/**
 *  焦点图id
 */
@property (nonatomic, assign) int id;
/**
 *  焦点图片地址
 */
@property (nonatomic, copy) NSString *cover;
/**
 *  焦点图点击链接
 */
@property (nonatomic, copy) NSString *link;
/**
 *  焦点图描述
 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int res_id;
@property (nonatomic, copy) NSString *res_name;

@end



/**********  首页分组模型  **********/

@protocol GroupModel <NSObject>
@end

@interface GroupListModel : JSONModel
@property (nonatomic, strong) NSArray<GroupModel> *list;
@end

@interface GroupModel : JSONModel
/**
 *  图片地址
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


/**********  名店推荐模型  **********/

@protocol FamousModel <NSObject>
@end

@interface FamousListModel : JSONModel
@property (nonatomic, strong) NSArray<FamousModel> *list;
@end

@interface FamousModel : JSONModel
/**
 *  shop_id
 */
@property (nonatomic, assign) int id;
/**
 *  距离
 */
@property (nonatomic, assign) int distance;
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString *cover;
/**
 *  名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  介绍
 */
@property (nonatomic, copy) NSString *intro;
/**
 *  打分
 */
@property (nonatomic, assign) int score;

@end


/**********  猜你喜欢模型  **********/

@protocol GuessModel <NSObject>

@end

@interface GuessListModel : JSONModel
/**
 *  猜你喜欢数组
 */
@property (nonatomic, strong) NSArray<GuessModel> *list;

@end

@interface GuessModel : JSONModel

/**
 *  goods_id
 */
@property (nonatomic, assign) int id;
/**
 *  简介
 */
@property (nonatomic, copy) NSString *intro;
/**
 *  价格
 */
@property (nonatomic, assign) double price;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString *cover;

@end

/*猜你喜欢
 guess={
 list=({
 cover="http://www.qd-life.com/static/upload/2015/06/23/index_20150623103654000000_1_52741_43.jpg";id=217;intro="\U9ed1\U849c\U539f\U4ef7106\U5143/\U6876\Uff0c\U73b0\U4ef788\U5143/\U6876\U3002";price="88.00";title="\U65b0\U519c\U76df\U9ed1\U849c";
 },
 {
 cover="http://www.qd-life.com/static/upload/2015/05/07/index_20150507124255000000_1_55342_99.jpg";id=170;intro="\U539f\U4ef742\U5143/200g\Uff0c\U73b0\U4ef7\U53ea\U970014.8\U5143\Uff0c\U8fd8\U7b49\U4ec0\U4e48\Uff0c\U901f\U901f\U62a2\U8d2d\U5427\Uff01";price="14.80";title="\U70ad\U70e4\U9c7f\U9c7c\U8db3\U7247";
 },
 {
 cover="http://www.qd-life.com/static/upload/2015/03/17/index_20150317110153000000_1_51555_49.jpg";id=89;intro="\U56e2\U8d2d\U4ef7\U683c\Uff1a300\U5143/\U7bb1\Uff08\U6bcf\U7bb130\U4e2a\Uff09 ";price="300.00";title="\U83f2\U7f8e\U679c\U56ed-\U725b\U6cb9\U679c";
 });
 
 */

/*推荐
 {
 famous={
 list=({
 cover="http://www.qd-life.com/static/upload/2015/04/09/index_20150409153830000000_1_92289_57.jpg";distance=21km;id=3225;intro="\U4e00\U5bb6\U7279\U8272\U70d8\U7119\U8fde\U9501\U4f01\U4e1a\Uff0c\U4e3b\U8425\U4e1a\U52a1...";name="\U9ea6\U4e50\U6ecb\U86cb\U7cd5\U5e97";score=0;
 },
 {
 cover="http://www.qd-life.com/static/upload/2015/04/08/index_20150408153820000000_1_98894_50.jpg";distance=38km;id=3169;intro="\U5e97\U5185\U73af\U5883\U5e72\U51c0\U6574\U6d01\Uff0c\U4ef7\U683c\U5b9e\U60e0\Uff0c\U5473...";name="\U857e\U68ee\U5c45\U7f8e\U98df\U57ce";score=0;
 },
 {
 cover="http://www.qd-life.com/static/upload/2015/04/03/index_20150403135622000000_1_109155_62.jpg";distance=38km;id=3083;intro="\U4ee5\U5241\U8fa3\U6912\U7684\U201c\U54b8\U201d\U548c\U201c\U8fa3\U201d\U6c81\U5165\U9c7c...";name="\U6e14\U7c73\U4e4b\U6e58\U65b0\U6982";score=0;
 },
 {
 cover="http://www.qd-life.com/static/upload/2014/12/26/index_20141226104752000000_1_895455_62.jpg";distance=5km;id=46;intro="\U4e3b\U8981\U7ecf\U8425\U7279\U8272\U79d8\U5236\U70e4\U8089\Uff0c\U72ec\U5bb6\U79d8\U65b9...";name="\U96c5\U535a\U6e21\U8089\U4e32\U738b";score=0;
 });
 };
 */

/*分组
 group={
 list=({
 cover="http://www.qd-life.com/static/upload/2014/11/30/20141130170523000000_1_2877_100.png";id=1;title="\U7f8e\U5bbf";
 },
 {
 cover="http://www.qd-life.com/static/upload/2014/11/30/20141130170512000000_1_5772_92.png";id=2;title="\U5065\U5eb7";
 },
 {
 cover="http://www.qd-life.com/static/upload/2014/11/30/20141130170424000000_1_3809_45.png";id=4;title="\U626b\U8d27";
 },
 {
 cover="http://www.qd-life.com/static/upload/2014/11/30/20141130170340000000_1_7196_45.png";id=6;title="\U54c1\U724c";
 },
 {
 cover="http://www.qd-life.com/static/upload/2014/11/30/20141130170451000000_1_4055_25.png";id=3;title="\U6c7d\U8f66";
 },
 {
 cover="http://www.qd-life.com/static/upload/2014/11/30/20141130170311000000_1_4343_73.png";id=7;title="\U6559\U80b2";
 },
 {
 cover="http://www.qd-life.com/static/upload/2014/11/30/20141130170245000000_1_2844_66.png";id=8;title="\U91d1\U878d";
 },
 {
 cover="http://www.qd-life.com/images/m/icons/icon-more.png";id=0;title="\U66f4\U591a";
 });
 };
 */


/*焦点图
 focus={
 list=({
 cover="http://www.qd-life.com/static/upload/2015/08/10/middle_20150810161700000000_1_174251_75.jpg";id=275;link="http://www.qd-life.com/news/detail?id=1834";"res_id"=1834;"res_name"=news;title="\U5988\U7956\U6587\U5316\U57fa\U91d1\U4f1a\U8bbe\U7acb\U201c\U6d77\U4e0a\U6551\U52a9\U201d\U57fa\U91d1";
 },
 {
 cover="http://www.qd-life.com/static/upload/2015/08/04/middle_20150804111855000000_1_218263_51.jpg";id=274;link="http://www.qd-life.com/news/detail?id=1833";"res_id"=1833;"res_name"=news;title="\U51c9\U723d\Uff01\U590f\U5929\U505a\U4e2a\U6c34\U679c\U5973\U5b69\Uff01";
 },
 {
 cover="http://www.qd-life.com/static/upload/2015/07/30/middle_20150730161105000000_1_188827_45.jpg";id=273;link="http://www.qd-life.com/news/detail?id=1832";"res_id"=1832;"res_name"=news;title="\U62a5\U540d\U751f\U6d3b\U5bb6\U5730\U677f\U300a\U4ea4\U6362\U7a7a\U95f4\U300bN\U79cd\U7406\U7531";
 });
 };
 */


/*

 

 

 };status=success;
 } */
