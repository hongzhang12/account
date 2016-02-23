//
//  ZHPresentingCtrl.m
//  animator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHPresentingCtrl.h"
#import "ZHTransitionDelegate.h"
@interface ZHPresentingCtrl()

@property (nonatomic ,strong) ZHTransitionDelegate *transittionDele;

@end

@implementation ZHPresentingCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureUpdated:)];
    ZHTransitionDelegate *transitionDele = (ZHTransitionDelegate *)self.transitioningDelegate;
    transitionDele.panGesture = panGesture;
    [self.view addGestureRecognizer:panGesture];
}

- (void)panGestureUpdated:(UIPanGestureRecognizer *)panGesture{
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end
