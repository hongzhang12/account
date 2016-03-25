//
//  ViewController.m
//  CoreAnimation
//
//  Created by zhanghong on 16/3/14.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ViewController.h"
#import "LayersCtrl.h"

@interface ViewController ()

@property (nonatomic ,weak) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 300)];
    [self.view addSubview:testView];
    self.testView = testView;
    testView.backgroundColor = [UIColor greenColor];
    
    [self setUpNavItems];
}

- (void)setUpNavItems{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Layers" style:0 target:self action:@selector(rightItemClicked)];
}

- (void)rightItemClicked{
    
    [self.navigationController pushViewController:[[LayersCtrl alloc] init] animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    static BOOL isBeginAnimation = YES;
    
    isBeginAnimation?[self animationGroup]:[self removeAnimation];
    
    isBeginAnimation = !isBeginAnimation;
}

#pragma mark - animations

// 基本动画
- (void)commomAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 100)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    animation.duration = 0.5;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    [self.testView.layer addAnimation:animation forKey:@"position"];
}

// 关键帧动画（values）
- (void)keyframeAnimation{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.values = [NSArray arrayWithObjects:(id)[NSValue valueWithCGPoint:CGPointMake(0, 0)]
                        ,(id)[NSValue valueWithCGPoint:CGPointMake(320, 0)]
                        ,(id)[NSValue valueWithCGPoint:CGPointMake(320, 568)]
                        ,(id)[NSValue valueWithCGPoint:CGPointMake(0, 568)],nil];
    animation.duration = 5;
//    animation.autoreverses = YES;
//    animation.repeatCount = MAXFLOAT;
    
    // 每一帧的时间，指的是时刻，不是时间间隔
    animation.keyTimes = [NSArray arrayWithObjects:@0 ,@0.3 ,@0.9 ,@1 ,nil];
    
    [self.testView.layer addAnimation:animation forKey:NULL];
}

// 关键帧动画（CGPath）,只对anchorPoint和position起作用
- (void)keyframeAnimationWithPath{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, nil, 160, 250, 100, 0, 2*M_PI, YES);
    
    animation.path = path;
    
    //  path 需要手动释放--CGColorSpace也需要
    //  CGColorRelease()
    CGPathRelease(path);
    
    animation.duration = 2;
    
    // 动画结束后，默认是回到动画前的状态，这里把它设置成保持动画结束后的状态。但实际上layer的属性还是初始值，并没有改变。
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    animation.delegate = self;
    
    [self.testView.layer addAnimation:animation forKey:nil];
}

// 动画组
- (void)animationGroup{
    
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation1.values = [NSArray arrayWithObjects:(id)[NSValue valueWithCGPoint:CGPointMake(0, 0)]
                        ,(id)[NSValue valueWithCGPoint:CGPointMake(320, 0)]
                        ,(id)[NSValue valueWithCGPoint:CGPointMake(320, 568)]
                        ,(id)[NSValue valueWithCGPoint:CGPointMake(0, 568)],nil];
    //    animation.autoreverses = YES;
    //    animation.repeatCount = MAXFLOAT;
    
    // 每一帧的时间，指的是时刻，不是时间间隔
    animation1.keyTimes = [NSArray arrayWithObjects:@0 ,@0.3 ,@0.9 ,@1 ,nil];
    
    
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    
    animation2.values = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor
                         ,(id)[UIColor redColor].CGColor
                         ,(id)[UIColor blueColor].CGColor
                         , nil];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation1 ,animation2];
    animationGroup.duration = 3;
    
    [self.testView.layer addAnimation:animationGroup forKey:nil];
}

#pragma mark - animation action

- (void)removeAnimation{
    
    [self.testView.layer removeAllAnimations];
}

- (void)pauseAnimation:(CALayer *)layer{
    
    CFTimeInterval pauseTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 让layer的时间停止走动
    layer.speed = 0;
    
    // 让layer的时间停留在pauseTime这个时刻
    layer.timeOffset = pauseTime;
}

- (void)resumeAnimation:(CALayer *)layer{
    
    CFTimeInterval pauseTime = layer.timeOffset;
    
    // 1. 让layer的时间继续行走
    layer.speed = 1;
    // 2. 取消上次记录的停止时间
    layer.timeOffset = 0;
    // 3. 取消上次设置的时间
    layer.beginTime = 0;
    // 4. 计算暂停的时间
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pauseTime;
    // 5. 设置相对于父坐标系的开始时间（往后退timeSincePause）
    layer.beginTime = timeSincePause;
}

-(void)pauseLayer:(CALayer*)layer{
    
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 让CALayer的时间停止走动
    layer.speed = 0.0;
    // 让CALayer的时间停留在pausedTime这个时刻
    layer.timeOffset = pausedTime;
}

#pragma mark - animation delegate

- (void)animationDidStart:(CAAnimation *)animation{
    
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag{
    
    NSLog(@"animationDidStop");
}

@end
