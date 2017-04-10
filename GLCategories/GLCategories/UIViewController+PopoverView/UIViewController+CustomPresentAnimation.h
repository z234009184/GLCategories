//
//  UIViewController+CustomPresentAnimation.h
//  LAB
//
//  Created by 张国梁 on 16/9/7.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "Animator.h"


@interface UIViewController (CustomPresentAnimation)
- (void)presentViewControllerCustom:(nonnull UIViewController *)viewControllerToPresent presentFrame:(CGRect)presentFrame animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;

- (void)presentViewControllerCustom:(nonnull UIViewController *)viewControllerToPresent presentFrame:(CGRect)presentFrame animationType:(CustomPresentAnimationType)animationType animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;

- (void)presentViewControllerCustom:(nonnull UIViewController *)viewControllerToPresent presentFrame:(CGRect)presentFrame point:(CGPoint)point animationType:(CustomPresentAnimationType)animationType animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;

@end
