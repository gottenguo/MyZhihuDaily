//
//  SideslipViewController.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/12.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "SideslipViewController.h"

static NSString * const MyCleraCacheCellid = @"MyClearCacheCell";

@implementation SideslipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.frame = CGRectMake(0, 59, 250, 400);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = RGBA(45, 45, 45, 1);
    self.view.backgroundColor = self.tableView.backgroundColor;
    [self.tableView registerClass:[MyClearCacheCell class] forCellReuseIdentifier:MyCleraCacheCellid];
    [self.view addSubview:self.tableView];
    
    self.nigthSwitch = [[UISwitch alloc]init];
    self.nightVersionManager = [DKNightVersionManager sharedManager];
    if([self.nightVersionManager.themeVersion isEqualToString:@"NIGHT"])
        self.nigthSwitch.on = YES;    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)nigthSwitchAction:(UISwitch *) Switch{
    
    if(Switch.on){
        self.nightVersionManager.themeVersion = DKThemeVersionNight;
    }else{
        self.nightVersionManager.themeVersion = DKThemeVersionNormal;
    }
}

#pragma mark UITableViewDelegate & DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 60;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"Account_Avatar"];
    imageView.frame = CGRectMake(14, 10, 38, 38);
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"gottenGuo";
    label.font = MyFont(17);
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(68, 10, 100, 40);
    
    [view addSubview:imageView];
    [view addSubview:label];
    
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString  *ID = @"leftMenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if(indexPath.row == 0){
        
        cell.textLabel.text = @"首页";
        cell.imageView.image = [UIImage imageNamed:@"Home"];
        
    } else if(indexPath.row == 1){
    
        self.nigthSwitch.transform = CGAffineTransformMakeScale(0.7, 0.7);
        self.nigthSwitch.frame = CGRectMake(70, 10, 0, 0);
        [self.nigthSwitch addTarget:self action:@selector(nigthSwitchAction:) forControlEvents:UIControlEventValueChanged];
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        view.frame = CGRectMake(0, 0, 100, 40);
        [view addSubview:self.nigthSwitch];
        
        cell.accessoryView = view;
        cell.textLabel.text = @"夜间模式";
        cell.imageView.image = [UIImage imageNamed:@"Night"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }else if (indexPath.row == 2){
        
        cell = [tableView dequeueReusableCellWithIdentifier:MyCleraCacheCellid];
        cell.imageView.image = [UIImage imageNamed:@"Setting"];
        
    }else if (indexPath.row == 3) {
        
        cell.textLabel.text = @"关于知乎";
        cell.imageView.image = [UIImage imageNamed:@"Follow"];
        
    }

    UIView *cellColorView = [[UIView alloc] initWithFrame:cell.contentView.frame];
    cellColorView.backgroundColor = RGBA(42, 42, 42 , 1);
    cell.selectedBackgroundView = cellColorView;
    cell.backgroundColor = self.tableView.backgroundColor;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = MyFont(17);
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushHomeView" object:nil];
        [self.viewDeckController closeLeftViewAnimated:YES];
    }else if (indexPath.row == 3){
    
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushAboutZhiHuDaily" object:nil];
        [self.viewDeckController closeLeftViewAnimated:YES];
    }
}
@end
