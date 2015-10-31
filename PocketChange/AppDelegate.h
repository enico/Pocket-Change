//
//  AppDelegate.h
//  PocketChange
//
//  Created by Erica Nico on 3/30/14.
//  Copyright (c) 2014 Erica Roy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RevMobAds/RevMobAds.h>

@class iRateViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) IBOutlet iRateViewController *viewController;

@end
