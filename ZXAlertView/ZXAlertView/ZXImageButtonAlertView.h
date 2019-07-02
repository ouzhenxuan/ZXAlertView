//
//  ZXImageButtonAlertView.h
//  Zagic
//
//  Created by ozx on 2019/5/14.
//  Copyright © 2019 ozx. All rights reserved.
//

//demo:
//        ZXImageButtonAlertView * alertView = [[ZXImageButtonAlertView alloc] initWithImage:@"alertView_share" leftButtonTitle:@"继续发问" rightButtonTitle:@"分享助力" leftAction:^{
//            NSLog(@"left");
//        } rightAction:^{
//            NSLog(@"right");
//        }];

#import "ZXAlertViewBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXImageButtonAlertView : ZXAlertViewBase

- (instancetype)initWithImage:(NSString *)image
              leftButtonTitle:(NSString *)leftButtonTitle
             rightButtonTitle:(NSString *)rightButtonTitle
                   leftAction:(void (^)(void))leftAction
                  rightAction:(void (^)(void))rightAction;

- (instancetype)initWithImage:(NSString *)image
            centerButtonTitle:(NSString *)centerButtonTitle
                 centerAction:(void (^)(void))centerAction;

@end

NS_ASSUME_NONNULL_END
