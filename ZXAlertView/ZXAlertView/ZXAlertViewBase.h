//
//  ZXAlertViewBase.h
//  Zagic
//
//  Created by ozx on 2019/5/13.
//  Copyright © 2019 ozx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZXAlertViewBase : UIView


@property (nonatomic, strong) UIWindow * keyWindow;
//关闭按钮
@property (nonatomic, strong) UIButton * closeBtn;
//弹窗主内容
@property (nonatomic,strong) UIView * contentView;


/** show出这个弹窗 */
- (void)show;
/** 退出这个弹窗 */
- (void)dismiss ;
@end

NS_ASSUME_NONNULL_END
