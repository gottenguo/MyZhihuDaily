//
//  MyWebView.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/2.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DKNightVersion/DKNightVersion.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "BullshitModel.h"

@interface MyWebView : UIWebView

-(void)setUpHeaderView:(BullshitModel *) bullshitModel;

@end
