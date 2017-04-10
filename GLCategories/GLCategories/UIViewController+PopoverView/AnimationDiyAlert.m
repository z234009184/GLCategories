//
//  AnimationAlert.m
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "AnimationDiyAlert.h"

@implementation AnimationDiyAlert
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}
- (void)animateTransition:(nonnull id <UIViewControllerContextTransitioning>)transitionContext {
    self.isStartPresented ? [self animationForStartPrensentedViewController:transitionContext] : [self animationForDismissPresentedViewController:transitionContext];
}

/** 开始动画 */
- (void)animationForStartPrensentedViewController:(nonnull id <UIViewControllerContextTransitioning>)transitionContext {
    // 获取弹出的View
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    // 添加到容器中
    [transitionContext.containerView addSubview:presentedView];
    // 执行动画
    presentedView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    presentedView.alpha = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        presentedView.transform = CGAffineTransformIdentity;
        presentedView.alpha = 1;

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
/** 消失动画 */
- (void)animationForDismissPresentedViewController:(nonnull id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *dismissView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    dismissView.alpha = 1;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        dismissView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        dismissView.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        [dismissView removeFromSuperview];
    }];
}



@end
