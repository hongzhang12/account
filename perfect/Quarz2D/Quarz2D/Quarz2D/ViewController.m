//
//  ViewController.m
//  Quarz2D
//
//  Created by zhanghong on 16/3/4.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ViewController.h"
#import "testView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    // 图层上下文
    
    testView *test = [[testView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:test];
    
    
    /// 图片上下文
    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0);
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGContextAddRect(ctx, CGRectMake(0, 0, 100, 100));
//    
//    CGContextFillPath(ctx);
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.backgroundColor = [UIColor yellowColor];
//    imageView.center = CGPointMake(150,300);
//    [self.view addSubview:imageView];
}


@end
