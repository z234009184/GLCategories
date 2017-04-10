//
//  NSNumber+Extension.h
//  ZZR
//
//  Created by 张国梁 on 16/6/22.
//  Copyright © 2016年 中再融. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Extension)
- (NSString *)stringWithStyle:(NSNumberFormatterStyle)style;
- (NSString *)currencyString;
- (NSString *)currencyStringNoSymbol;
@end
