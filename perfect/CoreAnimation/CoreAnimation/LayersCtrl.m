//
//  LayersCtrl.m
//  CoreAnimation
//
//  Created by zhanghong on 16/3/14.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "LayersCtrl.h"

@interface LayersCtrl()

@property (nonatomic ,weak) UIView *testView;

@end

@implementation LayersCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(10 , 30, 280, 400)];
    testView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:testView];
    self.testView = testView;
    
    [self addReplicatorLayer];
}

- (void)addShapeLayer{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = CGRectMake(0, 0, 120, 180);
    shapeLayer.backgroundColor = [UIColor greenColor].CGColor;
    //
//    shapeLayer.anchorPoint = CGPointMake(0, 0);
    shapeLayer.position = CGPointMake(70 , 100);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(60, 100) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    shapeLayer.path = path.CGPath;
    
    shapeLayer.strokeStart = 0.2;
    shapeLayer.strokeEnd = 0.7;
    
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.lineWidth = 5;
    
    [self.testView.layer addSublayer:shapeLayer];
    
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @-1;
    startAnimation.toValue = @1;
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @0;
    endAnimation.toValue = @1;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[startAnimation ,endAnimation];
    group.duration = 1.65;
    group.repeatCount = MAXFLOAT;
    
    [shapeLayer addAnimation:group forKey:nil];
}

- (void)addReplicatorLayer{
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
//    replicatorLayer.backgroundColor = [UIColor yellowColor].CGColor;
    
    replicatorLayer.bounds = CGRectMake(0, 0, 30, 100);
    replicatorLayer.position = CGPointMake(140, 100);
    
    replicatorLayer.instanceCount = 8;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    replicatorLayer.instanceDelay = 0.2;
    
    replicatorLayer.masksToBounds = NO;

    [self.testView.layer addSublayer:replicatorLayer];
    
    CAShapeLayer *subLayer = [CAShapeLayer layer];

    subLayer.bounds = CGRectMake(0, 0, 30, 30);
    subLayer.position = CGPointMake(15, 15);
    
    // 锚点不在圆心或许可以做出比较酷炫的效果
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, nil, 15, 15, 7, 0, 2*M_PI, YES);
    
    subLayer.path = path;
    
    CGPathRelease(path);
    
//    subLayer.strokeColor = [UIColor blueColor].CGColor;
    subLayer.fillColor = [UIColor yellowColor].CGColor;
    
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//    
//    animation1.fromValue = @0.1;
//    animation1.toValue = @1;
//    
//    animation1.repeatCount = MAXFLOAT;
//    animation1.autoreverses = YES;
//    
//    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
//    
//    animation2.fromValue = @0.1;
//    animation2.toValue = @1;
//    
//    animation2.repeatCount = MAXFLOAT;
//    animation2.autoreverses = YES;
//    
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.animations = @[animation1 ,animation2];
//    
//    group.duration = 1.2;
//    
//    group.repeatCount = MAXFLOAT;
//    
//    [subLayer addAnimation:group forKey:nil];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];

    animation.fromValue = @0.1;
    animation.toValue = @1;

    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    
    animation.duration = 0.8;
    
    [subLayer addAnimation:animation forKey:nil];
    
    [replicatorLayer addSublayer:subLayer];
}

- (void)addGradientLayer{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.bounds = CGRectMake(0, 0, 30, 100);
    gradientLayer.position = CGPointMake(140, 100);
    
    gradientLayer.backgroundColor = [UIColor greenColor].CGColor;
    
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor
                            ,(id)[UIColor blueColor].CGColor
                            ,(id)[UIColor yellowColor].CGColor
                            , nil];
    gradientLayer.locations = @[@0,@0.7,@1];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    
    animation.fromValue = @[@0,@0.2,@1];
    animation.toValue = @[@0,@0.7,@1];
    
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.75;
    
    [gradientLayer addAnimation:animation forKey:nil];
    
    [self.testView.layer addSublayer:gradientLayer];
}

@end
