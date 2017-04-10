//
//  MyPresentationPopController.m
//  LAB
//
//  Created by 张国梁 on 16/9/10.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "MyPresentationPopController.h"

@implementation MyPresentationPopController
- (void)presentationTransitionWillBegin {
    self.presentedView.frame = self.presentFrame;
    
    [self.popView showAtPoint:self.point inView:self.containerView withContentView:self.presentedView];
    [self.popView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
    [self.containerView insertSubview:self.popView atIndex:0];
}

- (void)dismissalTransitionWillBegin {
    
}

- (void)dismiss {
    [UIView animateWithDuration:0.2 animations:^{
        self.popView.alpha = 0;
        self.presentedView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }];
    
}

- (PopoverView *)popView {
    if (!_popView) {
        _popView = [[PopoverView alloc] initWithFrame:CGRectZero];
       
    }
    return _popView;
}

@end
