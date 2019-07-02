//
//  UIView+SetRect.m
//  UIView
//
//  Created by JmoVxia on 2016/10/27.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import "UIView+ZXSetRect.h"

@implementation UIView (ZXSetRect)

- (CGPoint)zx_origin {
    
    return self.frame.origin;
}

- (void)setZx_origin:(CGPoint)zx_origin {
    
    CGRect newFrame = self.frame;
    newFrame.origin = zx_origin;
    self.frame      = newFrame;
}

- (CGFloat)zx_x {
    
    return self.frame.origin.x;
}

- (void)setZx_x:(CGFloat)zx_x {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = zx_x;
    self.frame        = newFrame;
}

- (CGFloat)zx_y {
    
    return self.frame.origin.y;
}

- (void)setZx_y:(CGFloat)zx_y {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = zx_y;
    self.frame        = newFrame;
}

- (CGFloat)zx_width {
    
    return CGRectGetWidth(self.bounds);
}

-(void)setZx_width:(CGFloat)zx_width {
    
    CGRect newFrame     = self.frame;
    newFrame.size.width = zx_width;
    self.frame          = newFrame;
}

- (CGFloat)zx_height {
    
    return CGRectGetHeight(self.bounds);
}

-(void)setZx_height:(CGFloat)zx_height {
    
    CGRect newFrame      = self.frame;
    newFrame.size.height = zx_height;
    self.frame           = newFrame;
}

- (CGFloat)zx_top {
    
    return self.frame.origin.y;
}

- (void)setZx_top:(CGFloat)zx_top {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = zx_top;
    self.frame        = newFrame;
}

- (CGFloat)zx_bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZx_bottom:(CGFloat)zx_bottom {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.y = zx_bottom - self.frame.size.height;
    self.frame        = newFrame;
}

- (CGFloat)zx_left {
    
    return self.frame.origin.x;
}

- (void)setZx_left:(CGFloat)zx_left {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = zx_left;
    self.frame        = newFrame;
}

- (CGFloat)zx_right {
    
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZx_right:(CGFloat)zx_right {
    
    CGRect newFrame   = self.frame;
    newFrame.origin.x = zx_right - self.frame.size.width;
    self.frame        = newFrame;
}

- (CGFloat)zx_centerX {
    
    return self.center.x;
}
- (void)setZx_centerX:(CGFloat)zx_centerX {
    
    CGPoint newCenter = self.center;
    newCenter.x       = zx_centerX;
    self.center       = newCenter;
}

- (CGFloat)zx_centerY {
    
    return self.center.y;
}

- (void)setZx_centerY:(CGFloat)zx_centerY {
    
    CGPoint newCenter = self.center;
    newCenter.y       = zx_centerY;
    self.center       = newCenter;
}

- (CGPoint)zx_bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)zx_bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)zx_topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}
- (CGPoint)zx_topLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}



- (CGFloat)zx_middleX {
    
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)zx_middleY {
    
    return CGRectGetHeight(self.bounds) / 2.f;
}

- (CGPoint)zx_middlePoint {
    
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}

- (CGSize)zx_size {
    return self.frame.size;
}

-(void)setZx_size:(CGSize)zx_size {
    CGRect frame = self.frame;
    frame.size = zx_size;
    self.frame = frame;
}

#pragma mark - 设置圆角

- (void)zx_setCornerOnTop:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setCornerOnBottom:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setCornerOnLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setCornerOnRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setCornerOnTopLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerTopLeft
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setCornerOnTopRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerTopRight
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setCornerOnBottomLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerBottomLeft
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setCornerOnBottomRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:UIRectCornerBottomRight
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)zx_setAllCorner:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                          cornerRadius:conner];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end

