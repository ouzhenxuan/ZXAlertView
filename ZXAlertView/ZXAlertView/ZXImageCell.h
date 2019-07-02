//
//  ZXImageCell.h
//  Zagic
//
//  Created by ozx on 2019/5/24.
//  Copyright © 2019 ozx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZXImageCell : UICollectionViewCell

@property (nonatomic,weak) UIImageView * imageView;
@property (nonatomic,weak) UIButton * closeBtn;

@end

NS_ASSUME_NONNULL_END
