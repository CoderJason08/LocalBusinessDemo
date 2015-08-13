//
//  XLCirclesCell.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *reuseIdentifier = @"XLCirclesCell";

@interface XLCirclesCell : UICollectionViewCell
+ (instancetype)circlesCellWith:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
