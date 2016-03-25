//
//  LayerDelegate.m
//  Quarz2D
//
//  Created by zhanghong on 16/3/10.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "LayerDelegate.h"
#import <UIKit/UIKit.h>


@implementation LayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    UIGraphicsPushContext(ctx);
    
    UIImage *image = [UIImage imageNamed:@"girls.jpg"];
    [image drawInRect:CGRectMake(0, 0, 150, 150)];
    
    UIGraphicsPopContext();
    
    UIGraphicsPushContext(ctx);
    
    CGContextAddArc(ctx, 100, 100, 50, 0, 2*M_PI, YES);
    
    CGContextFillPath(ctx);
    
    UIGraphicsPopContext();
}

@end
