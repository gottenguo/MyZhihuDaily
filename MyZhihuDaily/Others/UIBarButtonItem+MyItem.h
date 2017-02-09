//
//  UIBarButtonItem+MyItem.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/19.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MyItem)

+(instancetype)initWithLetfItem:(NSString *)normalImage highlightedImage:(NSString *) highlightedImage action:(id) action targer:(SEL) targer;

@end
