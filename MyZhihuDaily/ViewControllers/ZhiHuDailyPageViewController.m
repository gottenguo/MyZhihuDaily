//
//  ZhiHuDailyPageViewController.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/23.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "ZhiHuDailyPageViewController.h"

@interface ZhiHuDailyPageViewController ()

@end

@implementation ZhiHuDailyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"下载";
    [titleLabel sizeToFit];
    titleLabel.font = MyFont(20);
    titleLabel.textColor = RGBA(100, 100, 100, 1);
    self.navigationItem.titleView = titleLabel;
    
    self.webView = [[UIWebView alloc]init];
    CGRect frame = self.view.frame;
    frame.size.height -= 59;
    self.webView.frame = frame;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:self.webView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.tabBarController.viewDeckController.enabled = NO;

    self.navigationController.navigationBar.tintColor = RGBA(100, 100, 100, 1);
	[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    self.tabBarController.viewDeckController.enabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
