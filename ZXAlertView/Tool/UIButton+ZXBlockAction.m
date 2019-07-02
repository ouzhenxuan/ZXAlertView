//
//  UIButton+ZXBlockAction.m
//  ZXDemo
//
//  Created by AUG on 2018/11/9.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import "UIButton+ZXBlockAction.h"
#import <objc/runtime.h>

static void *ZXActionBlock = "ZXActionBlock";

@implementation UIButton (ZXBlockAction)

- (void)addActionBlock:(ActionBlock)block forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, ZXActionBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:controlEvents];
}
- (void)addActionBlock:(ActionBlock)block {
    [self addActionBlock:block forControlEvents:UIControlEventTouchUpInside];
}
- (void)action:(UIButton *)button {
    ActionBlock actionBlock = (ActionBlock)objc_getAssociatedObject(self, ZXActionBlock);
    if (actionBlock) {
        actionBlock(button);
    }
}
@end
