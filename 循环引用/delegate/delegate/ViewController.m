//
//  ViewController.m
//  delegate
//
//  Created by zhanghong on 16/3/1.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ViewController.h"

#import "newCtrl.h"

@interface ViewController ()<newCtrlDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor purpleColor];
}

// 这个估计很难造成循环引用
// 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    newCtrl *ctrl = [[newCtrl alloc] init];
    ctrl.delegate = self;
    [self.navigationController pushViewController:ctrl animated:YES];
}

- (void)test{
    
    NSLog(@"test");
}

@end
