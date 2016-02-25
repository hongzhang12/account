//
//  ZHTransitionDelegate.h
//  animator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZHTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic ,strong) UIPanGestureRecognizer *panGesture;

@end
