//
//  ZXSmallImageAlertView.m
//  Zagic
//
//  Created by ozx on 2019/5/14.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXSmallImageAlertView.h"

@interface ZXSmallImageAlertView ()

//图片名称
@property (nonatomic, copy) NSString * imageName;
//背景图片
@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, strong) UILabel * tipContentLabel;

@property (nonatomic, strong) UILabel * flowerScoreLabel;
@end

@implementation ZXSmallImageAlertView

- (instancetype)initWithImageName:(NSString *)imageName
                       tipContent:(NSString *)tipContent
                      flowerScore:(int)flowerScore{
    if ([super init]) {
        _imageName = imageName;
        [self setupTheView];
        
        _tipContentLabel.text = tipContent;
        if (flowerScore > 0) {
            _flowerScoreLabel.text = [NSString stringWithFormat:@"+%d\U0000e64e",flowerScore];
        }else if(flowerScore < 0){
            _flowerScoreLabel.text = [NSString stringWithFormat:@"%d\U0000e64e",flowerScore];
        }else{
            _flowerScoreLabel.text = @"";               //等于0的情况
        }
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
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(160);
    }];
    self.contentView.userInteractionEnabled = YES;
    
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    [self.imageView setImage:[UIImage imageNamed:_imageName]];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.contentView.mas_top).mas_offset(15);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
    }];
    
    self.closeBtn.hidden = YES;
    
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
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView zx_setAllCorner:10];
}

@end
