//
//  UITextField+Login.h
//  chebaotong
//
//  Created by 张国梁 on 15/8/12.
//  Copyright (c) 2015年 张国梁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Login)
/**
 添加文件输入框左边的View,添加图片
 */
-(void)addLeftViewWithImage:(NSString *)image;

/**
 * 判断是否为手机号码
 */
-(BOOL)isTelphoneNum;

/**
 *  判断是否为邮箱
 */
- (BOOL)isEmail;


/**
 *  判断QQ号
 */
- (BOOL)isQQNumber;

/**
 *  判断固定电话号
 */
- (BOOL)isFixPhoneNumber;
/**
 *  判断身份证号
 */
- (BOOL)isIdNumber;

/**
 *  判断微信号
 */
- (BOOL)isWechatNumber;
/**
 * 判断密码是否是是6-16位且同时由数字和字母组成
 */
- (BOOL)isCorrectPassword;
/**
 * 判断营业执照
 */
-(BOOL)isBusinessLicense;
@end
