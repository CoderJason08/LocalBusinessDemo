//
//  XLGuessCell.h
//  LocalBusiness
//
//  Created by Jason on 15/8/15.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLHomeModel.h"

@interface XLGuessCell : UITableViewCell

@property (nonatomic, strong) GuessModel *model;

+ (instancetype)guessCellWithTableView:(UITableView *)tableView;

@end
