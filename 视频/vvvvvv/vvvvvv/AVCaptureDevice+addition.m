//
//  AVCaptureDevice+addition.m
//  vvvvvv
//
//  Created by zhanghong on 16/3/9.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "AVCaptureDevice+addition.h"

@implementation AVCaptureDevice (addition)

- (void)changeDevicePropertyWithBlock:(DevicePropertyChangeBlock)block{
    
    if ([self lockForConfiguration:nil]) {
        
        block(self);
        
        [self unlockForConfiguration];
    }
}

@end
