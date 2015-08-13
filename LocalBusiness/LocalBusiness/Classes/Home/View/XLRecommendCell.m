//
//  XLRecommendCell.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLRecommendCell.h"

@implementation XLRecommendCell
+(instancetype)recommendCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    XLRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = Random_COLOR;
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
}
@end
