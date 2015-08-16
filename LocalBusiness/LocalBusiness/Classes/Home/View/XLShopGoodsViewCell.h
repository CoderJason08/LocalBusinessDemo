//
//  XLShopGoodsViewCell.h
//  LocalBusiness
//
//  Created by Amisear on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLShopModel.h"

@interface XLShopGoodsViewCell : UITableViewCell

@property (nonatomic,strong) NSDictionary *goods;
/**
 *  顶部分隔线
 */
@property (weak, nonatomic) IBOutlet UIView *topSepLine;

@end
