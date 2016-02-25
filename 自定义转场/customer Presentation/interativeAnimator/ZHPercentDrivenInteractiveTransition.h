//
//  ZHPercentDrivenInteractiveTransition.h
//  interativeAnimator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition

- (instancetype)initWithPanGesture:(UIPanGestureRecognizer *)panGesture andIsPresented:(BOOL)isPresented;

@end
