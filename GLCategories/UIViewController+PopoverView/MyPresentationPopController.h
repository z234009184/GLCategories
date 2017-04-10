//
//  MyPresentationPopController.h
//  LAB
//
//  Created by 张国梁 on 16/9/10.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"

@interface MyPresentationPopController : UIPresentationController
@property (strong, nonatomic) PopoverView *popView;

@property (assign, nonatomic) CGRect presentFrame; // 弹出视图的frame

@property (nonatomic, assign) CGPoint point;
@end
