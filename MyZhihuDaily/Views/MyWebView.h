//
//  MyWebView.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/2.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContentModel;

@interface MyWebView : UIWebView

-(void)setUpHeaderView:(ContentModel *) contentModel;

@end
