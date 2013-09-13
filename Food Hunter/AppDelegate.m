//
//  AppDelegate.m
//  Food Hunter
//
//  Created by Matz on 9/9/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import "AppDelegate.h"
#import "AboutViewController.h"
#import "HomeViewController.h"
#import "ShareViewController.h"
#import "MeViewController.h"
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    UIViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    UIViewController *aboutViewControler = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    UIViewController *shareViewControler = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];
    UIViewController *meViewControler = [[MeViewController alloc] initWithNibName:@"MeViewController" bundle:nil];

    
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:shareViewControler];
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:meViewControler];
    
    
 
    navigationController1.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navigationController2.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navigationController3.navigationBar.barStyle = UIBarStyleBlackOpaque;

    self.tabBarController = [[UITabBarController alloc] init] ;
    self.tabBarController.viewControllers = @[navigationController1, navigationController2, navigationController3,aboutViewControler];
    
    
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    [self customizeAppearance];
    return YES;

}


- (void)customizeAppearance
{
    // Create resizable images
    UIImage *gradientTop = [[UIImage imageNamed:@"top"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    UIImage *gradientBot = [[UIImage imageNamed:@"tab"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 220, 0)];

    [[UINavigationBar appearance] setBackgroundImage:gradientTop
                                       forBarMetrics:UIBarMetricsDefault];
    
    [[UITabBar appearance] setBackgroundImage:gradientBot];

    [[UITabBar appearance] setSelectionIndicatorImage:[[UIImage alloc] init]];
    
    [[UITabBarItem appearance]  setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor grayColor]];

  

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
