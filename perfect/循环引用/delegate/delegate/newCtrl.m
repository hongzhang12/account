//
//  newCtrl.m
//  delegate
//
//  Created by zhanghong on 16/3/1.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "newCtrl.h"

@implementation newCtrl

- (void)viewDidLoad{
    
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([self.delegate respondsToSelector:@selector(test)]) {
        
        [self.delegate test];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc{
    
    NSLog(@"dealloc");
}

@end
