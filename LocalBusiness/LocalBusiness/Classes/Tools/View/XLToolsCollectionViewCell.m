//
//  XLToolsCollectionViewCell.m
//  LocalBusiness
//
//  Created by Jason on 15/8/22.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLToolsCollectionViewCell.h"

@interface XLToolsCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation XLToolsCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setTool:(XLToolsModel *)tool {
    _tool = tool;
    [self.iconButton xlSetBackgroundImageWithURL:tool.cover];
    [self.titleLabel setText:tool.title];

}

- (IBAction)iconButtonDidClick {
    if ([self.delegate respondsToSelector:@selector(toolsCollectionViewCell:didClickWithURL:title:)]) {
        [self.delegate toolsCollectionViewCell:self didClickWithURL:[NSURL URLWithString:self.tool.link] title:self.tool.title];
    }
}



@end
