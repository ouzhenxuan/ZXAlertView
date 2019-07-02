//
//  ViewController.m
//  ZXAlertView
//
//  Created by ozx on 2019/7/1.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, ZXAlertType) {
    ZXAlertTypeScrollview,
    ZXAlertTypeImageButton,
    ZXAlertTypeSmallImage,
    ZXAlertTypeCenterButtonImage,
    ZXAlertTypeShare
};

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@{@"title" : @"展示长内容滑动框", @"type" : @(ZXAlertTypeScrollview)},
                       @{@"title" : @"带block回调的图片弹窗", @"type" : @(ZXAlertTypeImageButton)},
                       @{@"title" : @"带小图片和block回调的弹窗", @"type" : @(ZXAlertTypeSmallImage)},
                       @{@"title" : @"带一个block回调和中间按钮的弹窗", @"type" : @(ZXAlertTypeCenterButtonImage)},
                       @{@"title" : @"分享弹窗", @"type" : @(ZXAlertTypeShare)}].mutableCopy;
    
    __weak typeof(self) weakSelf = self;
    self.cellSelectedBlock = ^(NSInteger index) {
        __strong typeof(self) strongSelf = weakSelf;
        switch (index) {
            case ZXAlertTypeScrollview:
            {
                // 申报异常弹窗
                [strongSelf showInfoAlertView];
            }
                break;
                
            case ZXAlertTypeImageButton:
            {
                // 带block的弹窗
                [strongSelf showImageButtonAlertView];
            }
                break;
                
            case CQContentsAlertTypeImageBlock:
            {
                // 带网络图片和block的弹窗
                [strongSelf showImageBlockAlertView];
            }
                break;
                
            case CQContentsAlertTypeColorfulAlertView:
            {
                // 炫彩UIAlertView
                [strongSelf showColorfulAlertView];
            }
                break;
                
            case CQContentsAlertTypeRuleView:
            {
                // 积分规则弹窗
                [strongSelf showRuleView];
            }
                break;
                
            case CQContentsAlertTypeIChu:
            {
                // iChu app 整套弹窗
                [strongSelf showIChuAlertView];
            }
                break;
        }
    };
}

#pragma mark - 申报异常弹窗

- (void)showInfoAlertView {
    
}

// 申报异常弹窗的button点击时回调
- (void)showImageButtonAlertView:(CQDeclareAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}

#pragma mark - 带block的弹窗

- (void)showBlockAlertView {
    [CQBlockAlertView alertWithButtonClickedBlock:^{
        [CQToast showWithMessage:@"兑换按钮点击"];
    }];
}

#pragma mark - 带网络图片和block的弹窗

- (void)showImageBlockAlertView {
    [CQImageBlockAlertView alertWithImageURL:@"https://avatars0.githubusercontent.com/u/13911054?s=460&v=4" buttonClickedBlock:^{
        [CQToast showWithMessage:@"去兑换按钮点击"];
    }];
}

#pragma mark - 炫彩UIAlertView

- (void)showColorfulAlertView {
    [CQColorfulAlertView showConversionSucceedAlertWithCouponName:@"兑换成功" validityTime:@"2018-11-11" checkCouponButtonClickedBlock:^{
        [CQToast showWithMessage:@"兑换成功"];
    }];
}

#pragma mark - 积分规则说明弹窗

- (void)showRuleView {
    [CQPointsRuleView showWithImageURL:@"https://upload-images.jianshu.io/upload_images/1692043-fac3309a5bfa76db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/780"];
}

#pragma mark - iChu app 整套弹窗

- (void)showIChuAlertView {
    [IChuAlertView showWithTitle:@"标题" content:@"内容" buttonTitles:@[@"知道了"] buttonClickedBlock:nil];
}

@end
