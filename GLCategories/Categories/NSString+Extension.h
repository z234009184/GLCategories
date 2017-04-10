//
//  NSString+Extension.h
//  MengKe
//
//  Created by 陈园 on 15/12/7.
//  Copyright © 2015年 chends. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)
/**
 *  md5 加密
 *
 *  @return <#return value description#>
 */
- (NSString *)md5String;
+ (NSString *) transToPinyin:(NSString*)sourceString;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(NSInteger)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;

/**
 *  是否为emoji字符
 */
- (BOOL)isEmoji;

/** 日期转换为字符串 */
+ (NSString *)stringFromDate:(NSDate *)date;


/** 字符串转换为日期 */
+ (NSDate *)dateFromString:(NSString *)dateStr;

/** 日期转换为字符串(带小时分钟的) */
+ (NSString *)stringFromHourDate:(NSDate *)date;

/** 字符串转换为日期(带小时分钟的) */
+ (NSDate *)dateFromHourString:(NSString *)dateStr;

/** Jul 29, 2016 11:59:59 PM 这种字符串 格式化为 2016-07-29 这种字符串 */
- (instancetype)formatString;
- (instancetype)formatString2;

/** 返回一个路径文件的大小字节数 */
- (unsigned long long)fileSize;
/** 利用日历比较两个时间的差值 分钟差 */
+ (NSInteger)minuteOfCurrentTimeAndPastTime:(NSString *)pastTime;

- (NSString *)currencyString;

- (NSString *)clearCommaSymbol;
//删除所有空格
- (NSString *)removeAllBlankSpace;
-(BOOL)isTelphoneNum;

@end
