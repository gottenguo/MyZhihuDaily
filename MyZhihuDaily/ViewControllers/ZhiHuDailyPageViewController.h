//
//  ZhiHuDailyPageViewController.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/23.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ViewDeck/ViewDeck.h>
#import <DKNightVersion/DKNightVersion.h>

@interface ZhiHuDailyPageViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic)NSString *url;
@property (strong, nonatomic)UIWebView *webView;
@property (strong, nonatomic) DKNightVersionManager *nightVersionManager;

@end
