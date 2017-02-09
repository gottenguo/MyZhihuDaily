//
//  AppDelegate.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/10/26.
//  Copyright © 2016年 郭三涂. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewDeck.h"
#import "DKNightVersion.h"
#import "SideslipViewController.h"
#import "BullshitViewController.h"
#import "SideslipViewController.h"
#import "SmallThingViewController.h"
#import "BigMistakeViewController.h"

@interface AppDelegate()

@property (strong, nonatomic) IIViewDeckController *viewDeckController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    BullshitViewController *bullshit = [[BullshitViewController alloc]init];
    UINavigationController *bullshitNav = [self MyNav];
    [bullshitNav setViewControllers:@[bullshit]];
    
    SmallThingViewController *smallThing = [[SmallThingViewController alloc]init];
    UINavigationController *smallThingNav = [self MyNav];
    [smallThingNav setViewControllers:@[smallThing]];
    
    BigMistakeViewController *bigMistake = [[BigMistakeViewController alloc]init];
    UINavigationController *bigMistakeNav = [self MyNav];
    [bigMistakeNav setViewControllers:@[bigMistake]];
    
    [tabBarController setViewControllers:@[bullshitNav,smallThingNav,bigMistakeNav]];
    tabBarController.tabBar.tintColor = RGBA(107, 165, 126, 1);
    tabBarController.tabBar.dk_barTintColorPicker = DKColorPickerWithKey(BG);
    
    SideslipViewController *leftSideslipViewCor = [[SideslipViewController alloc] init];
    self.viewDeckController = [[IIViewDeckController alloc] initWithCenterViewController:
                                                tabBarController leftViewController:leftSideslipViewCor];
    self.viewDeckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    self.viewDeckController.leftSize = self.window.frame.size.width - (250);
    self.viewDeckController.shadowEnabled = NO;
    
    //去掉NavigationBar底部黑线
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    self.window.rootViewController = self.viewDeckController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(UINavigationController *)MyNav{
    
    UINavigationController *navigationController = [[UINavigationController alloc]init];
    navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithKey(BG);
    navigationController.navigationBar.translucent = NO;
    
    return navigationController;
}

- (UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
