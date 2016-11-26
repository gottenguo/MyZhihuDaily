//  MyClearCacheCell.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/2.
//  Copyright © 2016年 郭三涂. All rights reserved.


#import "MyClearCacheCell.h"
#import "SDImageCache.h"
#import "MBProgressHUD.h"

//缓存路径
#define XMGGustomCacheFile [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"default"]

@implementation MyClearCacheCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        loadingView.color = [UIColor whiteColor];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        self.textLabel.text = @"清除缓存";
        self.userInteractionEnabled = NO;

//        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NSThread sleepForTimeInterval:5.0];
            unsigned long long  size  =XMGGustomCacheFile.fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            if(self == nil) return;
            NSString *textSize = nil;
            if(size >= pow(10, 9)){
                textSize = [NSString stringWithFormat:@"%.2fGB",size/pow(10,9)];
            }else if(size >= pow(10, 6)){
                textSize = [NSString stringWithFormat:@"%.2fMB",size/pow(10,6)];
            }else if(size >= pow(10, 3)){
                textSize = [NSString stringWithFormat:@"%.2fKB",size/pow(10,3)];
            }else{
                textSize = [NSString stringWithFormat:@"%zdB",size];
            }

            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)",textSize];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textLabel.text = text;
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            });
            [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cleraCache)]];
           
            self.userInteractionEnabled = YES;
        });
    }

    return self;
}

-(void)cleraCache{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.superview animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"正在清除缓存...";
    hud.margin = 10.f;
    
    [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr removeItemAtPath:XMGGustomCacheFile error:nil];
            [mgr createDirectoryAtPath:XMGGustomCacheFile withIntermediateDirectories:YES attributes:nil error:nil];

            [NSThread sleepForTimeInterval:3.0];
            dispatch_async(dispatch_get_main_queue(), ^{
                [hud hide:YES];
                self.textLabel.text=@"清除缓存";
            });
        });
    }];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    UIActivityIndicatorView *loadView = (UIActivityIndicatorView *) self.accessoryView;
    [loadView startAnimating];
}

@end
