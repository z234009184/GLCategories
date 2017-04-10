//
//  MyPresentationController.m
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import "MyPresentationController.h"

/*********************** 蒙板 ***********************/
@implementation CoverView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    size_t locationsCount = 2;
    CGFloat locations[2] = {0.0f, 1.0f};
    CGFloat colors[8] = {0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.75f};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
    CGColorSpaceRelease(colorSpace);
    
    
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    float radius = MIN(self.bounds.size.width , self.bounds.size.height) ;
    CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
}
@end


@implementation MyPresentationController

- (void)presentationTransitionWillBegin {
    self.presentedView.frame = self.presentFrame;
    [self.containerView insertSubview:self.coverView atIndex:0];
}

- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    self.presentedView.frame = self.presentFrame;
}


- (void)dismiss {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    [UIView animateWithDuration:0.25 animations:^{
        self.coverView.alpha = 0;
    }];
}

#pragma mark - lazy
- (CoverView *)coverView {
    if (!_coverView) {
        _coverView = [[CoverView alloc] initWithFrame:self.containerView.bounds];
        [_coverView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
    }
    return _coverView;
}

@end
