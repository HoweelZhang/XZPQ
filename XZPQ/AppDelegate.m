//
//  AppDelegate.m
//  XZPQ
//
//  Created by Howeel on 2018/8/15.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "AppDelegate.h"
#import "QMUILog.h"
#import "homeViewController.h"
#import "mineViewController.h"
#import "TabBarViewController.h"
#import <AFNetworking.h>
#import "marsonyDemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initWindowWithTabBarController];
//    [self initIntroduceViewController];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initWindowWithTabBarController {
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    TabBarViewController *tabbar = [[TabBarViewController alloc]init];
    self.window.rootViewController = tabbar;
    
//    self.window.rootViewControlleir = [[UINavigationController alloc]initWithRootViewController:[NSClassFromString(@"JKTabBarViewControllerDEMO") new]];
    [self.window makeKeyAndVisible];
}


- (void)initIntroduceViewController {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *build = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    QMUILog(@"appDelegate",@"version:%@,build:%@",version,build);
}
@end
