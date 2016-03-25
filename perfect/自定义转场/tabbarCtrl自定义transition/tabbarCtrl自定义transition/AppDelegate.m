//
//  AppDelegate.m
//  tabbarCtrl自定义transition
//
//  Created by zhanghong on 16/2/25.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHTabbarCtrl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [[ZHTabbarCtrl alloc] init];
    [window makeKeyAndVisible];
    self.window = window;
    
    return YES;
}


@end
