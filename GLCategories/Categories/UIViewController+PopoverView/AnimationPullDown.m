//
//  AnimatedTransition.m
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "AnimationPullDown.h"

@implementation AnimationPullDown
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
    presentedView.transform = CGAffineTransformMakeScale(1.0, 0.0);
    presentedView.layer.anchorPoint = CGPointMake(0.5, 0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        presentedView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
/** 消失动画 */
- (void)animationForDismissPresentedViewController:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *dismissView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        dismissView.transform = CGAffineTransformMakeScale(1, 0.0001);
    } completion:^(BOOL finished) {
        [dismissView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

@end
