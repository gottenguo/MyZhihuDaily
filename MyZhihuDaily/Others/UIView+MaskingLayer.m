//
//  UIView+MaskingLayer.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/23.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "UIView+MaskingLayer.h"

@implementation UIView (MaskingLayer)

-(void)addMaskingLayer:(UIView *)view Tag:(CGFloat) Tag{
    
    UIView *maskingView = [[UIView alloc]init];
    maskingView.dk_backgroundColorPicker = DKColorPickerWithKey(Ref);
    maskingView.frame = view.frame;
    maskingView.tag = Tag;
    [view addSubview:maskingView];
}

-(void)removeMaskingLayer:(UIView *)view Tag:(CGFloat) Tag AnimationDirection:(AnimationDirectionType) AnimationDirectionType{
    
    UIView *maskingView = [view viewWithTag:Tag];
    [UIView animateWithDuration:0.2
                     animations:^{
                         CGPoint point = maskingView.center;
                         if(AnimationDirectionType == AnimationTopDown){
                            point.y += 500;
                         }else{
                            point.x += 500;
                         }
                         [maskingView setCenter:point];
                     }
                     completion:^(BOOL finished) {
                         [maskingView removeFromSuperview];
                     }];
    
}

@end
