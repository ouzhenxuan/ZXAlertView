//
//  ZXSmallImageAlertView.h
//  Zagic
//
//  Created by ozx on 2019/5/14.
//  Copyright © 2019 ozx. All rights reserved.
//

//demo:
//ZXSmallImageAlertView * alertView = [[ZXSmallImageAlertView alloc] initWithImageName:@"quickQuestion" tipContent:@"快速提问" flowerScore:-10];
//[alertView show];

#import "ZXAlertViewBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXSmallImageAlertView : ZXAlertViewBase

- (instancetype)initWithImageName:(NSString *)imageName
                       tipContent:(NSString *)tipContent
                      flowerScore:(int)flowerScore;

@end

NS_ASSUME_NONNULL_END
