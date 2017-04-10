//
//  NSNumber+Extension.m
//  ZZR
//
//  Created by 张国梁 on 16/6/22.
//  Copyright © 2016年 中再融. All rights reserved.
//

#import "NSNumber+Extension.h"

@implementation NSNumber (Extension)

- (NSString *)stringWithStyle:(NSNumberFormatterStyle)style {
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:style];
}

- (NSString *)currencyString {
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterCurrencyStyle];
}

- (NSString *)currencyStringNoSymbol {
    NSString *str = [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterCurrencyStyle];
    return [str stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
}

@end
