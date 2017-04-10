//
//  UIView+Extension.h
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/** 从xib返回一个View */
+ (instancetype)viewFromXib;

/** 判断一个视图是否在窗口内 */
- (BOOL)intersectWithView:(UIView *)view;

/** 透明度从0渐变到1 */
- (void)alphaAnimation;
@end

@interface CALayer (Extension)
- (void)layerSpringAnimation;
@end