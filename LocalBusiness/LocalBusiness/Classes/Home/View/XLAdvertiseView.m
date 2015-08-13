//
//  XLAdvView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/13.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLAdvertiseView.h"
#import "UIImageView+AFNetworking.h"

@interface XLAdvertiseView () <UIScrollViewDelegate>
/**
 *  轮播imageView数组
 */
@property (nonatomic, strong) NSMutableArray *imageViews;

@end

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
/**
 *  定时器
 */
@property (nonatomic, strong) NSTimer *timer;
/**
 *  当前页
 */
@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation XLAdvertiseView
/**
 *  快速创建
 */
+ (instancetype)advertiseView {
    return [[self alloc] init];
}

#pragma mark - Life Circle

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


- (void)dealloc {
    [self.timer invalidate];
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.currentPage = (NSInteger)self.scrollView.contentOffset.x / SCREEN_WIDTH;
    self.pageControl.currentPage = self.currentPage;
    FocusModel *foucus = self.list[self.currentPage];
    self.descLabel.text = foucus.title;
}

#pragma mark - Private Function

/**
 *  设置广告数据
 */
- (void)loadData {
    [self.imageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        FocusModel *foucus = self.list[idx];
        [imageView setImageWithURL:[NSURL URLWithString:foucus.cover]];
    }];
    self.descLabel.text = [self.list[0] title];
}

/**
 *  初始化子控件
 */
- (void)setupSubviews {
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self addSubview:self.scrollView];
    [self addSubview:self.bottomShadowView];
    /**
     *  将底部的descLabel和pageControl包装成到bottomView中
     */
    [self addSubview:self.bottomView];
}


#warning 移动焦点图的方法
- (void)moveScrollView {
    
}

#pragma mark - Getter & Setter 

- (void)setList:(NSArray *)list {
    _list = list;
    [self loadData];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.delegate = self;
//        self.scrollView.backgroundColor = [UIColor blueColor];
        // 添加轮播imageView
        for (int index = 0; index < advertiseCount; index++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [self.imageViews addObject:imageView];
            imageView.backgroundColor = Random_COLOR;
            imageView.frame = CGRectMake(index * SCREEN_WIDTH, 0, SCREEN_WIDTH, 353 * (SCREEN_HEIGHT / 568) / 2.0 );
            [self.scrollView addSubview:imageView];
        }
        // 设置contentSize
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * advertiseCount, 0);
        // 设置滚动分页
        self.scrollView.pagingEnabled = YES;
        // 设置弹簧效果
        self.scrollView.bounces = NO;
        // 隐藏滚动条
        self.scrollView.showsHorizontalScrollIndicator = NO;
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
//        self.descLabel.text = @"测试测试测试";
        self.descLabel.textColor = [UIColor whiteColor];
        self.descLabel.font = FONT(14);
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

- (NSMutableArray *)imageViews{
    if (!_imageViews) {
        self.imageViews = [NSMutableArray array];
    }
    return _imageViews;
}

- (NSTimer *)timer {
    if (!_timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(moveScrollView) userInfo:nil repeats:YES];
    }
    return _timer;
}

@end
