//
//  UIBarButtonItem+MyItem.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/19.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "UIBarButtonItem+MyItem.h"

@implementation UIBarButtonItem (MyItem)

+(instancetype)initWithLetfItem:(NSString *)normalImage highlightedImage:(NSString *) highlightedImage action:(id) action targer:(SEL) targer{
    
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [button addTarget:action action:targer forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
