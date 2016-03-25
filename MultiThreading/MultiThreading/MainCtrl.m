//
//  MainCtrl.m
//  MultiThreading
//
//  Created by zhanghong on 16/3/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "MainCtrl.h"
#import "GCDCtrl.h"
#import "OperationCtrl.h"

@implementation MainCtrl


- (void)viewDidLoad{
    
    [self setUpView];
}

- (void)setUpView{
    
    UIButton *operation = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [operation addTarget:self action:@selector(pushToOperationCtrl) forControlEvents:UIControlEventTouchUpInside];
    [operation setTitle:@"Operation" forState:UIControlStateNormal];
    [self.view addSubview:operation];
    
    UIButton *GCD = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    [GCD addTarget:self action:@selector(pushToGCDCtrl) forControlEvents:UIControlEventTouchUpInside];
    [GCD setTitle:@"GCD" forState:UIControlStateNormal];
    [self.view addSubview:GCD];
}

- (void)pushToOperationCtrl{
    
    [self.navigationController pushViewController:[[OperationCtrl alloc] init] animated:YES];
}

- (void)pushToGCDCtrl{
    
    [self.navigationController pushViewController:[[GCDCtrl alloc] init] animated:YES];
}

@end
