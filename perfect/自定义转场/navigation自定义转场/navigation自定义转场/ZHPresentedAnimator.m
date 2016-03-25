//
//  ZHPresentedAnimator.m
//  animator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHPresentedAnimator.h"

@implementation ZHPresentedAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // toView和toViewController在presented和dismissed时都是即将呈现在屏幕上的那个。
    // 在presented时，fromView是PresentedView,toView是presentingView。
    // 在dismissed时，fromView是presentingView,toView是PresentedView。
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView *containerView = [transitionContext containerView];
    
    toView.frame = fromView.bounds;
    toView.alpha = 0.1;
    toView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    // 必须把即将呈现的view添加到containerView
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        toView.alpha = 1;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        // 动画完成后必须调用这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
