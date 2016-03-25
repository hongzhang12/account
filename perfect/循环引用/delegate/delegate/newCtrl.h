//
//  newCtrl.h
//  delegate
//
//  Created by zhanghong on 16/3/1.
//  Copyright © 2016年 zhanghong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol newCtrlDelegate <NSObject>

- (void)test;

@end

@interface newCtrl : UIViewController

// 应该用weak
@property (nonatomic ,strong) id<newCtrlDelegate> delegate;

@end
