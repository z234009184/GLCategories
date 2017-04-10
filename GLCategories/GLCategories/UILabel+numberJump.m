//
//  UILabel+numberJump.m
//  ZZR
//
//  Created by 张国梁 on 16/6/14.
//  Copyright © 2016年 中再融. All rights reserved.
//

#import "UILabel+numberJump.h"


@implementation UILabel (numberJump)

-(void)changeFromNumber:(double)originalnumber toNumber:(double) newnumber numberStyle:(NSNumberFormatterStyle)style {
    
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        NSString *currencyStr = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithDouble:originalnumber]  numberStyle:style];
        if (style == NSNumberFormatterCurrencyStyle) {
            currencyStr  = [currencyStr substringFromIndex:1];
        }
        self.text = currencyStr;
        
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if (fabs((newnumber-originalnumber)/(newnumber*1.5))<0.2) {
                
                if (newnumber == originalnumber) return;
                [self changeFromNumber:newnumber toNumber:newnumber numberStyle:style];
            }
            else if(fabs((newnumber-originalnumber)/(newnumber*1.5))<fabs(newnumber-originalnumber)){
                [self changeFromNumber:originalnumber+(newnumber-originalnumber)/100 toNumber:newnumber numberStyle:style];
            }
        });
        
    }];
}


- (void)changeToNumber:(double)number numberStyle:(NSNumberFormatterStyle)style {
    [self changeFromNumber:0 toNumber:number numberStyle:style];
}

@end

