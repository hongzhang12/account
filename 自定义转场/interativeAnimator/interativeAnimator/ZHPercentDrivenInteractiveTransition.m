//
//  ZHPercentDrivenInteractiveTransition.m
//  interativeAnimator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHPercentDrivenInteractiveTransition.h"

@interface ZHPercentDrivenInteractiveTransition()

@property (nonatomic ,strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic ,assign) BOOL isPresented;
@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation ZHPercentDrivenInteractiveTransition

- (instancetype)initWithPanGesture:(UIPanGestureRecognizer *)panGesture andIsPresented:(BOOL)isPresented{
    
    if (self = [super init]) {
        
        self.isPresented = isPresented;
        self.panGesture = panGesture;
        [self.panGesture addTarget:self action:@selector(panGestureUpdated:)];
    }
    
    return self;
}


- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    self.transitionContext = transitionContext;
    [super startInteractiveTransition:transitionContext];
}

- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)gesture
{
        CGFloat x = [gesture translationInView:gesture.view].x;
    
        if (self.isPresented == NO) x = -x;
    
        if (x < 0) x = 0;
        if (x > 100) x = 100;
    
    return x/100;
}

- (void)panGestureUpdated:(UIPanGestureRecognizer *)panGesture{
    
    UIGestureRecognizerState state = panGesture.state;
//    NSLog(@"%@",NSStringFromCGPoint([panGesture translationInView:panGesture.view]));
    

    
    CGFloat percent = [self percentForGesture:panGesture];
    
    NSLog(@"%f", percent);
    
    switch (state) {
        case UIGestureRecognizerStateChanged:
            //NSLog(@"UIGestureRecognizerStateChanged");
            [self updateInteractiveTransition:percent];
            break;
            
        case UIGestureRecognizerStateEnded:
            
            [self finishInteractiveTransition];
//            self.panGesture = nil;
//            [self.panGesture removeTarget:self action:@selector(panGestureUpdated:)];
            
            break;
            
        case UIGestureRecognizerStateCancelled:
            
            [self cancelInteractiveTransition];
//            self.panGesture = nil;
//            [self.panGesture removeTarget:self action:@selector(panGestureUpdated:)];
            break;
            
        default:
            break;
    }
}

@end
