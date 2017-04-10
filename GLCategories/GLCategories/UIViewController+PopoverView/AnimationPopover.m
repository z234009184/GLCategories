//
//  AnimationPopover.m
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "AnimationPopover.h"

@implementation AnimationPopover
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
    presentedView.alpha = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        presentedView.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
/** 消失动画 */
- (void)animationForDismissPresentedViewController:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *dismissView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        dismissView.alpha = 0;
    } completion:^(BOOL finished) {
        [dismissView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

@end
