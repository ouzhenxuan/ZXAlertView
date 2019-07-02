//
//  ZXInfoAlertView.h
//  Zagic
//
//  Created by 区振轩 on 2019/5/13.
//  Copyright © 2019 ozx. All rights reserved.
//

//活动规则

#import <UIKit/UIKit.h>
#import "ZXAlertViewBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXInfoAlertView : ZXAlertViewBase

@property (nonatomic,assign) BOOL isShowTopButton;

- (instancetype)initWithTitle:(NSString *)title
              backgroundColor:(UIColor *)color;



@end

NS_ASSUME_NONNULL_END
