//
//  ZXCenterBtnImageAlertView.m
//  Zagic
//
//  Created by ozx on 2019/5/14.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXCenterBtnImageAlertView.h"

@interface ZXCenterBtnImageAlertView ()

//图片名称
@property (nonatomic, copy) NSString * imageName;
//背景图片
@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, strong) UIButton * centerBtn;

@property (nonatomic, strong) UILabel * tipContentLabel;

@property (nonatomic, strong) UILabel * flowerScoreLabel;

@property (nonatomic, copy) NSString * centerButtonTitle;

@end

@implementation ZXCenterBtnImageAlertView

- (instancetype)initWithImageName:(NSString *)imageName
                       tipContent:(NSString *)tipContent
                      flowerScore:(int)flowerScore
                centerButtonTitle:(NSString *)centerButtonTitle
                     centerAction:(void (^)(void))centerAction{
    if ([super init]) {
        _imageName = imageName;
        _centerButtonTitle = centerButtonTitle;
        [self setupTheView];
        
        WS(weakSelf);
        [_centerBtn addActionBlock:^(UIButton *button) {
            centerAction();
            [weakSelf dismiss];
        }];
        
        if (flowerScore == 0) {
            _flowerScoreLabel.hidden = YES;
        }
        if (flowerScore > 0) {
            _flowerScoreLabel.text = [NSString stringWithFormat:@"+%d\U0000e64e",flowerScore];
        }else{
            _flowerScoreLabel.text = [NSString stringWithFormat:@"%d\U0000e64e",flowerScore];
        }
        
        _tipContentLabel.text = tipContent;
        
    }
    return self;
}


- (void)setupTheView{
    
    WS(weakSelf);
    self.contentView = [[UIButton alloc] init];
    [self addSubview:self.contentView];
    self.contentView.backgroundColor = ZXCOLOR_WHITE;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
    self.contentView.userInteractionEnabled = YES;
    
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    [self.imageView setImage:[UIImage imageNamed:_imageName]];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(32);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
    }];
    
    self.tipContentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.tipContentLabel];
    [self.tipContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imageView.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(weakSelf.contentView).mas_offset(15);
        make.right.mas_equalTo(weakSelf.contentView).mas_offset(-15);
        make.height.mas_equalTo(22);
    }];
    self.tipContentLabel.font = ZXFONT_16;
    self.tipContentLabel.textAlignment = NSTextAlignmentCenter;
    [self.tipContentLabel setTextColor:ZXCOLOR_FONT_333];
    
    self.flowerScoreLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.flowerScoreLabel];
    [self.flowerScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.tipContentLabel.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(weakSelf.contentView).mas_offset(15);
        make.right.mas_equalTo(weakSelf.contentView).mas_offset(-15);
        make.height.mas_equalTo(25);
    }];
    self.flowerScoreLabel.font = ZXICONFONT(18);
    [self.flowerScoreLabel setTextColor:ZXCOLOR_RED];
    self.flowerScoreLabel.textAlignment = NSTextAlignmentCenter;
    
    self.centerBtn = [[UIButton alloc] init];
    [self addSubview:self.centerBtn];
    [_centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.contentView.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(120);
    }];
    [_centerBtn setTitle:_centerButtonTitle forState:UIControlStateNormal];
    [_centerBtn setTitleColor:ZXCOLOR_WHITE forState:UIControlStateNormal];
    _centerBtn.layer.cornerRadius = 22;
    _centerBtn.layer.maskedCorners = YES;
    
    [self.closeBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e649", 20, ZXCOLOR_WHITE_EEE)] forState:UIControlStateNormal];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(12);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-12);
    }];
    [self bringSubviewToFront:self.closeBtn];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.contentView zx_setAllCorner:10];
}

@end
