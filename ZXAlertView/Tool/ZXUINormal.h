//
//  ZXUINormal.h
//  Zagic
//
//  Created by Solo on 2019/5/9.
//  Copyright © 2019 ozx. All rights reserved.
//

#import "UIColor+SCBase.h"

#ifndef ZXUINormal_h
#define ZXUINormal_h

// UIColor 相关的宏，用于快速创建一个 UIColor 对象，更多创建的宏可查看 UIColor+QMUI.h
#define UIColorMake(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorMakeWithRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]
#define UIColorHexMake(hex) [UIColor sc_colorWithRGB:hex]
#define UIColorHexAMake(hex,a) [UIColor sc_colorWithRGB:hex alpha:a]

// 用两个Color生成一张左右对称的渐变色图片
#define UIImageGradientMake(color1,color2) [UIImage sc_gradientColorImageWithSize:CGSizeMake(1, 1) startPoint:SCUIImageGradientPointLeft endPoint:SCUIImageGradientPointRight colors:@[color1,color2] locations:nil]


// 彩色
#define ZXCOLOR_RED          UIColorHexMake(0xE0554C) // 红
#define ZXCOLOR_YELLOW       UIColorHexMake(0xFCB542) // 黄
#define ZXCOLOR_BLUE         UIColorHexMake(0x3D44AB) // 深蓝
#define ZXCOLOR_BLUE_LIGHT   UIColorHexMake(0x2CABCE) // 湖蓝
#define ZXCOLOR_WHITE        [UIColor whiteColor]     // 白
#define ZXCOLOR_TRANSLUCENT  UIColorHexAMake(0x000000,0.3)  // 半透明
#define ZXCOLOR_CLEAR        [UIColor clearColor]     // 透明
#define ZXCOLOR_BLACK        [UIColor blackColor]     // 黑

#define ZXCOLOR_PINK         UIColorHexMake(0xFC7065) // 粉红
#define ZXCOLOR_RED_LIGHT    UIColorHexMake(0xFBEEED) // 红-浅色
#define ZXCOLOR_GREEN_LIGHT    UIColorHexMake(0x71D227) // 绿-微信



// 文字色
#define ZXCOLOR_FONT_333 UIColorHexMake(0x333333) // 主要文字
#define ZXCOLOR_FONT_666 UIColorHexMake(0x666666) // 页面说明文字
#define ZXCOLOR_FONT_999 UIColorHexMake(0x999999) // 辅助次要文字

/// 背景色-白色
#define ZXCOLOR_WHITE_EEE UIColorHexMake(0xEEEEEE) // 背景色
#define ZXCOLOR_WHITE_FFF UIColorHexMake(0xF8F8F8) // 背景色
#define ZXCOLOR_WHITE_F8  UIColorHexMake(0xF8F8F8) // 背景色
#define ZXCOLOR_GRAY_BG1  UIColorHexMake(0xF4F4F4) // 主页背景色（灰）
#define ZXCOLOR_GRAY_BD  UIColorHexMake(0xBDBDBD) // Icon灰色



//// 渐变色生成图片
//#define ZXIMAGE_GRADINT_PURPLE  UIImageGradientMake(UIColorHexMake(0x8700FF),UIColorHexMake(0xB800E1)) // 渐变紫
//
//// 渐变色数组
//#define ZX_GRADINT_PURPLE_ARRAY @[UIColorHexMake(0x8700FF),UIColorHexMake(0xB800E1)]



/// 字体相关的宏，用于快速创建一个字体对象，更多创建宏可查看 UIFont+QMUI.h
#define UIFontMake(size) [UIFont systemFontOfSize:size]
#define UIFontItalicMake(size) [UIFont italicSystemFontOfSize:size] /// 斜体只对数字和字母有效，中文无效
#define UIFontBoldMake(size) [UIFont boldSystemFontOfSize:size]


/// 字号
#define ZXFONT_22  UIFontMake(22)
#define ZXFONT_20  UIFontMake(20)
#define ZXFONT_18  UIFontMake(18)
#define ZXFONT_17  UIFontMake(17)
#define ZXFONT_16  UIFontMake(16)
#define ZXFONT_14  UIFontMake(14)
#define ZXFONT_13  UIFontMake(13)
#define ZXFONT_12  UIFontMake(12)
#define ZXFONT_11  UIFontMake(11)
#define ZXFONT_10  UIFontMake(10)
#define ZXFONT_9   UIFontMake(9)

#define ZXICONFONT(s) [UIFont fontWithName:@"iconfont" size:s]
//#define ZXCOLICONFONT(s) [UIFont fontWithName:@"collectionFont" size:s]

#define ZXFONT_22_B  UIFontBoldMake(22)
#define ZXFONT_20_B  UIFontBoldMake(22)
#define ZXFONT_17_B  UIFontBoldMake(17)
#define ZXFONT_16_B  UIFontBoldMake(16)
#define ZXFONT_14_B  UIFontBoldMake(14)
#define ZXFONT_13_B  UIFontBoldMake(13)
#define ZXFONT_12_B  UIFontBoldMake(12)
#define ZXFONT_11_B  UIFontBoldMake(11)
#define ZXFONT_10_B  UIFontBoldMake(10)
#define ZXFONT_9_B   UIFontBoldMake(9)

#define ZXFONT_22_L  UIFontItalicMake(22)
#define ZXFONT_20_L  UIFontItalicMake(20)
#define ZXFONT_17_L  UIFontItalicMake(17)
#define ZXFONT_16_L  UIFontItalicMake(16)
#define ZXFONT_14_L  UIFontItalicMake(14)
#define ZXFONT_13_L  UIFontItalicMake(13)
#define ZXFONT_12_L  UIFontItalicMake(12)
#define ZXFONT_11_L  UIFontItalicMake(11)
#define ZXFONT_10_L  UIFontItalicMake(10)
#define ZXFONT_9_L   UIFontItalicMake(9)

#define ZXFONT_ICON_22  [UIFont fontWithName:@"iconfont" size:22]
#define ZXFONT_ICON_20  [UIFont fontWithName:@"iconfont" size:20]
#define ZXFONT_ICON_19  [UIFont fontWithName:@"iconfont" size:19]
#define ZXFONT_ICON_18  [UIFont fontWithName:@"iconfont" size:18]
#define ZXFONT_ICON_17  [UIFont fontWithName:@"iconfont" size:17]
#define ZXFONT_ICON_16  [UIFont fontWithName:@"iconfont" size:16]
#define ZXFONT_ICON_15  [UIFont fontWithName:@"iconfont" size:15]
#define ZXFONT_ICON_14  [UIFont fontWithName:@"iconfont" size:14]
#define ZXFONT_ICON_13  [UIFont fontWithName:@"iconfont" size:13]
#define ZXFONT_ICON_12  [UIFont fontWithName:@"iconfont" size:12]
#define ZXFONT_ICON_11  [UIFont fontWithName:@"iconfont" size:11]
#define ZXFONT_ICON_10  [UIFont fontWithName:@"iconfont" size:10]
#define ZXFONT_ICON_8  [UIFont fontWithName:@"iconfont" size:9]

#endif /* ZXUINormal_h */
