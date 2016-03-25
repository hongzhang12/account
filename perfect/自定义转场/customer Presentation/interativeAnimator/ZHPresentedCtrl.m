

//
//  ZHPresentedCtrl.m
//  animator
//
//  Created by zhanghong on 16/2/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHPresentedCtrl.h"
#import "ZHPresentingCtrl.h"
#import "ZHTransitionDelegate.h"

@interface ZHPresentedCtrl()

// 需要强引用
@property (nonatomic ,strong) ZHTransitionDelegate *transittionDele;
@property (nonatomic ,weak) UIButton *presentedBtn;

@end

@implementation ZHPresentedCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureUpdated:)];
    [self.view addGestureRecognizer:panGesture];
    
//    self.presentedBtn.backgroundColor = [UIColor redColor];
}

- (void)panGestureUpdated:(UIPanGestureRecognizer *)panGesture{
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        
        self.transittionDele.panGesture = panGesture;
        
        ZHPresentingCtrl *presentingCtrl = [[ZHPresentingCtrl alloc] init];
        
        // 必须设置
        presentingCtrl.transitioningDelegate = self.transittionDele;
        //
        presentingCtrl.modalPresentationStyle = UIModalPresentationCustom;
        
        [self presentViewController:presentingCtrl animated:YES completion:nil];
    }
}

- (void)presentedBtnClicked:(UIButton *)button{
    
//    ZHPresentingCtrl *presentingCtrl = [[ZHPresentingCtrl alloc] init];
//    
//    // 必须设置
//    presentingCtrl.transitioningDelegate = self.transittionDele;
//    //
//    presentingCtrl.modalPresentationStyle = UIModalPresentationCustom;
//
//    [self.navigationController pushViewController:presentingCtrl animated:YES];
}

- (ZHTransitionDelegate *)transittionDele{
    
    if (_transittionDele == nil) {
        
        _transittionDele = [[ZHTransitionDelegate alloc] init];
    }
    
    return _transittionDele;
}

- (UIButton *)presentedBtn{
    
    if (_presentedBtn == nil) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, 400, 200, 30)];
        [button addTarget:self action:@selector(presentedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Presented" forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        _presentedBtn = button;
    }
    
    return _presentedBtn;
}

@end
