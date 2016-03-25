

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

@property (nonatomic ,strong) NSObject<UIViewControllerTransitioningDelegate> *transittionDele;

@end

@implementation ZHPresentedCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    ZHPresentingCtrl *presentingCtrl = [[ZHPresentingCtrl alloc] init];
    
    // 必须设置
    presentingCtrl.transitioningDelegate = self.transittionDele;
    presentingCtrl.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:presentingCtrl animated:YES completion:nil];
}

- (NSObject<UIViewControllerTransitioningDelegate> *)transittionDele{
    
    if (_transittionDele == nil) {
        
        _transittionDele = [[ZHTransitionDelegate alloc] init];
    }
    
    return _transittionDele;
}

@end
