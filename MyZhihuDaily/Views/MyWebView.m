//
//  MyWebView.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/2.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "MyWebView.h"
#import "ContentModel.h"
#import "DKNightVersion.h"
#import "UIImageView+WebCache.h"

@implementation MyWebView

-(void)setUpHeaderView:(ContentModel *) contentModel{
    
    UIImageView *headerImageView = [[UIImageView alloc]init];
    [headerImageView sd_setImageWithURL:[NSURL URLWithString:contentModel.image] placeholderImage:nil];
    headerImageView.frame = CGRectMake(0, 0, self.frame.size.width, 204);
    
    UIImageView *bottomMask = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Image_Mask"]];
    bottomMask.frame = CGRectMake(0, 100, headerImageView.frame.size.width, 104);
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = contentModel.title;
    [titleLabel setTextColor:[UIColor whiteColor]];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.frame = CGRectMake(15, 130, headerImageView.frame.size.width-15, 50);
    
    UILabel *imageSource = [[UILabel alloc]init];
    imageSource.text = contentModel.image_source;
    [imageSource setTextColor:[UIColor whiteColor]];
    imageSource.textAlignment = NSTextAlignmentRight;
    imageSource.font = [UIFont systemFontOfSize:10];
    imageSource.frame = CGRectMake(0, 170, headerImageView.frame.size.width-10, 20);
    
    [headerImageView addSubview:bottomMask];
    [headerImageView addSubview:titleLabel];
    [headerImageView addSubview:imageSource];
    [self.scrollView addSubview:headerImageView];
    self.scrollView.dk_backgroundColorPicker = DKColorPickerWithKey(Ref);
    
    NSString *HTMLString = MyZhiHuHTML(contentModel.css[0],contentModel.body);
    
    [self loadHTMLString:HTMLString baseURL:nil];
    [self setBackgroundColor:[UIColor whiteColor]];
}

@end
