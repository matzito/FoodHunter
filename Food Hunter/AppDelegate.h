//
//  AppDelegate.h
//  Food Hunter
//
//  Created by Matz on 9/9/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate> 

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;


@end
