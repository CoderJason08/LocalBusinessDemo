//
//  AppDelegate.m
//  0810电商项目
//
//  Created by Jason on 15/8/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "AppDelegate.h"
#import "XLTabBarController.h"
#import "XLNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
//    XLHomeViewController *home = [[XLHomeViewController alloc] init];
//    XLNavigationController *homeNav = [[XLNavigationController alloc] initWithRootViewController:home];
//    
//    XLNewsViewController *news = [[XLNewsViewController alloc] init];
//    XLNavigationController *newsNav = [[XLNavigationController alloc] initWithRootViewController:news];
//    
//    XLCircleViewController *circle = [[XLCircleViewController alloc] init];
//    XLNavigationController *circleNav = [[XLNavigationController alloc] initWithRootViewController:circle];
//
//    XLOursViewController *ours = [[XLOursViewController alloc] init];
//    XLNavigationController *oursNav = [[XLNavigationController alloc] initWithRootViewController:ours];
//    
//    // 占位导航控制器，没有效果，为了让tabBar的按钮数量和自定义的相同。
//    XLNavigationController *blankNav = [[XLNavigationController alloc]initWithRootViewController:[[UIViewController alloc] init]];
    
    XLTabBarController *tabBar = [[XLTabBarController alloc] init];
//    tabBar.viewControllers = @[homeNav,newsNav,circleNav,oursNav,blankNav];
    
    [self.window setRootViewController:tabBar];
    return YES;
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
