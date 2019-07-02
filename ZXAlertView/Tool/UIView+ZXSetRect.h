//
//  UIView+SetRect.h
//  UIView
//
//  Created by JmoVxia on 2016/10/27.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * 随机色
 */
#define zx_RandomColor [UIColor colorWithHue:(arc4random() % (256) / (256.0)) saturation:(arc4random() % (128) / (256.0)) + (0.5) brightness:(arc4random() % (128) / (256.0)) + (0.5) alpha:(1)]
/**
 *  UIScreen width.
 */
#define  zx_screenWidth   [UIScreen mainScreen].bounds.size.width

/**
 *  UIScreen height.
 */
#define  zx_screenHeight  [UIScreen mainScreen].bounds.size.height

/**iPhone6为标准，乘以宽的比例*/
#define zx_scaleX_px(value) (((value) * 0.5f)/(375.f) * zx_screenWidth)
/**iPhone6为标准，乘以高的比例*/
#define zx_scaleY_px(value) (((value) * 0.5f)/(667.f) * zx_screenHeight)
/**直接使用像素*/
#define zx_px(value) ((value) * 0.5f)

/**iPhone6为标准，乘以宽的比例*/
#define zx_scaleX_pt(value) ((value)/(375.f) * zx_screenWidth)
/**iPhone6为标准，乘以高的比例*/
#define zx_scaleY_pt(value) ((value)/(667.f) * zx_screenHeight)
/**直接使用点*/
#define zx_pt(value) ((value) * 0.5f)

#define WS(weakSelf)      __weak typeof(self) weakSelf = self
#define SS(strongSelf)    __strong typeof(&*self) strongSelf = weakSelf;

/**
 *  Status bar height.
 */
#define  zx_statusBarHeight      [[UIApplication sharedApplication] statusBarFrame].size.height

/**
 *  Navigation bar height.
 */
#define  zx_navigationBarHeight  44.f

/**
 *  Status bar & navigation bar height.
 */
#define  zx_statusBarAndNavigationBarHeight   (zx_statusBarHeight + 44.f)

/**
 tabbar高度
 */
#define  zx_tabbarHeight         ((zx_iPhoneX || zx_iPhoneXr || zx_iPhoneXs || zx_iPhoneXsMax) ? (49.f + 34.f) : 49.f)
/**
 底部安全间距
 */
#define  zx_safeBottomMargin  ((zx_iPhoneX || zx_iPhoneXr || zx_iPhoneXs || zx_iPhoneXsMax) ? 34.f : 0.f)



// 判断是否是ipad
#define zx_isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define zx_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)
// 判断iPhone5系列
#define zx_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)
// 判断iPhone6系列
#define zx_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)
//判断iphone6+系列
#define zx_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)
// 判断iPhoneX
#define zx_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)
// 判断iPHoneXr
#define zx_iPhoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)
// 判断iPhoneXs
#define zx_iPhoneXs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)
// 判断iPhoneXs Max
#define zx_iPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !zx_isPad : NO)

// 判断iPhoneX系列
#define zx_iPhoneX_Xr_Xs_XsMax ((zx_iPhoneX) || (zx_iPhoneXr) || (zx_iPhoneXs) || (zx_iPhoneXsMax))


@interface UIView (zx_SetRect)



/**
 控件起点
 */
@property (nonatomic) CGPoint zx_origin;

/**
 控件起点x
 */
@property (nonatomic) CGFloat zx_x;

/**
 控件起点Y
 */
@property (nonatomic) CGFloat zx_y;

/**
 控件宽
 */
@property (nonatomic) CGFloat zx_width;

/**
 控件高
 */
@property (nonatomic) CGFloat zx_height;

/**
 控件顶部
 */
@property (nonatomic) CGFloat zx_top;

/**
 控件底部
 */
@property (nonatomic) CGFloat zx_bottom;

/**
 控件左边
 */
@property (nonatomic) CGFloat zx_left;

/**
 控件右边
 */
@property (nonatomic) CGFloat zx_right;

/**
 控件中心点X
 */
@property (nonatomic) CGFloat zx_centerX;

/**
 控件中心点Y
 */
@property (nonatomic) CGFloat zx_centerY;

/**
 控件左下
 */
@property(readonly) CGPoint zx_bottomLeft ;

/**
 控件右下
 */
@property(readonly) CGPoint zx_bottomRight ;

/**
 控件左上
 */
@property(readonly) CGPoint zx_topLeft ;
/**
 控件右上
 */
@property(readonly) CGPoint zx_topRight ;


/**
 屏幕中心点X
 */
@property (nonatomic, readonly) CGFloat zx_middleX;

/**
 屏幕中心点Y
 */
@property (nonatomic, readonly) CGFloat zx_middleY;

/**
 屏幕中心点
 */
@property (nonatomic, readonly) CGPoint zx_middlePoint;

/**
 控件size
 */
@property (nonatomic) CGSize zx_size;



/**
 设置上边圆角
 */
- (void)zx_setCornerOnTop:(CGFloat) conner;

/**
 设置下边圆角
 */
- (void)zx_setCornerOnBottom:(CGFloat) conner;
/**
 设置左边圆角
 */
- (void)zx_setCornerOnLeft:(CGFloat) conner;
/**
 设置右边圆角
 */
- (void)zx_setCornerOnRight:(CGFloat) conner;

/**
 设置左上圆角
 */
- (void)zx_setCornerOnTopLeft:(CGFloat) conner;

/**
 设置右上圆角
 */
- (void)zx_setCornerOnTopRight:(CGFloat) conner;
/**
 设置左下圆角
 */
- (void)zx_setCornerOnBottomLeft:(CGFloat) conner;
/**
 设置右下圆角
 */
- (void)zx_setCornerOnBottomRight:(CGFloat) conner;


/**
 设置所有圆角
 */
- (void)zx_setAllCorner:(CGFloat) conner;


@end

