//
//  UIView+MaskingLayer.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/23.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MaskingLayer)

typedef enum {
    AnimationTopDown,
    AnimationFromLeftToRight,
} AnimationDirectionType;


//给UIWebBrowserView添加遮盖层
-(void)addMaskingLayer:(UIView *)view Tag:(CGFloat) Tag;
//删除遮盖层动画方向分为自上而下，从左至右
-(void)removeMaskingLayer:(UIView *)view Tag:(CGFloat) Tag AnimationDirection:(AnimationDirectionType) AnimationDirectionType;

@end
