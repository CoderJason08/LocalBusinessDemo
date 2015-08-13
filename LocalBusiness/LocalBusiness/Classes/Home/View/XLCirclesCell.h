//
//  XLCirclesCell.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLHomeModel.h"

static NSString *reuseIdentifier = @"XLCirclesCell";

@interface XLCirclesCell : UICollectionViewCell
/**
 *  每一个组item模型
 */
@property (nonatomic, strong) GroupModel *group;

+ (instancetype)circlesCellWith:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
