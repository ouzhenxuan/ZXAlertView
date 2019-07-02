//
//  ZXActionRuleView.m
//  Zagic
//
//  Created by ozx on 2019/5/14.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXActionRuleView.h"

@interface ZXActionRuleView ()<UIScrollViewDelegate>
@property (nonatomic,weak) UILabel * titleLabel1;
@property (nonatomic,weak) UILabel * contextLabel1;
@property (nonatomic,weak) UILabel * titleLabel2;
@property (nonatomic,weak) UILabel * contextLabel2;

@property (nonatomic,weak) UIView * bgView;
@property (nonatomic,weak) UIScrollView * scrollview;

@end

@implementation ZXActionRuleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //        _context = @"每周收获回答采纳次数前两名会获得本周奖品 每周一上午12:00公布上周奖品获得者";
        
        [self setupTheView];
    }
    return self;
}

- (void)setupTheView{
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(15, 40, 270, 360)];
    scrollview.delegate = self;
    scrollview.pagingEnabled = YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.contentSize = CGSizeMake(270, 0);
    [self addSubview:scrollview];
    self.scrollview = scrollview;
    
    UIView * bgView = [[UIView alloc] init];
    [self.scrollview addSubview:bgView];
    self.bgView = bgView;
    
    UILabel * titleLabel1 = [[UILabel alloc] init];
    titleLabel1.text = @"每周收获回答采纳次数前两名会获得本周奖品\n每周一上午12:00公布上周奖品获得者";
    titleLabel1.numberOfLines = 0;
    titleLabel1.textAlignment = NSTextAlignmentCenter;
    titleLabel1.font = ZXFONT_16;
    titleLabel1.textColor = ZXCOLOR_RED;
    [bgView addSubview:titleLabel1];
    self.titleLabel1 = titleLabel1;
    
    UILabel * contextLabel1 = [[UILabel alloc] init];
    contextLabel1.text = @"如发现有作弊、灌水、发布垃圾广告等违规行为，家知将按照「家知问答社区规则」中启用相应惩罚机制——取消获奖资格、扣除相应红花、禁言、封号等处罚，并根据当周排名对榜单中的其他用户进行顺延发奖。和谐互助、公平公正的社区要靠大家和我们一起努力才能保持住哟！";
    contextLabel1.numberOfLines = 0;
    contextLabel1.textAlignment = NSTextAlignmentLeft;
    contextLabel1.font = ZXFONT_16;
    contextLabel1.textColor = ZXCOLOR_FONT_333;
    [bgView addSubview:contextLabel1];
    self.contextLabel1 = contextLabel1;
    
    UILabel * titleLabel2 = [[UILabel alloc] init];
    titleLabel2.text = @"家知问答社区规则";
    titleLabel2.numberOfLines = 0;
    titleLabel2.font = ZXFONT_16;
    titleLabel2.textAlignment = NSTextAlignmentCenter;
    titleLabel2.textColor = ZXCOLOR_RED;
    [bgView addSubview:titleLabel2];
    self.titleLabel2 = titleLabel2;
    
    UILabel * contextLabel2 = [[UILabel alloc] init];
    contextLabel2.text = @"“信任”是家知问答社区的根本，鼓励大家持续产生真实的、对其他用户有帮助的优质内容是社区运营的核心目标。【反作弊】什么是作弊：包括不限于机器刷赞、马甲刷赞、多人串通协议交换、短时间内以非正常方式大量邀请用户、以及其他非正常获取和使用红花的行为。惩罚机制发现作弊第一次：取消奖品，红花清零，一周禁言，列入黑名单观察，移出微信亲友群发现作弊第二次：封禁账号一个月发现作弊第三次：永久封号，屏蔽IP【反灌水】什么是灌水：在社区中发表大量没有实际意义的的内容。惩罚机制发现灌水第一次：删除发言，扣除红花20朵发现灌水第两次：删除发言，扣除红花50朵，一周禁言发现灌水三次及以上：删除发言，扣除红花50朵，封禁账号【反垃圾广告】一经发现，立即封号。活动最终解释权归「家知问答」平台所有。";
    contextLabel2.numberOfLines = 0;
    contextLabel2.textAlignment = NSTextAlignmentLeft;
    contextLabel2.font = ZXFONT_16;
    contextLabel2.textColor = ZXCOLOR_FONT_333;
    [bgView addSubview:contextLabel2];
    self.contextLabel2 = contextLabel2;
    [self setupLayout];
}

- (void)setupLayout{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollview);
        make.width.mas_equalTo(self.scrollview);
    }];
    
    [self.titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView).mas_offset(0);
        make.left.right.mas_equalTo(self.bgView);
    }];
    
    [self.contextLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel1.mas_bottom).mas_offset(15);
        make.left.right.mas_equalTo(self.bgView);
    }];
    
    [self.titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contextLabel1.mas_bottom).mas_offset(15);
        make.left.right.mas_equalTo(self.bgView);
    }];
    
    [self.contextLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel2.mas_bottom).mas_offset(15);
        make.left.right.mas_equalTo(self.bgView);
        make.bottom.mas_equalTo(self.bgView.mas_bottom).mas_offset(-15);
    }];
}
@end
