//
//  Animator.h
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CustomPresentAnimationType) {
    CustomPresentAnimationTypePullDown,
    CustomPresentAnimationTypeAlert,
    CustomPresentAnimationTypeActionSheet,
    CustomPresentAnimationTypePopoverView
};


@interface Animator : NSObject <UIViewControllerTransitioningDelegate>
@property (assign, nonatomic) CGRect presentFrame;
@property (nonatomic, assign) CustomPresentAnimationType animationType;

@property (nonatomic, assign) CGPoint point;
@end
