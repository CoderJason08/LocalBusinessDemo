//
//  XLPersonalFooterView.m
//  LocalBusiness
//
//  Created by Jason on 15/8/21.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "XLPersonalFooterView.h"


@interface XLPersonalFooterView () <UIActionSheetDelegate>
/**
 *  退出登录
 */
@property (nonatomic, strong) XLBarButton *exitButton;
/**
 *  修改资料
 */
@property (nonatomic, strong) XLBarButton *modifyInfoButton;
/**
 *  修改密码
 */
@property (nonatomic, strong) XLBarButton *modifyPwdButton;
@end

@implementation XLPersonalFooterView

+ (XLPersonalFooterView *)personalFooterView {
    return [[XLPersonalFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
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
    [self addSubview:self.modifyInfoButton];
    [self addSubview:self.modifyPwdButton];
    [self addSubview:self.exitButton];
}

- (void)layoutSubviews {
    
    [self.modifyInfoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(30);
        make.top.equalTo(self).offset(32);
        make.height.mas_equalTo(45);
        make.right.mas_equalTo(self.modifyPwdButton.mas_left).offset(-14);
    }];
    
    [self.modifyPwdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.modifyInfoButton);
        make.top.equalTo(self.modifyInfoButton);
        make.right.equalTo(self).offset(-30);
    }];
    
    [self.exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.modifyInfoButton);
        make.right.equalTo(self.modifyPwdButton);
        make.top.mas_equalTo(self.modifyPwdButton.mas_bottom).offset(27);
        make.height.equalTo(self.modifyPwdButton);
    }];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSFileManager *fmr = [NSFileManager defaultManager];
        [fmr removeItemAtPath:[XLFunction getUserInfoPath] error:NULL];
        // 退出登录
        [XLUserInfo sharedInfo].isLogin = NO;
        if ([self.delegate respondsToSelector:@selector(didClickexitButton)]) {
            [self.delegate didClickexitButton];
        }
    }
}


#pragma mark - Action

- (void)exitButtonDidClick {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确认退出?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}


#pragma mark - Getter & Setter


- (XLBarButton *)modifyInfoButton {
    if (!_modifyInfoButton) {
        self.modifyInfoButton = [XLFactory buttonWithTitle:@"修改资料" image:[UIImage imageNamed:@"user_info"] type:XLButtonTypeRound];
        self.modifyInfoButton.backgroundColor = COLOR_RGBA(64, 173, 194, 1);
        self.modifyInfoButton.contentMode = UIViewContentModeCenter;
    }
    return _modifyInfoButton;
}

- (XLBarButton *)modifyPwdButton {
    if (!_modifyPwdButton) {
        self.modifyPwdButton = [XLFactory buttonWithTitle:@"修改密码" image:[UIImage imageNamed:@"user_passwd"] type:XLButtonTypeRound];
        self.modifyPwdButton.backgroundColor = COLOR_RGBA(64, 173, 194, 1);
    }
    return _modifyPwdButton;
}


- (XLBarButton *)exitButton {
    if (!_exitButton) {
        self.exitButton = [XLFactory buttonWithTitle:@"退出登录" image:nil type:XLButtonTypeRound];
        self.exitButton.backgroundColor = COLOR_RGBA(197, 82, 47, 1);
        [self.exitButton addTarget:self action:@selector(exitButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitButton;
}


@end
