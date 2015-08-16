//
//  XLShopCommentViewCell.h
//  LocalBusiness
//
//  Created by Amisear on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLShopModel.h"

@interface XLShopCommentViewCell : UITableViewCell

@property (nonatomic,strong)ShopCommentModel *model;
@property (weak, nonatomic) IBOutlet UIView *topSepLine;

@end
