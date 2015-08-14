//
//  XLRecommendCell.h
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLHomeModel.h"

static NSString *reuseIdentifier = @"XLRecommendCell";

@interface XLRecommendCell : UICollectionViewCell

@property (nonatomic, strong) FamousModel *famous;

+ (instancetype)recommendCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
