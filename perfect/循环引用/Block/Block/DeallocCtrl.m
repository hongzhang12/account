//
//  DeallocCtrl.m
//  Block
//
//  Created by zhanghong on 16/3/1.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "DeallocCtrl.h"

typedef void(^testBlock)(void);

@interface DeallocCtrl()

@property (nonatomic ,weak) UIView *testView;

@property (nonatomic ,assign) testBlock block;

@end

@implementation DeallocCtrl

- (void)viewDidLoad{
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
    self.testView = testView;
    
    // 错误写法1
    self.block = ^{
        
        self.testView.backgroundColor = [UIColor redColor];
        NSLog(@"testBlock");
    };
    
    // 错误写法2
    self.block = ^{
        
        _testView.backgroundColor = [UIColor redColor];
        NSLog(@"testBlock");
    };
    // 正确的写法
//    __weak typeof(self) weakSelf = self;
//    self.block = ^{
//        
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        strongSelf.testView.backgroundColor = [UIColor redColor];
//        NSLog(@"testBlock");
//    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.block();
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc{
    
    NSLog(@"dealloc");
}

@end
