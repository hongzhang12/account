//
//  AVCaptureDevice+addition.h
//  vvvvvv
//
//  Created by zhanghong on 16/3/9.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

typedef void(^DevicePropertyChangeBlock)(AVCaptureDevice *device);

@interface AVCaptureDevice (addition)

// 设置设备属性要先锁定
- (void)changeDevicePropertyWithBlock:(DevicePropertyChangeBlock)block;

@end
