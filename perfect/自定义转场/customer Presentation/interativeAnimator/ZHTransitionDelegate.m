
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
#import "ZHPresentationController.h"

@implementation ZHTransitionDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    return [[ZHPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return  [[ZHPresentedAnimator alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [[ZHDismissedAnimator alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    
    if (self.panGesture) {
        
        return [[ZHPercentDrivenInteractiveTransition alloc] initWithPanGesture:self.panGesture andIsPresented:YES];
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    
    if (self.panGesture) {
        
        return [[ZHPercentDrivenInteractiveTransition alloc] initWithPanGesture:self.panGesture andIsPresented:NO];
    }
    return nil;
}

@end
