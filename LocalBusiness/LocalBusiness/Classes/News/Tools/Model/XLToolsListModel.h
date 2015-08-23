//
//  XLToolsListModel.h
//  LocalBusiness
//
//  Created by Jason on 15/8/22.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "JSONModel.h"

@protocol XLToolsModel <NSObject>
@end

@interface XLToolsListModel : JSONModel
@property (nonatomic, strong) NSArray<XLToolsModel> *tools_list;
@end

@interface XLToolsModel : JSONModel
/**
 *  图片
 */
@property (nonatomic, copy) NSString *cover;
/**
 *  id
 */
@property (nonatomic, assign) int id;
/**
 *  链接
 */
@property (nonatomic, copy) NSString *link;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
@end

/*
 "tools_list" =     (
 {
 cover = "http://www.qd-life.com/static/upload/2014/12/01/middle_20141201185811000000_1_7574_12.png";
 id = 7;
 link = "http://3g.yongche.com/wap/";
 title = "\U6253\U8f66\U670d\U52a1";
 },
 {
 cover = "http://www.qd-life.com/static/upload/2014/12/01/middle_20141201185803000000_1_6891_41.png";
 id = 8;
 link = "http://www.zuche.com";
 title = "\U79df\U8f66\U670d\U52a1";
 },
 {
 cover = "http://www.qd-life.com/static/upload/2015/01/09/middle_20150109182833000000_1_6889_32.png";
 id = 11;
 link = "http://wap.piao.com/";
 title = "\U7968\U52a1";
 },
 {
 cover = "http://www.qd-life.com/static/upload/2015/01/09/middle_20150109182818000000_1_6073_88.png";
 id = 12;
 link = "http://m.bandao.cn/wap/";
 title = "\U8bfb\U62a5\U7eb8";
 }
 );

 */