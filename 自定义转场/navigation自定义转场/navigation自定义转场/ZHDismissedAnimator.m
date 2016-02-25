//
//  ZHDismissedAnimator.m
//  animator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHDismissedAnimator.h"

@implementation ZHDismissedAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // toView和toViewController在presented和dismissed时都是即将呈现在屏幕上的那个。
    // 在presented时，fromView是PresentedView,toView是presentingView。
    // 在dismissed时，fromView是presentingView,toView是PresentedView。
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
#warning 与Modal不同，这里必须将toView添加到containerView
    [containerView insertSubview:toView belowSubview:fromView];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        
        BOOL iscancelled = [transitionContext transitionWasCancelled];
        
        if (!iscancelled) {
            
            // 将退下的View移除。取消操作的情况下才需要移除，否则将出现屏幕不能响应的情况
            [fromView removeFromSuperview];
        }
        
        // 动画结束必须调用
        [transitionContext completeTransition:!iscancelled];
    }];
}

@end
