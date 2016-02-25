//
//  AppDelegate.m
//  interativeAnimator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHPresentedCtrl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ZHPresentedCtrl alloc] init]];
    [window makeKeyAndVisible];
    self.window = window;
    return YES;
}


@end
