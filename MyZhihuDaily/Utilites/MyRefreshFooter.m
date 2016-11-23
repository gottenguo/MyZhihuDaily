//
//  MyRefreshFooter.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/4.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "MyRefreshFooter.h"

@implementation MyRefreshFooter

-(void)prepare{
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    
    [self setTitle:@"载入下一篇" forState:MJRefreshStateIdle];
    [self setTitle:@"载入下一篇" forState:MJRefreshStatePulling];
    [self setTitle:@"载入下一篇" forState:MJRefreshStateRefreshing];
}

@end
