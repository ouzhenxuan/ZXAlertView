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
                       @{@"title" : @"带小图片和block回调的弹窗", @"type" : @(ZXAlertTypeSmallImage)},
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
                // 带小图片和block回调的弹窗
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
    
}

#pragma mark - 带小图片和block回调的弹窗

- (void)showSmallImageBlockAlertView {
    
}

#pragma mark - 带一个block回调和中间按钮的弹窗

- (void)showCenterButtonAlertView {
   
}

#pragma mark - 分享弹窗

- (void)showShareView {
   
    
}



@end
