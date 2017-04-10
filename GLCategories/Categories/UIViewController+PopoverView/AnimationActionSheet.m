//
//  AnimationActionSheet.m
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "AnimationActionSheet.h"

@implementation AnimationActionSheet
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    self.isStartPresented ? [self animationForStartPrensentedViewController:transitionContext] : [self animationForDismissPresentedViewController:transitionContext];
}

/** 开始动画 */
- (void)animationForStartPrensentedViewController:(id <UIViewControllerContextTransitioning>)transitionContext {
    // 获取弹出的View
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    // 添加到容器中
    [transitionContext.containerView addSubview:presentedView];
    // 执行动画
    presentedView.transform = CGAffineTransformMakeTranslation(0, presentedView.frame.size.height);
    NSLog(@"%f",presentedView.frame.size.height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        presentedView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
/** 消失动画 */
- (void)animationForDismissPresentedViewController:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *dismissView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    NSLog(@"%f",dismissView.frame.size.height);

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        dismissView.transform = CGAffineTransformMakeTranslation(0, dismissView.frame.size.height);
    } completion:^(BOOL finished) {
        [dismissView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

@end
