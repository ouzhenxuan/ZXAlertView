//
//  ZXImageButtonAlertView.m
//  Zagic
//
//  Created by ozx on 2019/5/14.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXImageButtonAlertView.h"

@interface ZXImageButtonAlertView ()

//图片名称
@property (nonatomic, copy) NSString * image;
//背景图片
@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, strong) UIButton * leftBtn;

@property (nonatomic, strong) UIButton * rightBtn;

@property (nonatomic, strong) UIButton * centerBtn;
@end

@implementation ZXImageButtonAlertView

- (instancetype)initWithImage:(NSString *)image
              leftButtonTitle:(NSString *)leftButtonTitle
             rightButtonTitle:(NSString *)rightButtonTitle
                   leftAction:(void (^)(void))leftAction
                  rightAction:(void (^)(void))rightAction{
    if ([super init]) {
        _image = image;
        [self setupTheView];

        WS(weakSelf);

        [self.contentView addSubview:self.leftBtn];
        [self.leftBtn setTitle:leftButtonTitle forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:ZXCOLOR_WHITE forState:UIControlStateNormal];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-30);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(120);
            make.left.mas_equalTo(weakSelf.contentView.mas_left).mas_offset(20);
        }];
        _leftBtn.layer.borderWidth = 1;
        _leftBtn.layer.borderColor = ZXCOLOR_WHITE.CGColor;
        _leftBtn.layer.cornerRadius = 22;
        _leftBtn.layer.maskedCorners = YES;
        
        [_leftBtn addActionBlock:^(UIButton *button) {
            leftAction();
            [weakSelf dismiss];
        }];

        
        [self.contentView addSubview:self.rightBtn];
        [self.rightBtn setTitle:rightButtonTitle forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:ZXCOLOR_RED forState:UIControlStateNormal];

        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-30);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(120);
            make.right.mas_equalTo(weakSelf.contentView).mas_offset(-20);
        }];
        
        _rightBtn.backgroundColor = ZXCOLOR_WHITE;
        _rightBtn.layer.cornerRadius = 22;
        _rightBtn.layer.maskedCorners = YES;
        
        [_rightBtn addActionBlock:^(UIButton *button) {
            rightAction();
            [weakSelf dismiss];
        }];
    }
    return self;
}

- (instancetype)initWithImage:(NSString *)image
            centerButtonTitle:(NSString *)centerButtonTitle
                 centerAction:(void (^)(void))centerAction{
    if ([super init]) {
        _image = image;
        [self setupTheView];
        
        [self.contentView addSubview:self.centerBtn];
        WS(weakSelf);
        [_centerBtn setTitle:centerButtonTitle forState:UIControlStateNormal];
        [_centerBtn setTitleColor:ZXCOLOR_WHITE forState:UIControlStateNormal];
        
        [_centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).mas_offset(-30);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(120);
            make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
        }];

        _centerBtn.backgroundColor = ZXCOLOR_CLEAR;
        _centerBtn.layer.borderColor = ZXCOLOR_WHITE.CGColor;
        _centerBtn.layer.borderWidth = 1;
        _centerBtn.layer.cornerRadius = 22;
        _centerBtn.layer.maskedCorners = YES;
        
        [_centerBtn addActionBlock:^(UIButton *button) {
            centerAction();
            [weakSelf dismiss];
        }];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)setupTheView{
    
    WS(weakSelf);
    self.contentView = [[UIButton alloc] init];
    [self addSubview:self.contentView];
    self.contentView.backgroundColor = ZXCOLOR_CLEAR;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(300);
    }];
    self.contentView.userInteractionEnabled = YES;

    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    [self.imageView setImage:[UIImage imageNamed:_image]];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.right.left.mas_equalTo(weakSelf.contentView);
        make.edges.mas_equalTo(@0);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(44);
        make.top.mas_equalTo(self.contentView.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
    }];
}


- (UIButton *)centerBtn{
    if (_centerBtn == nil) {
        _centerBtn = [[UIButton alloc] init];
    }
    return _centerBtn;
}

- (UIButton *)leftBtn{
    if (_leftBtn == nil) {
        _leftBtn = [[UIButton alloc] init];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] init];
    }
    return _rightBtn;
}

@end
