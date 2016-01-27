//
//  AppDelegate.m
//  SeparateUIStory
//
//  Created by wangfei on 16/1/26.
//  Copyright © 2016年 wanghu. All rights reserved.
//

#import "AppDelegate.h"
#import "SPRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //特别进行说明这是不要侧滑的主体框架1
//        self.window = [[UIWindow alloc]init];
//        self.window.frame = [UIScreen mainScreen].bounds;
//        [self.window setRootViewController:[self setupTabController]];
//        [self.window makeKeyAndVisible];
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window.rootViewController = [main instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    return YES;
}
#  pragma mark 特别进行说明这是不要侧滑的主体框架1
-(CYLTabBarController *)setupTabController
{
    self.taBarController=[[CYLTabBarController alloc]init];
    UIViewController  *home=[[UIStoryboard storyboardWithName:@"Home" bundle:nil]instantiateInitialViewController];
     UIViewController  *Customer=[[UIStoryboard storyboardWithName:@"Customer" bundle:nil]instantiateInitialViewController];
    UIViewController  *Pay=[[UIStoryboard storyboardWithName:@"Pay" bundle:nil]instantiateInitialViewController];
     UIViewController  *my=[[UIStoryboard storyboardWithName:@"My" bundle:nil]instantiateInitialViewController];
    NSArray *tabBarItemsAttributes = @[
                                       @{
                                           CYLTabBarItemTitle : @"首页",
                                           CYLTabBarItemImage : @"HomePage_normal.png",
                                           CYLTabBarItemSelectedImage : @"HomePage_highlight.png",
                                           },
                                       @{
                                           CYLTabBarItemTitle : @"客户",
                                           CYLTabBarItemImage : @"Customer_normal.png",
                                           CYLTabBarItemSelectedImage : @"Customer_highlight.png",
                                           },
                                       @{
                                           CYLTabBarItemTitle : @"支付",
                                           CYLTabBarItemImage : @"Pay_normal.png",
                                           CYLTabBarItemSelectedImage : @"Pay_highlight.png",
                                           },
                                       @{
                                           CYLTabBarItemTitle : @"我",
                                           CYLTabBarItemImage : @"My_normal.png",
                                           CYLTabBarItemSelectedImage : @"My_highlight.png"
                                           },
                                       
                                       ];
    
    self.taBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    [self.taBarController setViewControllers:@[home, Customer, Pay, my]];
    return self.taBarController;


}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo{
    
    SPRootViewController *SPRootViewC = (SPRootViewController *)self.window.rootViewController;
    UITabBarController *tabBar = (UITabBarController *)SPRootViewC.contentViewController;
    
    tabBar.selectedIndex = 1;
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification{
    
    SPRootViewController *SPRootViewC = (SPRootViewController *)self.window.rootViewController;
    UITabBarController *tabbar = (UITabBarController *) SPRootViewC.contentViewController;
    
    tabbar.selectedIndex = 1;
    
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
