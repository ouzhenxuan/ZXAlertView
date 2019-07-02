//
//  ZXImageCell.m
//  Zagic
//
//  Created by ozx on 2019/5/24.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXImageCell.h"

@implementation ZXImageCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTheView];
    }
    return self;
}

- (void)setupTheView{
    
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = ZXCOLOR_RED;
    [self addSubview:imageView];
    self.imageView = imageView;
    
    UIButton * closeBtn = [[UIButton alloc] init];
    [closeBtn setBackgroundColor:ZXCOLOR_TRANSLUCENT];
    [closeBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e676", 12, ZXCOLOR_WHITE)] forState:UIControlStateNormal];
    [self addSubview:closeBtn];
    self.closeBtn = closeBtn;
    
    [self setupLayout];
}

- (void)setupLayout{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(@(0));
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(self);
        make.height.width.mas_equalTo(12);
    }];
}


@end
