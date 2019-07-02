//
//  ZXShareAlertView.m
//  Zagic
//
//  Created by ozx on 2019/5/29.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXShareAlertView.h"
#define BTNWIDTH 34

@interface ZXShareAlertView ()

@property (nonatomic,weak) UILabel * wechatLabel;
@property (nonatomic,weak) UILabel * wechatFriendLabel;      ///< 朋友圈
@property (nonatomic,weak) UILabel * weiboLabel;
@property (nonatomic,weak) UILabel * linkLabel;

@property (nonatomic,weak) UIView * line;               ///< 分割线
@property (nonatomic,weak) UIButton * cancleBtn;        ///< 取消按钮

@end

@implementation ZXShareAlertView

- (instancetype)initTheShareAlertView{
    if ([super init]) {
        
        [self setupTheView];
    }
    return self;
}


- (void)setupTheView{
    
    WS(weakSelf);
    self.contentView = [[UIButton alloc] init];
    [self addSubview:self.contentView];
    self.contentView.backgroundColor = ZXCOLOR_WHITE;
    self.contentView.userInteractionEnabled = YES;
    
    self.closeBtn.hidden = YES;
    
    UIImage * wechatImage = [UIImage imageNamed:@"alertView_share_wechat"];
//    [wechatImage sc_imageByResizeToSize:CGSizeMake(34, 34)];
    
    UIButton * wechatBtn = [[UIButton alloc] init];
    wechatBtn.layer.cornerRadius = BTNWIDTH/2;
    wechatBtn.layer.masksToBounds = YES;
    [wechatBtn setImage:wechatImage forState:UIControlStateNormal];
    [self.contentView addSubview:wechatBtn];
    self.wechatBtn = wechatBtn;
    
    UIButton * wechatFriendBtn = [[UIButton alloc] init];
    wechatFriendBtn.layer.cornerRadius = BTNWIDTH/2;
    wechatFriendBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:wechatFriendBtn];
    self.wechatFriendBtn = wechatFriendBtn;
    [wechatFriendBtn setImage:[UIImage imageNamed:@"alertView_share_wechatFriend"] forState:UIControlStateNormal];
    
//    UIButton * weiboBtn = [[UIButton alloc] init];
//    weiboBtn.layer.cornerRadius = BTNWIDTH/2;
//    weiboBtn.layer.masksToBounds = YES;
//    [self.contentView addSubview:weiboBtn];
//    self.weiboBtn = weiboBtn;
//    [weiboBtn setImage:[UIImage imageNamed:@"alertView_share_weibo"] forState:UIControlStateNormal];
    
    UIButton * linkBtn = [[UIButton alloc] init];
    linkBtn.layer.cornerRadius = BTNWIDTH/2;
    linkBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:linkBtn];
    self.linkBtn = linkBtn;
    [linkBtn setImage:[UIImage imageNamed:@"alertView_share_link"] forState:UIControlStateNormal];
    
    UILabel * wechatLabel = [[UILabel alloc] init];
    wechatLabel.text = @"微信好友";
    wechatLabel.font = ZXFONT_12;
    [wechatLabel setTextColor:ZXCOLOR_FONT_666];
    wechatLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:wechatLabel];
    self.wechatLabel = wechatLabel;
    
    UILabel * wechatFriendLabel = [[UILabel alloc] init];
    wechatFriendLabel.text = @"朋友圈";
    wechatFriendLabel.font = ZXFONT_12;
    [wechatFriendLabel setTextColor:ZXCOLOR_FONT_666];
    wechatFriendLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:wechatFriendLabel];
    self.wechatFriendLabel = wechatFriendLabel;
    
//    UILabel * weiboLabel = [[UILabel alloc] init];
//    weiboLabel.text = @"微博";
//    weiboLabel.font = ZXFONT_12;
//    [weiboLabel setTextColor:ZXCOLOR_FONT_666];
//    weiboLabel.textAlignment = NSTextAlignmentCenter;
//    [self.contentView addSubview:weiboLabel];
//    self.weiboLabel = weiboLabel;
    
    UILabel * linkLabel = [[UILabel alloc] init];
    linkLabel.text = @"复制链接";
    linkLabel.font = ZXFONT_12;
    [linkLabel setTextColor:ZXCOLOR_FONT_666];
    linkLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:linkLabel];
    self.linkLabel = linkLabel;
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = ZXCOLOR_WHITE_EEE;
    [self.contentView addSubview:line];
    self.line = line;
    
    UIButton * cancleBtn = [[UIButton alloc] init];
    cancleBtn.titleLabel.font = ZXFONT_16;
    [cancleBtn setTitleColor:ZXCOLOR_FONT_333 forState:UIControlStateNormal];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.contentView addSubview:cancleBtn];
    self.cancleBtn = cancleBtn;
    [cancleBtn addActionBlock:^(UIButton *button) {
        [self dismiss];
    }];
    
    wechatBtn.backgroundColor = [UIColor greenColor];
    [self setupLayout];
}

- (void)setupLayout{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self);
        make.height.mas_equalTo(145);
    }];
    
//    CGFloat spacing = (zx_screenWidth - 4 * BTNWIDTH) / 5.0;
    CGFloat spacing = (zx_screenWidth - 3 * BTNWIDTH) / 4.0;
    
    [self.wechatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(15);
        make.left.mas_equalTo(self.contentView).mas_offset(spacing);
        make.height.width.mas_equalTo(34);
    }];
    
    [self.wechatFriendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(15);
        make.left.mas_equalTo(self.wechatBtn.mas_right).mas_offset(spacing);
        make.height.width.mas_equalTo(34);
    }];
    
//    [self.weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.contentView).mas_offset(15);
//        make.left.mas_equalTo(self.wechatFriendBtn.mas_right).mas_offset(spacing);
//        make.height.width.mas_equalTo(34);
//    }];
    
    [self.linkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(15);
//        make.left.mas_equalTo(self.weiboBtn.mas_right).mas_offset(spacing);
        make.left.mas_equalTo(self.wechatFriendBtn.mas_right).mas_offset(spacing);
        make.height.width.mas_equalTo(34);
    }];
    
    [self.wechatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wechatBtn.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self.wechatBtn.mas_centerX);
        make.height.mas_equalTo(20);
    }];
    
    [self.wechatFriendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wechatBtn.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self.wechatFriendBtn.mas_centerX);
        make.height.mas_equalTo(20);
    }];
    
//    [self.weiboLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.wechatBtn.mas_bottom).mas_offset(5);
//        make.centerX.mas_equalTo(self.weiboBtn.mas_centerX);
//        make.height.mas_equalTo(20);
//    }];
    
    [self.linkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wechatBtn.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self.linkBtn.mas_centerX);
        make.height.mas_equalTo(20);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.wechatLabel.mas_bottom).mas_offset(10);
        make.left.right.mas_equalTo(self.contentView);
    }];
    
    [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(self.line.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
    }];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
}


@end
