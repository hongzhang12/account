//
//  ZHSecondCtrl.m
//  navigation自定义转场
//
//  Created by zhanghong on 16/2/24.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import "ZHSecondCtrl.h"
#import "ZHThreeCtrl.h"
@interface ZHSecondCtrl()<UINavigationControllerDelegate>

@end

@implementation ZHSecondCtrl

- (void)viewDidLoad{
    
    [super viewDidLoad];
//    self.modalPresentationStyle = UIModalPresentationFullScreen;
//    self.navigationController.delegate = self;
    self.view.backgroundColor = [UIColor purpleColor];
    [self setNavbar];
}

- (void)setNavbar{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(rightNavbarItemClicked)];
}

- (void)rightNavbarItemClicked{
    
    [self.navigationController pushViewController:[[ZHThreeCtrl alloc] init] animated:YES];
}

@end
