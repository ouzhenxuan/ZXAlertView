//
//  ZXCenterBtnImageAlertView.h
//  Zagic
//
//  Created by ozx on 2019/5/14.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXAlertViewBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXCenterBtnImageAlertView : ZXAlertViewBase

/**
 有图片提示、有按钮的alertview
 
 @param imageName image名字
 @param tipContent 提示文字
 @param flowerScore 红花变化数 （若为0则隐藏赚红花label）
 @param centerButtonTitle 按钮文字
 @param centerAction 按钮动作
 @return 返回alertview
 */
- (instancetype)initWithImageName:(NSString *)imageName
                       tipContent:(NSString *)tipContent
                      flowerScore:(int)flowerScore
                centerButtonTitle:(NSString *)centerButtonTitle
                     centerAction:(void (^)(void))centerActin;

@end

NS_ASSUME_NONNULL_END
