//
//  ZXActionBigVRule.m
//  Zagic
//
//  Created by ozx on 2019/6/1.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXActionBigVRule.h"
#import "ZXNetwork+ActivityInfo.h"
#import "ZXActionBigVRule.h"

@interface ZXActionBigVRule ()
@property (nonatomic,weak) UIView * bgView;
@property (nonatomic,weak) UIScrollView * scrollview;

@property (nonatomic,copy) NSArray<NSString *> * ruleArray;

@end

@implementation ZXActionBigVRule

//- (instancetype)initWithRuleArray:(NSArray *)ruleArray withFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
////
//        [self getActivityInfo];
//    }
//    return  self;
//}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self getActivityInfo];
    }
    return self;
}

- (void)setupTheView{
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(15, 40, 270, 360)];
    scrollview.pagingEnabled = YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.contentSize = CGSizeMake(270, 800);
    [self addSubview:scrollview];
    self.scrollview = scrollview;
    
    UIView * bgView = [[UIView alloc] init];
    //    bgView.backgroundColor = ZXCOLOR_GRAY_BG1;
    bgView.frame = scrollview.bounds;
    [self.scrollview addSubview:bgView];
    self.bgView = bgView;
    
    CGFloat beforeHeight = 0;
    for (NSString * rule in _ruleArray) {
        CGFloat height = [rule sc_heightForFont:ZXFONT_16 width:270];
        UILabel * titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, beforeHeight , 270, height)];
        titleLabel1.text = rule;
        titleLabel1.numberOfLines = 0;
        titleLabel1.textAlignment = NSTextAlignmentLeft;
        titleLabel1.font = ZXFONT_16;
        titleLabel1.textColor = ZXCOLOR_FONT_333;
        [bgView addSubview:titleLabel1];
        
        beforeHeight += height + 15;
    }
    
    CGFloat height = [self getHeight];
    scrollview.contentSize = CGSizeMake(1, height);
}

- (CGFloat)getHeight {
    CGFloat height = 0;
    for (NSString * rule in _ruleArray) {
        height += [rule sc_heightForFont:ZXFONT_16 width:270] + 15;
    }
    return height;
}


- (void)getActivityInfo{
    WS(weakSelf);
    [ZXNetwork getActivityInfo:^(ZXNetworkResponseData *responseData, ZXNetworkResult *result, NSError *error) {
        NSLog(@"%@",responseData.data);
        NSString * activityRule = [responseData.data objectForKey:@"activityRule"];
        [weakSelf handleTheActivityInfo:activityRule];
        [weakSelf setupTheView];
    }];
}

- (void)handleTheActivityInfo:(NSString *)activityInfo{
    NSMutableArray * activityInfoArray = [NSMutableArray array];
    NSUInteger startLocation = 0;
    for (int i = 2; i< 20 ; i ++) {
        NSString *string =activityInfo;
        NSRange range = [string rangeOfString:[NSString stringWithFormat:@"%d.",i]];//匹配得到的下标
        NSLog(@"rang:%@",NSStringFromRange(range));
        if (range.length == 0) {
            NSRange ruleRange = NSMakeRange(startLocation, activityInfo.length - startLocation);
            string = [string substringWithRange:ruleRange];//截取范围内的字符串
            [activityInfoArray addObject:string];
            break;
        }
        NSRange ruleRange = NSMakeRange(startLocation, range.location - startLocation);
        string = [string substringWithRange:ruleRange];//截取范围内的字符串
        NSLog(@"截取的值为：%@",string);
        startLocation = range.location;
        [activityInfoArray addObject:string];
    }
    
    _ruleArray = activityInfoArray;
}
@end
