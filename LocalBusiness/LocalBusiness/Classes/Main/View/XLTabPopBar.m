//
//  XLTabPopBar.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLTabPopBar.h"
#import "XLBarButton.h"

@interface XLTabPopBar ()
@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, strong) XLBarButton *lifeButton;
@property (nonatomic, strong) XLBarButton *communityButton;
@property (nonatomic, strong) XLBarButton *aroundButton;
@property (nonatomic, strong) XLBarButton *cancleButton;
@end

@implementation XLTabPopBar

+ (instancetype)popBar {
    return [[self alloc] init];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }
    return self;
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
    [self addSubview:self.bgView];
    [self addSubview:self.lifeButton];
    [self addSubview:self.communityButton];
    [self addSubview:self.aroundButton];
    [self addSubview:self.cancleButton];
}


- (void)updateConstraints {
    [super updateConstraints];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
    
    [self.lifeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(80 / 320.0 * SCREEN_WIDTH);
    }];
    
    [self.communityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.mas_equalTo(self.lifeButton.mas_right);
        make.width.mas_equalTo(92 / 320.0 * SCREEN_WIDTH);
    }];
    
    [self.aroundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.mas_equalTo(self.communityButton.mas_right);
        make.width.mas_equalTo(68 / 320.0 * SCREEN_WIDTH);
    }];
    
    [self.cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.mas_equalTo(self.aroundButton.mas_right);
    }];
}

#pragma mark - Event Response

- (void)popBarButtonDidClicked:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(popBar:buttonDidClickedWithIndex:)]) {
        [self.delegate popBar:self buttonDidClickedWithIndex:button.tag];
    }
}



#pragma mark - Getter & Setter  

- (UIImageView *)bgView {
    if (!_bgView) {
        self.bgView = [[UIImageView alloc] init];
        self.bgView.image = [UIImage imageNamed:@"home_topbar"];
    }
    return _bgView;
}


- (XLBarButton *)lifeButton{
    if (!_lifeButton) {
        self.lifeButton = [XLFactory buttonWithTitle:@"关于" image:nil type:XLButtonTypeNormal];
        [self.lifeButton addTarget:self action:@selector(popBarButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.lifeButton.tag = 5;
    }
    return _lifeButton;
}


- (XLBarButton *)communityButton {
    if (!_communityButton) {
        self.communityButton = [XLFactory buttonWithTitle:@"在线" image:nil type:XLButtonTypeNormal];
        [self.communityButton addTarget:self action:@selector(popBarButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.communityButton.tag = 6;
    }
    return _communityButton;
}

- (XLBarButton *)aroundButton {
    if (!_aroundButton) {
        
        self.aroundButton = [XLFactory buttonWithTitle:@"摇一摇" image:nil type:XLButtonTypeNormal];
        [self.aroundButton addTarget:self action:@selector(popBarButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.aroundButton.tag = 7;
    }
    return _aroundButton;
}

- (XLBarButton *)cancleButton {
    if (!_cancleButton) {
        self.cancleButton = [XLFactory buttonWithTitle:@"收起" image:nil type:XLButtonTypeNormal];
        [self.cancleButton addTarget:self action:@selector(popBarButtonDidClicked:) forControlEvents:UIControlEventTouchDown];
        self.cancleButton.tag = 8;
        self.cancleButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    }
    return _cancleButton;
}

@end




