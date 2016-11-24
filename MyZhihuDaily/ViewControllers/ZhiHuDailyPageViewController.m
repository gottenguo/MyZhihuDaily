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
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:self.webView];
    
    self.nightVersionManager = [DKNightVersionManager sharedManager];
    self.webView.dk_backgroundColorPicker = DKColorPickerWithKey(Ref);
    self.webView.scrollView.dk_backgroundColorPicker = DKColorPickerWithKey(Ref);
    
    if([self.nightVersionManager.themeVersion isEqualToString:@"NIGHT"])
        [self.view addMaskingLayer:self.webView Tag:9999];
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

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{

    if([self.nightVersionManager.themeVersion isEqualToString:@"NIGHT"]){
        [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('h1')[0].style.color='#c3c3c3'"];
        [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#383838'"];
        [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('container-fixed-width main-content')[0].style.color='#c3c3c3'"];
        
#warning BigBUG
        [self.view removeMaskingLayer:self.webView Tag:9999 AnimationDirection:AnimationFromLeftToRight];
    }
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
