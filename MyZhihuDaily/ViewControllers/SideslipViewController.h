//
//  SideslipViewController.h
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/12.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyClearCacheCell.h"
#import "BaseViewController.h"

@interface SideslipViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UISwitch *nigthSwitch;
@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) DKNightVersionManager *nightVersionManager;

@end
