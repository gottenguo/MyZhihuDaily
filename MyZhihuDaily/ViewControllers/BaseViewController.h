//
//  BaseViewController.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/5.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ViewDeck/ViewDeck.h>
#import <AFNetworking/AFNetworking.h>
#import <DKNightVersion/DKNightVersion.h>
#import <MJExtension.h>
#import "MJRefresh.h"
#import "MyWebView.h"
#import "BullshitModel.h"
#import "ListDataModel.h"
#import "MBProgressHUD.h"
#import "MyRefreshFooter.h"
#import "MyRefreshHeader.h"
#import "AboutZhiHuDailyViewController.h"

@interface BaseViewController : UIViewController <UIWebViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic)NSDate *datenow;
@property (strong, nonatomic)MyWebView *webView;
@property (strong, nonatomic)DKNightVersionManager *nightVersionManager;
@property (strong, nonatomic)NSMutableArray< ListDataModel*> *listDataModels;

-(NSString *)type;

@end
