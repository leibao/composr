//
//  AppDelegate.m
//  composr
//
//  Created by Lei Bao on 6/17/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "AppDelegate.h"
#import "ListViewController.h"
#import "ComposeSubjectToViewController.h"
#import "ChooseTypeViewController.h"
#import "TabViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // List view
//    ListViewController *listvc = [[ListViewController alloc] init];
//    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:listvc];
//    self.window.rootViewController = nvc;
//    nvc.navigationBar.barTintColor = [UIColor colorWithRed:171.0f/255.0f green:220.0f/255.0f blue:214.0f/255.0f alpha:0.9f];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    //tab view
    TabViewController *tvc = [[TabViewController alloc] init];
    self.window.rootViewController = tvc;
    [self.window makeKeyAndVisible];
    
    
    
    // email view
    
//    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.foregroundWindow.rootViewController = [ChooseTypeViewController new];
//    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
//    self.foregroundWindow.hidden = NO;
    


    
    return YES;
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
