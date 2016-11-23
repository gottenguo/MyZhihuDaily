//
//  BullshitModel.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/10/29.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BullshitModel : NSObject

@property (strong, nonatomic) NSString* body;
@property (strong, nonatomic) NSString* image_source;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* image;
@property (strong, nonatomic) NSArray* css;

@end
