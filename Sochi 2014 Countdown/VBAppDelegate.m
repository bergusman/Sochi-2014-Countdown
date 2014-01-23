//
//  VBAppDelegate.m
//  Sochi 2014 Countdown
//
//  Created by Vitaly Berg on 24/01/14.
//  Copyright (c) 2014 Vitaly Berg. All rights reserved.
//

#import "VBAppDelegate.h"

#import "VBMainViewController.h"

@implementation VBAppDelegate

#pragma mark - Setups

- (void)setupCrashlytics {
    
}

- (void)setupFlurry {
    
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupCrashlytics];
    [self setupFlurry];
    
    VBMainViewController *mainVC = [[VBMainViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
