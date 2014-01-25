//
//  VBAppDelegate.m
//  Sochi 2014 Countdown
//
//  Created by Vitaly Berg on 24/01/14.
//  Copyright (c) 2014 Vitaly Berg. All rights reserved.
//

#import "VBAppDelegate.h"

#import "VBMainViewController.h"

#import <Crashlytics/Crashlytics.h>
#import <FlurrySDK/Flurry.h>

@implementation VBAppDelegate

#pragma mark - Setups

- (void)setupCrashlytics {
    [Crashlytics startWithAPIKey:@"43bdaee89a9a66824f56a6da19395009058a1b34"];
}

- (void)setupFlurry {
    [Flurry startSession:@""];
}

- (void)setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
}

- (void)setupMainVC {
    VBMainViewController *mainVC = [[VBMainViewController alloc] init];
    self.window.rootViewController = mainVC;
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupCrashlytics];
    [self setupFlurry];
    [self setupWindow];
    [self setupMainVC];
    return YES;
}

@end
