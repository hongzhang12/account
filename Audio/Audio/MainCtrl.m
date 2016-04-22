//
//  MainCtrl.m
//  Audio
//
//  Created by zhanghong on 16/4/20.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "MainCtrl.h"
#import "AudioToolboxCtrl.h"
#import "AVFoundationCtrl.h"

@implementation MainCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self setUpView];
}

- (void)setUpView{
    
    UIButton *toolbox = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 200, 30)];
    [toolbox setTitle:@"toolbox" forState:UIControlStateNormal];
    [toolbox addTarget:self action:@selector(toolboxClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toolbox];
    
    
    UIButton *avFoundation = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(toolbox.frame)+50, 200, 30)];
    [avFoundation addTarget:self action:@selector(avFoundationClicked) forControlEvents:UIControlEventTouchUpInside];
    [avFoundation setTitle:@"avFoundation" forState:UIControlStateNormal];
    [self.view addSubview:avFoundation];
}

- (void)toolboxClicked{
    
    [self.navigationController pushViewController:[[AudioToolboxCtrl alloc] init] animated:YES];
}

- (void)avFoundationClicked{
    
    [self.navigationController pushViewController:[[AVFoundationCtrl alloc] init] animated:YES];
}

@end
