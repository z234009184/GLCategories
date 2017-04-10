//
//  NSString+Extension.m
//  MengKe
//
//  Created by 陈园 on 15/12/7.
//  Copyright © 2015年 chends. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonCrypto.h>
#define EmojiCodeToSymbol(c) ((((0x808080F0 | (c & 0x3F000) >> 4) | (c & 0xFC0) << 10) | (c & 0x1C0000) << 18) | (c & 0x3F) << 24)

@implementation NSString (Extension)
- (NSString *)md5String {
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH].uppercaseString;
    return self.uppercaseString;
}
/**
 *  返回二进制 Bytes 流的字符串表示形式
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *  @return 字符串表示形式
 */
- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}
+ (NSString *) transToPinyin:(NSString*)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}

+ (NSString *)emojiWithIntCode:(NSInteger)intCode {
    NSInteger symbol = EmojiCodeToSymbol(intCode);
    NSString *string = [[NSString alloc] initWithBytes:&symbol length:sizeof(symbol) encoding:NSUTF8StringEncoding];
    if (string == nil) { // 新版Emoji
        string = [NSString stringWithFormat:@"%C", (unichar)intCode];
    }
    return string;
}

+ (NSString *)emojiWithStringCode:(NSString *)stringCode
{
    char *charCode = (char *)stringCode.UTF8String;
    NSInteger intCode = strtol(charCode, NULL, 16);
    return [self emojiWithIntCode:intCode];
}

// 判断是否是 emoji表情
- (BOOL)isEmoji
{
    BOOL returnValue = NO;
    
    const unichar hs = [self characterAtIndex:0];
    // surrogate pair
    if (0xd800 <= hs && hs <= 0xdbff) {
        if (self.length > 1) {
            const unichar ls = [self characterAtIndex:1];
            const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
            if (0x1d000 <= uc && uc <= 0x1f77f) {
                returnValue = YES;
            }
        }
    } else if (self.length > 1) {
        const unichar ls = [self characterAtIndex:1];
        if (ls == 0x20e3) {
            returnValue = YES;
        }
    } else {
        // non surrogate
        if (0x2100 <= hs && hs <= 0x27ff) {
            returnValue = YES;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
            returnValue = YES;
        } else if (0x2934 <= hs && hs <= 0x2935) {
            returnValue = YES;
        } else if (0x3297 <= hs && hs <= 0x3299) {
            returnValue = YES;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
            returnValue = YES;
        }
    }
    
    return returnValue;
}

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter dateFromString:dateStr];
}

+ (NSString *)stringFromHourDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFromHourString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    return [formatter dateFromString:dateStr];
}


- (instancetype)formatString {
    
    NSString *dueDate = [self substringToIndex:12];
    NSString *year = [dueDate substringFromIndex:8];
    NSString *month = [self getMonthWithString:[dueDate substringToIndex:3]];
    NSString *day = [dueDate substringWithRange:NSMakeRange(4, 2)];
    
    return [NSString stringWithFormat:@"%@-%@-%@", year, month, day];
    
}

- (NSString *)getMonthWithString:(NSString *)month {
    if ([month isEqualToString:@"Jan"]) {
        return @"01";
    } else if ([month isEqualToString:@"Feb"]){
        return @"02";
    } else if ([month isEqualToString:@"Feb"]){
        return @"02";
    } else if ([month isEqualToString:@"Mar"]){
        return @"03";
    } else if ([month isEqualToString:@"Apr"]){
        return @"04";
    } else if ([month isEqualToString:@"May"]){
        return @"05";
    } else if ([month isEqualToString:@"Jun"]){
        return @"06";
    } else if ([month isEqualToString:@"Jul"]){
        return @"07";
    } else if ([month isEqualToString:@"Aug"]){
        return @"08";
    } else if ([month isEqualToString:@"Sep"]){
        return @"09";
    } else if ([month isEqualToString:@"Oct"]){
        return @"10";
    } else if ([month isEqualToString:@"Nov"]){
        return @"11";
    } else if ([month isEqualToString:@"Dec"]){
        return @"12";
    } else {
        return @"";
    }
}

- (instancetype)formatString2 {
    //设置转换格式     Mar 2, 2016 4:02:56 PM
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"MMM d, yyyy h:mm:ss aa"];
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:self];
    
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    //[dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    return currentDateString;
}



- (unsigned long long)fileSize
{
    // 总大小
    unsigned long long size = 0;
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路径是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) return size;
    
    if (isDirectory) { // 文件夹
        // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
    } else { // 文件
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}

+ (NSInteger)minuteOfCurrentTimeAndPastTime:(NSString *)pastTime {
    
    
    // 时间字符串
    NSString *str = pastTime;
    
    // 1.创建一个时间格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 2.格式化对象的样式/z大小写都行/格式必须严格和字符串时间一样
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    
    // 3.字符串转换成时间/自动转换0时区/东加西减
    NSDate *date = [formatter dateFromString:str];
    NSDate *now = [NSDate date];
    
    // 注意获取calendar,应该根据系统版本判断
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit type = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    
    // 4.获取了时间元素
    NSDateComponents *cmps = [calendar components:type fromDate:date toDate:now options:0];
    
    NSLog(@"%ld年%ld月%ld日%ld小时%ld分钟%ld秒钟", cmps.year, cmps.month, cmps.day, cmps.hour, cmps.minute, cmps.second);
    
    if (cmps.year == 0 && cmps.month == 0 && cmps.day == 0) {
        
        return cmps.hour *60 + cmps.minute;
    } else {
        return 666;
    }
}

- (NSString *)currencyString {
    NSInteger moneyStr = self.integerValue;
    NSInteger num = moneyStr/1000;
    NSString *str = self;
    while (num) {
        NSString *qitouText = [NSString stringWithFormat:@"%ld", (long)num];
        str = [str stringByReplacingCharactersInRange:NSMakeRange(qitouText.length, 0) withString:@","];
        num = num/1000;
    }
    return str;
}

- (NSString *)clearCommaSymbol {
    return [self stringByReplacingOccurrencesOfString:@"," withString:@""];
}

//删除所有空格
- (NSString *)removeAllBlankSpace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

-(BOOL)isTelphoneNum{
    // 正则表达式，^代表以什么开头 $代表以什么结尾 \\代表2位 []代表中间2位数可以选择的范围
    NSString *telRegex = @"^1[345678]\\d{9}$";
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    return [prediate evaluateWithObject:self];
}

@end
