//
//  ZXInfoAlertView.m
//  Zagic
//
//  Created by 区振轩 on 2019/5/13.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXInfoAlertView.h"
#import "ZXActionRuleView.h"

@interface ZXInfoAlertView ()

//顶部标题
@property (nonatomic,strong) UIButton * titleBtn;

@property (nonatomic, copy) NSString * title;           //弹窗标题

@property (nonatomic, strong) UIColor * color;          //标题底部颜色
@end

@implementation ZXInfoAlertView

- (instancetype)initWithTitle:(NSString *)title
              backgroundColor:(UIColor *)color{
    if ([super init]) {
        _title = title;
        _color = color;
        [self setupTheView];

        ZXActionRuleView * view = [[ZXActionRuleView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
        [self.contentView addSubview:view];
    }
    return self;
}

- (void)setupTheView{
    
    self.contentView = [[UIButton alloc] init];
    [self addSubview:self.contentView];
    self.contentView.backgroundColor = ZXCOLOR_WHITE;
    
    self.contentView.userInteractionEnabled = YES;
    
    _titleBtn = [[UIButton alloc] init];
    [self addSubview:_titleBtn];
    
    self.titleBtn.titleLabel.font = ZXFONT_18;
    self.titleBtn.titleLabel.textColor = ZXCOLOR_WHITE;
    self.titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleBtn setBackgroundColor:_color];
    [self.titleBtn setTitle:_title forState:UIControlStateNormal];
    
    [self setupLayout];
}

- (void)setupLayout{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(400);
    }];
    
    [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_top);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_offset(zx_scaleX_pt(160));
        make.height.mas_equalTo(40);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(44);
        make.top.mas_equalTo(self.contentView.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleBtn zx_setAllCorner:20];
    [self.contentView zx_setAllCorner:10];
}

@end
