
//
//  ZHTransitionDelegate.m
//  animator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHTransitionDelegate.h"
#import "ZHPresentedAnimator.h"
#import "ZHDismissedAnimator.h"
#import "ZHPercentDrivenInteractiveTransition.h"

@implementation ZHTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return  [[ZHPresentedAnimator alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [[ZHDismissedAnimator alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    
    return [[ZHPercentDrivenInteractiveTransition alloc] initWithPanGesture:self.panGesture andIsPresented:YES];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    
    return [[ZHPercentDrivenInteractiveTransition alloc] initWithPanGesture:self.panGesture andIsPresented:NO];
}

@end
