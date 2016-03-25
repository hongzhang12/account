//
//  ViewController.m
//  MultiThreading
//
//  Created by zhanghong on 16/3/17.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "OperationCtrl.h"

@interface OperationCtrl ()

@property (nonatomic ,strong) NSOperationQueue *operationQueue;

@end

@implementation OperationCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self operationDepend];
}

#pragma mark - MuliThreading method

- (void)invocation{
    
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationCallback) object:nil];
    [self.operationQueue addOperation:operation];
}

- (void)block{
    
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
       
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf logThreads];
        [NSThread sleepForTimeInterval:5];
        NSLog(@"block");
    }];
    
    [self.operationQueue addOperation:operation];
}

- (void)queueBlock{
    
    __weak typeof(self) weakSelf = self;
    [self.operationQueue addOperationWithBlock:^{
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf logThreads];
        [NSThread sleepForTimeInterval:5];
        NSLog(@"queueBlock");
    }];
}

// 任务依赖
- (void)operationDepend{
    
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationCallback) object:nil];
    
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf logThreads];
        [NSThread sleepForTimeInterval:5];
        NSLog(@"block");
    }];
    
    [operation1 addDependency:operation];
    
    [self.operationQueue addOperation:operation1];
    [self.operationQueue addOperation:operation];
}

#pragma mark - 回调方法

- (void)invocationCallback{
    
    [self logThreads];
    [NSThread sleepForTimeInterval:5];
    NSLog(@"invocationCallback");
}

#pragma mark - others

- (void)logThreads{
    
    NSLog(@"MainThread:%@---CurrentThread:%@", [NSThread mainThread] ,[NSThread currentThread]);
}


- (NSOperationQueue *)operationQueue{
    
    if (_operationQueue == nil) {
        
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.maxConcurrentOperationCount = 5;
    }
    
    return _operationQueue;
}

@end
