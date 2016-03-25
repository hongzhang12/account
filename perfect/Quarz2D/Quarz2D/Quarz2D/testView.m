//
//  testView.m
//  Quarz2D
//
//  Created by zhanghong on 16/3/10.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "testView.h"
#import "LayerDelegate.h"

@interface testView ()

@property (nonatomic ,strong) LayerDelegate *ld;

@end

@implementation testView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        CALayer *subLayer = [[CALayer alloc] init];
//        self.ld = [[LayerDelegate alloc] init];
//        subLayer.delegate = self.ld;
//        
//        subLayer.anchorPoint = CGPointZero;
//        subLayer.bounds = CGRectMake(0, 0, 200, 200);
//        subLayer.position = CGPointZero;
//        subLayer.backgroundColor = [UIColor greenColor].CGColor;
//        [subLayer setNeedsDisplay];
//        [self.layer addSublayer:subLayer];


    }
    
    return self;
}
- (void)drawRect:(CGRect)rect{
    
    // 1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 绘制路径
    
    // 2.1 使用ctx直接绘制
    CGContextMoveToPoint(ctx, 30, 30);
    CGContextAddLineToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 150, 220);
//    CGContextClosePath(ctx);
    
    // 保存恢复设置
    CGContextSaveGState(ctx);
    CGContextRestoreGState(ctx);
    
    // 2.2 使用path绘制
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 200, 350);
    CGPathAddArc(path, nil, 200, 350, 100, 0, M_PI, YES);
    CGContextAddPath(ctx, path);
    
    // 2.3 绘制图片
    UIImage *image = [UIImage imageNamed:@"girls.jpg"];
    [image drawInRect:rect];
    
    // 2.4 绘制文字
    NSString *string = @"绘制文字";
    [string drawAtPoint:CGPointMake(150, 200) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    CGContextSaveGState(ctx);
    // 裁剪
    CGRect newRect = CGRectMake(40.0, 150, 240, 50);
    UIBezierPath *newPath = [UIBezierPath bezierPathWithOvalInRect:newRect];
    //CGContextAddRect(context, newRect);
    [newPath addClip];
    
    // 2.5 渐变
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray *colors = @[(__bridge id)[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.2].CGColor,
                        (__bridge id)[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.8].CGColor];
    const CGFloat locations[] = {0.0, 1.0};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    // 线性渐变
    //    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(50, 400), CGPointMake(100, 400), 0);
    //
    // 放射渐变
    CGContextDrawRadialGradient(ctx, gradient, CGPointMake(50, 400), 30, CGPointMake(100, 400), 100, 0);
    
    CGContextRestoreGState(ctx);
    
    
    // 3. 设置绘制属性
    // 线条宽度
    CGContextSetLineWidth(ctx, 1);
    // 线条端口的形状
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 线条转角的形状
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    // 虚线
    CGFloat lengths[] = {8 ,4};
    CGContextSetLineDash(ctx, 10, lengths, 2);
    
    // 阴影
    //CGContextSetShadowWithColor(ctx, CGSizeMake(10, 30), 1, [UIColor greenColor].CGColor);
    
    // 线条颜色
    CGContextSetRGBStrokeColor(ctx, 110/255.0, 110/255.0, 110/255.0, 1.0);
    // 线条框内部填充颜色
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    
    // 4. 绘制
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    // 5. 释放path,colorSpace,gradient
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGPathRelease(path);
}

@end
