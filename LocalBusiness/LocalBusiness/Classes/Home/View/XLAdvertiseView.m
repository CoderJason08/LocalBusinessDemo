//
//  XLAdvView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLAdvertiseView.h"

/**
 *  定义广告数量
 */
static NSUInteger advertiseCount = 3;

@interface XLAdvertiseView ()
/**
 *  广告轮播scrollView
 */
@property (nonatomic, strong) UIScrollView *scrollView;
/**
 *  底部阴影
 */
@property (nonatomic, strong) UIView *bottomShadowView;
/**
 *  底部view,包裹descLabel和pageControl
 */
@property (nonatomic, strong) UIView *bottomView;
/**
 *  广告描述Label
 */
@property (nonatomic, strong) UILabel *descLabel;
/**
 *  pageControl
 */
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation XLAdvertiseView

+ (instancetype)advertiseView {
    return [[self alloc] init];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

/**
 *  初始化子控件
 */
- (void)setupSubviews {
    [self addSubview:self.scrollView];
    [self addSubview:self.bottomShadowView];
    /**
     *  将底部的descLabel和pageControl包装成到bottomView中
     */
    [self addSubview:self.bottomView];
}


/**
 *  布局子控件
 */
- (void)layoutSubviews {
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
    
    CGFloat bottomViewHeight = 24;
    [self.bottomShadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(bottomViewHeight);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.bottomShadowView);
        make.center.equalTo(self.bottomShadowView);
    }];
    
    CGFloat padding = 10;
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bottomView);
        make.left.equalTo(self.bottomView).offset(padding);
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bottomView);
        make.right.equalTo(self.bottomView).offset(-padding);
    }];
    
}

#pragma mark - Getter & Setter 

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.backgroundColor = [UIColor blueColor];
    }
    return _scrollView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        self.bottomView = [[UIView alloc] init];
        [self.bottomView addSubview:self.descLabel];
        [self.bottomView addSubview:self.pageControl];
    }
    return _bottomView;
}

- (UIView *)bottomShadowView {
    if (!_bottomShadowView) {
        self.bottomShadowView = [[UIView alloc] init];
        self.bottomShadowView.backgroundColor = [UIColor blackColor];
        self.bottomShadowView.alpha = 0.6;
    }
    return _bottomShadowView;
}

- (UILabel *)descLabel {
    if (!_descLabel) {
        self.descLabel = [[UILabel alloc] init];
        self.descLabel.text = @"测试测试测试";
        self.descLabel.textColor = [UIColor whiteColor];
        self.descLabel.font = FONT(16);
    }
    return _descLabel;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.numberOfPages = advertiseCount;
        self.pageControl.currentPage = 0;
    }
    return _pageControl;
}

@end
