//
//  XLShopGoodsViewCell.m
//  LocalBusiness
//
//  Created by Amisear on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLShopGoodsViewCell.h"

@interface XLShopGoodsViewCell()
/**
 *  商品名称
 */
@property (strong, nonatomic) IBOutlet UILabel *goodsName;

/**
 *  广告语
 */
@property (strong, nonatomic) IBOutlet UILabel *goodsAdver;

/**
 *  商品价格
 */
@property (strong, nonatomic) IBOutlet UILabel *goodsRice;
/**
 *  查看详情
 */
@property (weak, nonatomic) IBOutlet XLBarButton *more;

#warning 添加点击事件
@end

@implementation XLShopGoodsViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _more.layer.cornerRadius = 5;
    [_more.layer masksToBounds];
    _more.titleLabel.font = FONT(16);
    _more.tintColor = [UIColor whiteColor];
    _more.backgroundColor = Nav_BAR_COLOR;
    
}



- (void)setGoods:(NSDictionary *)goods {
    _goods = goods;
    _goodsName.text = goods[@"goodsName"];
    _goodsAdver.text = goods[@"goodsAdver"];
    _goodsRice.text = [NSString stringWithFormat:@"￥%@",goods[@"goodsPrice"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
