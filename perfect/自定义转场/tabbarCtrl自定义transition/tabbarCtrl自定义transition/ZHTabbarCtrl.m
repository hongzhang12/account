//
//  ZHTabbarCtrl.m
//  tabbarCtrl自定义transition
//
//  Created by zhanghong on 16/2/25.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHTabbarCtrl.h"
#import "ZHFirstCtrl.h"
#import "ZHSecondCtrl.h"
#import "ZHThreeCtrl.h"
#import "ZHPresentedAnimator.h"
#import "ZHDismissedAnimator.h"

@interface ZHTabbarCtrl()<UITabBarControllerDelegate>

@end

@implementation ZHTabbarCtrl

- (instancetype)init{
    
    if (self == [super init]) {
        
        self.viewControllers = @[[[ZHFirstCtrl alloc] init],
                                 [[ZHSecondCtrl alloc] init],
                                 [[ZHThreeCtrl alloc] init]];
        self.delegate = self;
    }
    
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    NSUInteger fromIndex = [self.viewControllers indexOfObject:fromVC];
    NSUInteger toIndex = [self.viewControllers indexOfObject:toVC];
    
    if (fromIndex > toIndex) {
        
        return [[ZHDismissedAnimator alloc] init];
    }else{
        
        return [[ZHPresentedAnimator alloc] init];
    }
}

@end
