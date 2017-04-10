//
//  Animator.m
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "Animator.h"
#import "MyPresentationController.h"
#import "AnimationPullDown.h"
#import "AnimationDiyAlert.h"
#import "AnimationActionSheet.h"
#import "AnimationPopover.h"
#import "MyPresentationPopController.h"

@interface Animator ()
@property (strong, nonatomic) AnimationPullDown *animationPullDown;
@property (strong, nonatomic) AnimationDiyAlert *animationAlert;
@property (strong, nonatomic) AnimationActionSheet *animationActionSheet;
@property (strong, nonatomic) AnimationPopover *animationPopover;
@end

@implementation Animator

#pragma mark - <UIViewControllerTransitioningDelegate>
/** 返回一个 管理控制器 负责管理 底层弹出控制器 和 上面弹出的控制器 */
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    if (self.animationType == CustomPresentAnimationTypePopoverView) {
        MyPresentationPopController *myPresentationVc = [[MyPresentationPopController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
        myPresentationVc.presentFrame = self.presentFrame;
        myPresentationVc.point = self.point;
        return myPresentationVc;

        
    } else  {
        MyPresentationController *myPresentationVc = [[MyPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
        myPresentationVc.presentFrame = self.presentFrame;
        return myPresentationVc;
    }
}

/** 返回开始动画和结束动画的代理 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    switch (self.animationType) {
        case CustomPresentAnimationTypePullDown: {
            self.animationPullDown.startPresented = YES;
            return self.animationPullDown;
            break;
        }
        case CustomPresentAnimationTypeAlert: {
            self.animationAlert.startPresented = YES;
            return self.animationAlert;
            break;
        }
        case CustomPresentAnimationTypeActionSheet: {
            self.animationActionSheet.startPresented = YES;
            return self.animationActionSheet;
            break;
        }
            
        default:
            self.animationPopover.startPresented = YES;
            return self.animationPopover;
            break;
    }
    
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    switch (self.animationType) {
        case CustomPresentAnimationTypePullDown: {
            self.animationPullDown.startPresented = NO;
            return self.animationPullDown;
            break;
        }
        case CustomPresentAnimationTypeAlert: {
            self.animationAlert.startPresented = NO;
            return self.animationAlert;
            break;
        }
        case CustomPresentAnimationTypeActionSheet: {
            self.animationActionSheet.startPresented = NO;
            return self.animationActionSheet;
            break;
        }
            
        default:
            self.animationPopover.startPresented = NO;
            return self.animationPopover;
            break;
    }
}

- (AnimationPullDown *)animationPullDown {
    if (!_animationPullDown) {
        _animationPullDown = [AnimationPullDown new];
    }
    return _animationPullDown;
}

- (AnimationDiyAlert *)animationAlert {
    if (!_animationAlert) {
        _animationAlert = [AnimationDiyAlert new];
    }
    return _animationAlert;
}

- (AnimationActionSheet *)animationActionSheet {
    if (!_animationActionSheet) {
        _animationActionSheet = [AnimationActionSheet new];
    }
    return _animationActionSheet;
}

- (AnimationPopover *)animationPopover {
    if (!_animationPopover) {
        _animationPopover = [AnimationPopover new];
    }
    return _animationPopover;
}


@end
