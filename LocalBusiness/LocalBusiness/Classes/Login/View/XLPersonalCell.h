//
//  XLPersonalCell.h
//  LocalBusiness
//
//  Created by Jason on 15/8/21.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLPersonalCell : UITableViewCell

@property (nonatomic, strong) NSMutableDictionary *parameter;

+ (XLPersonalCell *)cellWithTableView:(UITableView *)tableView;

@end
