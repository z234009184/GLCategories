//
//  AnimatedTransition.h
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationPullDown : NSObject <UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic, getter=isStartPresented) BOOL startPresented;
@end
