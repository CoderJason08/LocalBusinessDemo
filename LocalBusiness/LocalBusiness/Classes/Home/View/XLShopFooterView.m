//
//  XLShopFooterView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/16.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLShopFooterView.h"
#import "LDXScore.h"

@interface XLShopFooterView ()

@property (nonatomic, strong) UILabel *judgeLabel;

@property (nonatomic, strong) UITextView *inputView;;

@property (nonatomic, strong) LDXScore *chooseStarView;

@property (nonatomic, strong) XLBarButton *sendButton;
/**
 *  分隔线
 */
@property (nonatomic, strong) UIView *sepLine;

@end

@implementation XLShopFooterView

- (void)awakeFromNib {
    
}

+ (XLShopFooterView *)shopFooterView {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self addSubview:self.sepLine];
    [self addSubview:self.judgeLabel];
    [self addSubview:self.inputView];
    [self addSubview:self.chooseStarView];
    [self addSubview:self.sendButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [self.judgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(10);
    }];
    
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.mas_equalTo(self.judgeLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(100);
    }];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.mas_equalTo(self.inputView.mas_bottom).offset(10);
        make.width.mas_equalTo(80);
    }];
    
    [self.chooseStarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.inputView);
        make.top.bottom.equalTo(self.sendButton);
        make.width.mas_equalTo(100);
    }];
}

#pragma mark - Getter & Setter 

- (UILabel *)judgeLabel {
    if (!_judgeLabel) {
        self.judgeLabel = [[UILabel alloc] init];
        self.judgeLabel.text = @"评论";
        self.judgeLabel.font = FONT(18);
        self.judgeLabel.textColor = [UIColor blackColor];
        [self.judgeLabel sizeToFit];
        
//        self.judgeLabel.backgroundColor = [UIColor orangeColor];
    }
    return _judgeLabel;
}

- (UITextView *)inputView {
    if (!_inputView) {
        self.inputView = [[UITextView alloc] init];
//        self.inputView.backgroundColor = Default_BG_COLOR;
        self.inputView.layer.cornerRadius = 5;
        self.inputView.layer.masksToBounds = YES;
        self.inputView.layer.borderColor = [UIColor blackColor].CGColor;
        self.inputView.layer.borderWidth = 0.5;
        
    }
    return _inputView;
}

- (LDXScore *)chooseStarView {
    if (!_chooseStarView) {
        self.chooseStarView = [[LDXScore alloc] init];
        self.chooseStarView.max_star = 5;
        self.chooseStarView.isSelect = YES;
        self.chooseStarView.normalImg = [UIImage imageNamed:@"btn_star_evaluation_normal"];
        self.chooseStarView.highlightImg = [UIImage imageNamed:@"btn_star_evaluation_press"];
        
    }
    return _chooseStarView;
}

- (XLBarButton *)sendButton {
    if (!_sendButton) {
        self.sendButton = [XLFactory buttonWithTitle:@"发表评论" image:nil type:XLButtonTypeRound];
        [self.sendButton setBackgroundColor:Nav_BAR_COLOR];
    }
    return _sendButton;
}

- (UIView *)sepLine {
    if (!_sepLine) {
        self.sepLine = [[UIView alloc] init];
        self.sepLine.backgroundColor = Default_BG_COLOR;
    }
    return _sepLine;
}


@end
