//
//  ZXAlbumAlertview.h
//  Zagic
//
//  Created by ozx on 2019/5/24.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "ZXAlertViewBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXAlbumAlertview : UIViewController

- (instancetype)initWithReturnImageAction:(void (^)(UIImage *image))alunmAction
                             cancleAction:(void (^)(void))cancleAction;


@end

NS_ASSUME_NONNULL_END
