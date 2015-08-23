//
//  XLToolsCollectionViewCell.h
//  LocalBusiness
//
//  Created by Jason on 15/8/22.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLToolsListModel.h"
@class XLToolsCollectionViewCell;

@protocol XLToolsCollectionViewCellDelegate <NSObject>
@optional
- (void)toolsCollectionViewCell:(XLToolsCollectionViewCell *)cell didClickWithURL:(NSURL *)url title:(NSString *)title;
@end

@interface XLToolsCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<XLToolsCollectionViewCellDelegate> delegate;

@property (nonatomic, strong) XLToolsModel *tool;

@end
