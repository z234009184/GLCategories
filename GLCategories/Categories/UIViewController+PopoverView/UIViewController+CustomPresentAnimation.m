//
//  UIViewController+CustomPresentAnimation.m
//  LAB
//
//  Created by 张国梁 on 16/9/7.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "UIViewController+CustomPresentAnimation.h"

@interface UIViewController ()
@end
@implementation UIViewController (CustomPresentAnimation)
static Animator *anima;
- (void)presentViewControllerCustom:(nonnull UIViewController *)viewControllerToPresent presentFrame:(CGRect)presentFrame animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    
    [self presentViewControllerCustom:viewControllerToPresent presentFrame:presentFrame animationType:CustomPresentAnimationTypePullDown animated:flag completion:completion];
}

- (void)presentViewControllerCustom:(UIViewController *)viewControllerToPresent presentFrame:(CGRect)presentFrame animationType:(CustomPresentAnimationType)animationType animated:(BOOL)flag completion:(void (^)(void))completion {
    
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    anima = [Animator new];
    anima.presentFrame = presentFrame;
    anima.animationType = animationType;
    viewControllerToPresent.transitioningDelegate = anima;
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
    
}

- (void)presentViewControllerCustom:(nonnull UIViewController *)viewControllerToPresent presentFrame:(CGRect)presentFrame point:(CGPoint)point animationType:(CustomPresentAnimationType)animationType animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    anima = [Animator new];
    anima.presentFrame = presentFrame;
    anima.animationType = animationType;
    anima.point = point;
    viewControllerToPresent.transitioningDelegate = anima;
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
