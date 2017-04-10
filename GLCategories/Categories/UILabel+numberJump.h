//
//  UILabel+numberJump.h
//  ZZR
//
//  Created by 张国梁 on 16/6/14.
//  Copyright © 2016年 中再融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (numberJump)

- (void)changeFromNumber:(double) originalnumber toNumber:(double) newnumber numberStyle:(NSNumberFormatterStyle)style;

- (void)changeToNumber:(double)number numberStyle:(NSNumberFormatterStyle)style;
@end
