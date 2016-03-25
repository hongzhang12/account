//
//  vedioCtrl.m
//  vvvvvv
//
//  Created by zhanghong on 16/3/9.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "vedioCtrl.h"
#import "UIView+FLKAutoLayout.h"
#import <AVFoundation/AVFoundation.h>
#import "AVCaptureDevice+addition.h"

@interface vedioCtrl()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic ,strong) AVCaptureDeviceInput *backCameraInput;
@property (nonatomic ,strong) AVCaptureDeviceInput *frontCameraInput;

@property (nonatomic ,strong) AVCaptureSession *session;

@property (nonatomic ,weak) AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation vedioCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
    NSArray *vedioDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    
    for (AVCaptureDevice *device in vedioDevices) {
        
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
        if (device.position == AVCaptureDevicePositionBack) {
            
            NSLog(@"AVCaptureDevicePositionBack");
            self.backCameraInput = input;
        }else if (device.position == AVCaptureDevicePositionFront){
            
            NSLog(@"AVCaptureDevicePositionFront");
            self.frontCameraInput = input;
        }else{
            
            NSLog(@"AVCaptureDevicePositionUnspecified");
        }
    }
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];

    self.session = session;
    // 同一时间只能添加一个
//    if ([session canAddInput:self.frontCameraInput]) {
//        
//        [session addInput:self.frontCameraInput];
//    }
    AVAuthorizationStatus authorStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (authorStatus) {
        case AVAuthorizationStatusNotDetermined:
            
            if ([session canAddInput:self.backCameraInput]) {
                
                [session addInput:self.backCameraInput];
            }
            break;
        case AVAuthorizationStatusRestricted:
            
            NSLog(@"AVAuthorizationStatusRestrictedOrDenied");
        case AVAuthorizationStatusDenied:
            
            break;
        case AVAuthorizationStatusAuthorized:
            
            if ([session canAddInput:self.backCameraInput]) {
                
                [session addInput:self.backCameraInput];
            }
            break;
            
        default:
            break;
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    previewLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:previewLayer];
    self.previewLayer = previewLayer;
    
//    AVCaptureMetadataOutput *metaOutput = [[AVCaptureMetadataOutput alloc] init];
//    [metaOutput setMetadataObjectsDelegate:self queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
//    if ([session canAddOutput:metaOutput]) {
//        
//        [session addOutput:metaOutput];
//    }
//    NSLog(@"%@",[metaOutput availableMetadataObjectTypes]);
//    // 人脸识别
//    [metaOutput setMetadataObjectTypes:@[AVMetadataObjectTypeFace]];
    
    [session startRunning];
    
    [self addGenestures];
    [self setUpView];
}

- (void)setUpView{
    
    UISlider *focusSlider = [[UISlider alloc] init];
    [focusSlider addTarget:self action:@selector(focusWithSlider:) forControlEvents:UIControlEventValueChanged];
    focusSlider.value = 0.6;
    [self.view addSubview:focusSlider];
    
    focusSlider.thumbTintColor = [UIColor greenColor];
    focusSlider.minimumTrackTintColor = [UIColor whiteColor];
    focusSlider.maximumTrackTintColor = [UIColor grayColor];
    
    [focusSlider constrainHeight:@"10"];
    [focusSlider alignBottomEdgeWithView:self.view predicate:@"-20"];
    [focusSlider alignLeading:@"30" trailing:@"-30" toView:self.view];
    
    UISlider *exposureSlider = [[UISlider alloc] init];
    [exposureSlider addTarget:self action:@selector(exposureWithSlider:) forControlEvents:UIControlEventValueChanged];
    exposureSlider.value = 0.2;
    [self.view addSubview:exposureSlider];
    
    exposureSlider.thumbTintColor = [UIColor greenColor];
    exposureSlider.minimumTrackTintColor = [UIColor whiteColor];
    exposureSlider.maximumTrackTintColor = [UIColor grayColor];
    
    [exposureSlider constrainHeight:@"10"];
    [exposureSlider alignBottomEdgeWithView:focusSlider predicate:@"-30"];
    [exposureSlider alignLeading:@"30" trailing:@"-30" toView:self.view];
}

- (void)addGenestures{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(focus:)];
    [self.view addGestureRecognizer:tap];
}

// 自动对焦和曝光
- (void)focus:(UITapGestureRecognizer *)tap{
    
    [self.backCameraInput.device changeDevicePropertyWithBlock:^(AVCaptureDevice *device){
        
        CGPoint pointInPreView = [tap locationInView:tap.view];
        
        CGPoint pointInCamera = [self.previewLayer captureDevicePointOfInterestForPoint:pointInPreView];
        NSLog(@"%@---%@",NSStringFromCGPoint(pointInPreView),NSStringFromCGPoint(pointInCamera));
        
        if ([device isFocusPointOfInterestSupported]) {
         
            device.focusPointOfInterest = pointInCamera;
        }
        
        if ([device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus]) {
            
            device.focusMode = AVCaptureFocusModeAutoFocus;
        }
        
        if ([device isExposurePointOfInterestSupported]) {
            
            device.exposurePointOfInterest = pointInCamera;
        }
        
        if ([device isExposureModeSupported:AVCaptureExposureModeAutoExpose]) {
            
            device.exposureMode = AVCaptureExposureModeAutoExpose;
        }
    }];
}

// 手动聚焦
- (void)focusWithSlider:(UISlider *)slider{
    
    // 和自动对焦有冲突
    NSLog(@"------%f",slider.value);
    [self.backCameraInput.device changeDevicePropertyWithBlock:^(AVCaptureDevice *device){
        
        [device setFocusModeLockedWithLensPosition:slider.value completionHandler:^(CMTime syncTime) {
        
        }];
    }];
}

// 半自动曝光（还有可以自己设置快门速度和iso的方式）
- (void)exposureWithSlider:(UISlider *)slider{
    
    [self.backCameraInput.device changeDevicePropertyWithBlock:^(AVCaptureDevice *device){
        
        [device setExposureTargetBias:slider.value completionHandler:^(CMTime syncTime) {
            
        }];
    }];
}

// 不用设置白平衡device setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:<#(AVCaptureWhiteBalanceGains)#> completionHandler:<#^(CMTime syncTime)handler#>

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    AVCaptureMetadataOutput *output = (AVCaptureMetadataOutput *)captureOutput;
//    NSLog(@"%@---%@",[NSThread currentThread],[NSThread mainThread]);
    NSLog(@"%@",NSStringFromCGRect([output rectOfInterest]));
}

@end
