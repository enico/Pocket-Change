//
//  AppDelegate.m
//  PocketChange
//
//  Created by Erica Nico on 3/30/14.
//  Copyright (c) 2014 Appinnovative. All rights reserved.
//

#import "AppDelegate.h"
#import <RevMobAds/RevMobAds.h>
#import "iRateViewController.h"
#import "iRate.h"

@implementation AppDelegate

+ (void)initialize
{
    //set the bundle ID. normally you wouldn't need to do this
    //as it is picked up automatically from your Info.plist file
    //but we want to test with an app that's actually on the store
    [iRate sharedInstance].applicationBundleID = @"com.appinnovative.PocketChange";
	[iRate sharedInstance].onlyPromptIfLatestVersion = NO;
    
    //set events count (default is 10)
    [iRate sharedInstance].eventsUntilPrompt = 3;
    
    //disable minimum day limit and reminder periods
    [iRate sharedInstance].daysUntilPrompt = 0;
    [iRate sharedInstance].remindPeriod = 2;
}
- (void)iRateUserDidRequestReminderToRateApp
{
    //reset event count after every 5 (for demo purposes)
    [iRate sharedInstance].eventCount = 5;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //adding a custom image to the navigation bar
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"header.png"] forBarMetrics:UIBarMetricsDefault];
     [RevMobAds startSessionWithAppID:@"5341d7c61e69f10113d24f9e"];
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
   // [RevMobAds session].testingMode = RevMobAdsTestingModeWithAds;
   
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
