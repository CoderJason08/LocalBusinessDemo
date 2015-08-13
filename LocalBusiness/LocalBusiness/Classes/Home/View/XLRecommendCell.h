//
//  XLRecommendCell.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *reuseIdentifier = @"XLRecommendCell";

@interface XLRecommendCell : UICollectionViewCell
+ (instancetype)recommendCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
