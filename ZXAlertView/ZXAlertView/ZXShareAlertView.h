//
//  ZXShareAlertView.h
//  Zagic
//
//  Created by ozx on 2019/5/29.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXAlertViewBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXShareAlertView : ZXAlertViewBase

@property (nonatomic,weak) UIButton * wechatBtn;
@property (nonatomic,weak) UIButton * wechatFriendBtn;      ///< 朋友圈按钮
@property (nonatomic,weak) UIButton * weiboBtn;
@property (nonatomic,weak) UIButton * linkBtn;

- (instancetype)initTheShareAlertView;

@end

NS_ASSUME_NONNULL_END
