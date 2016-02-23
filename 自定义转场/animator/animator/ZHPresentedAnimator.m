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
    
    return 0.75;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    toView.frame = CGRectMake(100, 100, 200, 200);
    toView.alpha = 0.1;
    toView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    // 必须把即将呈现的view添加到containerView
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        toView.alpha = 1;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        // 动画完成后必须调用这个方法
        [transitionContext completeTransition:YES];
    }];
}

@end
