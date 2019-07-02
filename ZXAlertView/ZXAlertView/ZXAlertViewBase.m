//
//  ZXAlertViewBase.m
//  Zagic
//
//  Created by ozx on 2019/5/13.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXAlertViewBase.h"

@interface ZXAlertViewBase ()
@property (nonatomic, strong) UIButton * backgroundBtn;

@end

@implementation ZXAlertViewBase

- (instancetype)init{
    if (self = [super init]) {
        _keyWindow = [UIApplication sharedApplication].keyWindow;
        
        // UI搭建
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    WS(weakSelf);
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor clearColor];
    
    self.backgroundBtn = [[UIButton alloc] init];
    self.backgroundBtn.frame = [UIScreen mainScreen].bounds;
    self.backgroundBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self addSubview:self.backgroundBtn];
    [self.backgroundBtn addActionBlock:^(UIButton *button) {
        [weakSelf dismiss];
    }];

    _closeBtn = [[UIButton alloc] init];
    [self addSubview:_closeBtn];

    [_closeBtn setTitle:@"X" forState:UIControlStateNormal];
    [_closeBtn addActionBlock:^(UIButton *button) {
        [weakSelf dismiss];
    }];
}

#pragma mark - 弹窗展示/隐藏
/** 弹出此弹窗 */
- (void)show {
    // 出场动画
    self.alpha = 0;
    self.contentView.transform = CGAffineTransformScale(self.contentView.transform, 1.3, 1.3);
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
        self.contentView.transform = CGAffineTransformIdentity;
    }];
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
}

/** 移除此弹窗 */
- (void)dismiss {
    [self removeFromSuperview];
}

@end
