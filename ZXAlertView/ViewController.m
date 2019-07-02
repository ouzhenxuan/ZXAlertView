//
//  ViewController.m
//  ZXAlertView
//
//  Created by ozx on 2019/7/1.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ViewController.h"
#import "ZXAlertView.h"

typedef NS_ENUM(NSUInteger, ZXAlertType) {
    ZXAlertTypeScrollview,
    ZXAlertTypeImageButton,
    ZXAlertTypeSmallImage,
    ZXAlertTypeCenterButtonImage,
    ZXAlertTypeShare
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@{@"title" : @"展示长内容滑动框", @"type" : @(ZXAlertTypeScrollview)},
                       @{@"title" : @"带block回调的图片弹窗", @"type" : @(ZXAlertTypeImageButton)},
                       @{@"title" : @"带小图片和文字的弹窗", @"type" : @(ZXAlertTypeSmallImage)},
                       @{@"title" : @"带一个block回调和中间按钮的弹窗", @"type" : @(ZXAlertTypeCenterButtonImage)},
                       @{@"title" : @"分享弹窗", @"type" : @(ZXAlertTypeShare)}].mutableCopy;
    
    __weak typeof(self) weakSelf = self;
    self.cellSelectedBlock = ^(NSInteger index) {
        __strong typeof(self) strongSelf = weakSelf;
        switch (index) {
            case ZXAlertTypeScrollview:
            {
                // 展示长内容滑动框
                [strongSelf showInfoAlertView];
            }
                break;
                
            case ZXAlertTypeImageButton:
            {
                // 带block回调的图片弹窗
                [strongSelf showImageButtonAlertView];
            }
                break;
                
            case ZXAlertTypeSmallImage:
            {
                // 带小图片和文字的弹窗
                [strongSelf showSmallImageBlockAlertView];
            }
                break;
                
            case ZXAlertTypeCenterButtonImage:
            {
                // 带一个block回调和中间按钮的弹窗
                [strongSelf showCenterButtonAlertView];
            }
                break;
                
            case ZXAlertTypeShare:
            {
                // 分享弹窗
                [strongSelf showShareView];
            }
                break;
        }
    };
}

#pragma mark - 展示长内容滑动框

- (void)showInfoAlertView {
    ZXInfoAlertView * alertView = [[ZXInfoAlertView alloc] initWithTitle:@"活动规则" backgroundColor:ZXCOLOR_RED];
    [alertView show];
}

#pragma mark - 带block回调的图片弹窗
- (void)showImageButtonAlertView{
    ZXImageButtonAlertView * alertView = [[ZXImageButtonAlertView alloc] initWithImage:@"alertView_share" leftButtonTitle:@"继续发问" rightButtonTitle:@"分享助力" leftAction:^{
        NSLog(@"left");
    } rightAction:^{
        NSLog(@"right");
    }];
    [alertView show];
}

#pragma mark - 带小图片和文字的弹窗

- (void)showSmallImageBlockAlertView {
    ZXSmallImageAlertView * alertView = [[ZXSmallImageAlertView alloc] initWithImageName:@"quickQuestion" tipContent:@"快速提问" flowerScore:-10];
    [alertView show];
}

#pragma mark - 带一个block回调和中间按钮的弹窗

- (void)showCenterButtonAlertView {
    ZXCenterBtnImageAlertView * alertView = [[ZXCenterBtnImageAlertView alloc] initWithImageName:@"insufficientBalance" tipContent:@"余额不足" flowerScore:0 centerButtonTitle:@"如何赚红花" centerAction:^{
        NSLog(@"123");
    }];
    [alertView show];
}

#pragma mark - 分享弹窗

- (void)showShareView {
    ZXShareAlertView * alertView = [[ZXShareAlertView alloc] initTheShareAlertView];
    [alertView show];
}



@end
