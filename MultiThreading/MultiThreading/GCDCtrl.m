//
//  GCDCtrl.m
//  MultiThreading
//
//  Created by zhanghong on 16/3/23.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "GCDCtrl.h"

@implementation GCDCtrl

-  (void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self disSerial_async];
}

#pragma mark - 串行队列,同步执行
- (void)serial_sync{
    
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    for (int i = 0; i < 100; i++) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf == nil) return;
        dispatch_sync(serialQueue, ^{
            
            [self logThreads];
            [NSThread sleepForTimeInterval:1];
            NSLog(@"%d",i);
        });
    }
    
    // 按顺序执行在主线程执行,会阻塞主线程
}

- (void)serial_async{
    
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    __weak typeof(self) weakSelf = self;
    for (int i = 0; i < 100; i++) {
        
        dispatch_async(serialQueue, ^{
            
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf == nil) return;
            [strongSelf logThreads];
//            [NSThread sleepForTimeInterval:1];
            NSLog(@"%d",i);
        });
    }
    // 按顺序执行,新开一条子线程,不会阻塞主线程
}

- (void)disSerial_sync{
    
    __weak typeof(self) weakSelf = self;
    for (int i = 0; i < 100; i++) {
        
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf == nil) return;
            
            [strongSelf logThreads];
//            [NSThread sleepForTimeInterval:5];
            NSLog(@"%d",i);
        });
    }
}

- (void)disSerial_async{
    
    __weak typeof(self) weakSelf = self;
    for (int i = 0; i < 100; i++) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf == nil) return;
            
            [strongSelf logThreads];
            [NSThread sleepForTimeInterval:5];
            NSLog(@"%d",i);
        });
    }
}

- (void)logThreads{
    
    NSLog(@"MainThread:%@---CurrentThread:%@", [NSThread mainThread] ,[NSThread currentThread]);
}

@end
