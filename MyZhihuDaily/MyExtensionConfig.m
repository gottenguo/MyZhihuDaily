//
//  MyExtensionConfig.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/10/26.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "MyExtensionConfig.h"
#import "MJExtension.h"
#import "ListDataModel.h"

@implementation MyExtensionConfig

+(void)load{
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
}

@end
