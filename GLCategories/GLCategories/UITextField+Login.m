//
//  UITextField+Login.m
//  chebaotong
//
//  Created by 张国梁 on 15/8/12.
//  Copyright (c) 2015年 张国梁. All rights reserved.
//

#import "UITextField+Login.h"

@implementation UITextField (Login)
-(void)addLeftViewWithImage:(NSString *)image{
    // 密码输入框左边图片
    UIImageView *lockIv = [[UIImageView alloc] init];
    
    // 设置尺寸
    CGRect imageBound = self.bounds;
    // 宽度高度一样
    imageBound.size.width = imageBound.size.height;
    lockIv.bounds = imageBound;
    
    // 设置图片
    lockIv.image = [UIImage imageNamed:image];
    
    // 设置图片居中显示
    lockIv.contentMode = UIViewContentModeCenter;
    
    // 添加TextFiled的左边视图
    self.leftView = lockIv;
    
    // 设置TextField左边的总是显示
    self.leftViewMode = UITextFieldViewModeAlways;
}
// 判断微信号
-(BOOL)isWechatNumber{
    NSString* phoneRegex = @"^[a-zA-Z0-9_]+$";
    NSPredicate* phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self.text];
}
// 判断QQ号
-(BOOL)isQQNumber{
    NSString* phoneRegex = @"^\\d{4,12}$";
    NSPredicate* phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self.text];
}
// 判断固定电话号
-(BOOL)isFixPhoneNumber{
    NSString* phoneRegex = @"^((\\d{3,4}\\-)|)\\d{7,8}(|([-\u8f6c]{1}\\d{1,5}))$";
    NSPredicate* phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self.text];
}
// 判断身份证号
-(BOOL)isIdNumber{
    NSString* phoneRegex = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$|^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate* phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self.text];
}
// 营业执照
-(BOOL)isBusinessLicense{
    NSString *telRegex = @"^\\d{15}$";
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    return [prediate evaluateWithObject:self.text];
}

-(BOOL)isTelphoneNum{
    // 正则表达式，^代表以什么开头 $代表以什么结尾 \\代表2位 []代表中间2位数可以选择的范围
    NSString *telRegex = @"^1[345678]\\d{9}$";
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    return [prediate evaluateWithObject:self.text];
}

// 判断密码是否是是6-16位且同时由数字和字母组成
- (BOOL)isCorrectPassword{
    NSString *pwdRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pwdRegex];
    return [predicate evaluateWithObject:self.text];
}

- (BOOL)isEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicate evaluateWithObject:self.text];
}

@end
