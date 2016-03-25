//
//  ViewController.m
//  Block
//
//  Created by zhanghong on 16/3/1.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ViewController.h"
#import "DeallocCtrl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.navigationController pushViewController:[[DeallocCtrl alloc] init] animated:YES];
}

@end
