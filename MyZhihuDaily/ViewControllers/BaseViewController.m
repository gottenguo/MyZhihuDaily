//
//  BaseViewController.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/5.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = [[UIScreen mainScreen]bounds];
    frame.size.height = frame.size.height-59;
    self.view.frame = frame;
    
    self.webView = [[MyWebView alloc]init];
    self.webView.frame = self.view.frame;
    self.webView.delegate = self;
    
    [self.view addSubview:self.webView];
    
    [self setLeftItem];
    [self setTitleView];
    [self setUpRefresh];
    [self LoadAccordingToDate];

    [self.view addMaskingLayer:self.webView.scrollView Tag:8888];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.nightVersionManager = [DKNightVersionManager sharedManager];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notice)
                                                 name:DKNightVersionThemeChangingNotificaiton object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushAboutZhiHuDaily)
                                                 name:@"pushAboutZhiHuDaily" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pushAboutZhiHuDaily" object:nil];
}

-(void)setTitleView{
    
    UILabel *label = [[UILabel alloc]init];
    
    label.text = @"知乎日报";
    [label sizeToFit];
    label.font = MyFont(20);
    label.textColor = RGBA(100, 100, 100, 1);
    self.navigationItem.titleView = label;
}

-(void)setLeftItem{
    
    UIBarButtonItem *leftButtom = [UIBarButtonItem initWithLetfItem:
                                   @"Nav_Open" highlightedImage:@"Nav_Open_Highlight"
                                                             action:self targer:@selector(openLeftView)];
    self.navigationItem.leftBarButtonItem = leftButtom;
}

-(NSString *)type{
    
    return nil;
}

-(void)openLeftView{
    
    [self.tabBarController.viewDeckController openLeftViewAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)notice{
    
    [self.webView.delegate webViewDidFinishLoad:self.webView];
}

-(void)pushAboutZhiHuDaily{
    
    AboutZhiHuDailyViewController *aboutZhiHuDaily = [[AboutZhiHuDailyViewController alloc]init];
    aboutZhiHuDaily.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:aboutZhiHuDaily animated:YES];
}

-(void)setUpRefresh{
    
    self.webView.scrollView.mj_header = [MyRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.webView.scrollView.mj_footer = [MyRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
}

-(void)refreshHeader{
    
    self.datenow = [NSDate dateWithTimeInterval:24*60*60 sinceDate:self.datenow];
    if(((long)[self.datenow timeIntervalSince1970]) >= ((long)[[NSDate date] timeIntervalSince1970])) {
        
        self.datenow = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:self.datenow];
        [self.webView.scrollView.mj_header endRefreshing];

        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide = YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"已是最新数据";
        hud.margin = 10.f;
        [hud hide:YES afterDelay:1.5];
        
        return;
    }
    
    [self LoadAccordingToDate];
}

-(void)refreshFooter{
    
    self.datenow = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:self.datenow];
    
    [self LoadAccordingToDate];
}

-(void)LoadAccordingToDate{
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[self.datenow timeIntervalSince1970]];
    NSString *URLString = MyZhiHu([self type],timeSp);
    [[[AFHTTPSessionManager alloc]init] GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.listDataModels = [ListDataModel mj_objectArrayWithKeyValuesArray:[responseObject valueForKey:@"stories"]];
        if(self.listDataModels){
            [self loadingBullshitModel:self.listDataModels.firstObject.ID];
            [self.webView.scrollView.mj_header endRefreshing];
            [self.webView.scrollView.mj_footer endRefreshing];
            
            [self.view addMaskingLayer:self.webView.scrollView Tag:9999];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.webView.scrollView.mj_header endRefreshing];
        [self.webView.scrollView.mj_footer endRefreshing];
        MyLog(@"RequestError － %@",error);
    }];
}

-(void)loadingBullshitModel:(NSString *)DataID{
    
    NSString *URLString = MyZhiHuDaily(DataID);    
    [[[AFHTTPSessionManager alloc]init] GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BullshitModel *bullshitModel= [BullshitModel mj_objectWithKeyValues:responseObject];
        if(bullshitModel){
            [self.webView setUpHeaderView:bullshitModel];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MyLog(@"RequestError － %@",error);
    }];
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if(navigationType==UIWebViewNavigationTypeLinkClicked) {
        return NO;
    }else {
        return YES;
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    if([self.nightVersionManager.themeVersion isEqualToString:@"NORMAL"]){
        
        [self.webView stringByEvaluatingJavaScriptFromString:
         @"var Question = document.getElementsByClassName('question');for(i=0;i<Question.length;i++){Question.item(i).style.background='#ffffff'}"];
        
        [self.webView stringByEvaluatingJavaScriptFromString:
         @"document.getElementsByClassName('night main-wrap content-wrap')[0].className = 'main-wrap content-wrap';"];
        
    }else if ([self.nightVersionManager.themeVersion isEqualToString:@"NIGHT"]){
        
        [self.webView stringByEvaluatingJavaScriptFromString:
         @"var Question = document.getElementsByClassName('question');for(i=0;i<Question.length;i++){Question.item(i).style.background='#383838'}"];
        
        [self.webView stringByEvaluatingJavaScriptFromString:
         @"document.getElementsByClassName('main-wrap content-wrap')[0].className = 'night main-wrap content-wrap';"];
    }
    
    [self.webView stringByEvaluatingJavaScriptFromString:
     @"var more = document.getElementsByClassName('view-more');for(i=0;i<more.length;i++){more.item(i).style.display = 'none'}"];
    
    [self.webView stringByEvaluatingJavaScriptFromString:
         @"document.documentElement.style.webkitUserSelect='none';"];
    
    [self.webView stringByEvaluatingJavaScriptFromString:
         @"document.documentElement.style.webkitTouchCallout='none';"];
    
    [self.view removeMaskingLayer:self.webView.scrollView Tag:8888 AnimationDirection:AnimationTopDown];
    [self.view removeMaskingLayer:self.webView.scrollView Tag:9999 AnimationDirection:AnimationTopDown];
}

@end
