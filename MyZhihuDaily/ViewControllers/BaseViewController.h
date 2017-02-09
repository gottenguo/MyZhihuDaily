//
//  BaseViewController.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/5.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic)NSDate *datenow;
-(NSString *)type;

@end
