
//
//  ZHFirstCtrl.m
//  navigation自定义转场
//
//  Created by zhanghong on 16/2/24.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHFirstCtrl.h"
#import "ZHSecondCtrl.h"
#import "ZHPresentedAnimator.h"
#import "ZHDismissedAnimator.h"
#import "AAPLCheckerboardTransitionAnimator.h"
@interface ZHFirstCtrl()<UINavigationControllerDelegate>

@end

@implementation ZHFirstCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    // 设置navigationController的代理
    self.navigationController.delegate = self;

    [self setNavbar];
}

- (void)setNavbar{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(rightNavbarItemClicked)];
}

- (void)rightNavbarItemClicked{
    
    [self.navigationController pushViewController:[[ZHSecondCtrl alloc] init] animated:YES];
}


// 代理方法，返回transitionAnimator
// 这个方法放在navigationController的根控制器比较好
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    // 牛逼代码
//    return [[AAPLCheckerboardTransitionAnimator alloc] init];
    if (operation == UINavigationControllerOperationPush) {
        
        return [[ZHPresentedAnimator alloc] init];
    }else if (operation == UINavigationControllerOperationPop){
        
        return [[ZHDismissedAnimator alloc] init];
    }else{
        
        return nil;
    }
}

@end
