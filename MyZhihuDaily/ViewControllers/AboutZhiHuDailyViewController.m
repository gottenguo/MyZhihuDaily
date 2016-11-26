//
//  AboutZhiHuDailyViewController.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/16.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "AboutZhiHuDailyViewController.h"
#import "ViewDeck.h"
#import "DKNightVersion.h"
#import "ZhiHuDailyPageViewController.h"

@interface AboutZhiHuDailyViewController ()

@end

@implementation AboutZhiHuDailyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.hidesBackButton = YES;
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(Ref);
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    [self setLeftItem];
    [self setTitleView];
    [self setCententView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushHomeView)
                                                 name:@"pushHomeView" object:nil];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pushHomeView" object:nil];
}

-(void)setLeftItem{
    
    UIBarButtonItem *leftButtom = [UIBarButtonItem initWithLetfItem:@"Nav_Open" highlightedImage:@"Nav_Open_Highlight" action:self targer:@selector(openLeftView)];
    self.navigationItem.leftBarButtonItem = leftButtom;
}

-(void)openLeftView{
    
    [self.tabBarController.viewDeckController openLeftViewAnimated:YES];
}

-(void)pushHomeView{

    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)setTitleView {
    
    UILabel *titleLabel = [[UILabel alloc]init];
    
    titleLabel.text = @"关于";
    [titleLabel sizeToFit];
    titleLabel.font = MyFont(20);
    titleLabel.textColor = RGBA(100, 100, 100, 1);
    
    self.navigationItem.titleView = titleLabel;
}

-(void)setCententView{
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    UIImage *iconImage = [UIImage imageNamed:@"ZhiHuDdaily_Logo"];
    iconImageView.frame = CGRectMake((self.view.frame.size.width-iconImage.size.width)/2-10, 60, 80, 80);
    iconImageView.image = iconImage;
    iconImageView.layer.masksToBounds =YES;
    iconImageView.layer.cornerRadius =20;
    
    UIImageView *downloadImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"QR_Code"]];
    downloadImageView.frame = CGRectMake(iconImageView.frame.origin.x+120, 60, 80, 80);
    
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.text = ZhiHuDailySummary;
    label.frame = CGRectMake(20, iconImageView.frame.origin.y+110, self.view.frame.size.width-30, 250);
    label.textColor = RGBA(100, 100, 100, 1);
    label.font = MyFont(17);
    
    UIImageView *bottomView = [[UIImageView alloc]init];
    UIImage *bottomiImage = [UIImage imageNamed:@"ZhiHuDdaily_Cartoon"];
    bottomView.image = bottomiImage;
    bottomView.userInteractionEnabled = YES;
    [bottomView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ZhiHuDailyPage)]];
    bottomView.frame = CGRectMake((self.view.frame.size.width-bottomiImage.size.width)/2+10, self.view.frame.size.height-135, 120, 37);
    
    [self.view addSubview:label];
    [self.view addSubview:bottomView];
    [self.view addSubview:iconImageView];
    [self.view addSubview:downloadImageView];
}

-(void)ZhiHuDailyPage{
    
    ZhiHuDailyPageViewController *zhiHuDailyPageViewController = [[ZhiHuDailyPageViewController alloc]init];
    zhiHuDailyPageViewController.url = ZhiHuDailyURL;
    
    [self.navigationController pushViewController:zhiHuDailyPageViewController animated:YES];
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
