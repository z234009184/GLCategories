//
//  JYQConst.h
//  JYQ
//
//  Created by 中再融 on 16/10/12.
//  Copyright © 2016年 中再融. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JYQConst : NSObject

UIKIT_EXTERN NSString *const SinaAppKey;  // 新浪Appkey
UIKIT_EXTERN NSString *const SinaSecret;  // 新浪Secret
UIKIT_EXTERN NSString *const UMSocialAppKey;  // 友盟Appkey
UIKIT_EXTERN NSString *const QQAppID;    // QQ
UIKIT_EXTERN NSString *const QQAppKey;   // QQ

UIKIT_EXTERN NSString *const WeiXinAppID;   // 微信 AppID
UIKIT_EXTERN NSString *const WeiXinAppSecret; // 微信 AppSecret

UIKIT_EXTERN BOOL backToHome;

//
#define PAGESIZE 20
// 是否已经开启手势解锁
#define hadSetLockVC @"hadSetLockVC"

//按钮圆角
#define BtncornerRadius 4
//红色按钮颜色
#define RedBackgroundColor [UIColor colorFromHexRGB:@"fd544a"]
//灰色小背景
#define GrayBackgroundColor [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1]

/****************注册系统通知****************/
//登录成功
#define LOGIN_SUCCESS @"LOGIN_SUCCESS"
//登出成功
#define LOGOUT_SUCCESS @"LOGOUT_SUCCESS"
// 投资成功
#define INVEST_SUCCESS @"INVEST_SUCCESS"
// 投资失败
#define INVEST_FAILRE @"INVEST_FAILRE"
// 充值成功
#define RECHARGE_SUCCESS @"RECHARGE_SUCCESS"
// 提现成功
#define TAKECASH_SUCCESS @"TAKECASH_SUCCESS"

#define OPENACCOUNT_SUCCESS @"OPENACCOUNTSUCCESS"

#define JYQChangeRootVc @"JYQChangeRootVc"

// 兑换现金卡券/特权金成功
#define EXCHANGECASHCOUPON_SUCCESS @"EXCHANGECASHCOUPONSUCCESS"

#define lastTimeOfGetCaptche @"lastTimeOfGetCaptche"

// 系统版本是否是iOS10以后的版本
#define IOS_VERSION_10 (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max)?(YES):(NO)

// 用户登录后存储用户信息的沙河路径
#define userInfoPath  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"userInfo.plist"]


/**
 *  view及样式
 */

#define Screen_Width     [UIScreen mainScreen].bounds.size.width
#define Screen_Height    [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE      [UIScreen mainScreen].bounds
#define TABBAR_HEIGHT 49
#define NAVBAR_HEIGHT 64
#define IPHONE6_WIDTH 375.0
#define IPHONE6_HEIGHT 667.0
#define IS_IPHONE5       ([UIScreen mainScreen].bounds.size.height == 568.0 ? YES : NO)


/**
 *  color
 */
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
// 随机色
#define RANDOMCOlOR RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))




/**
 *  缩写
 */
#define uDefault [NSUserDefaults standardUserDefaults]
#define fileMng [NSFileManager defaultManager]
#define curVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define appDelegate (AppDelegate*)[UIApplication sharedApplication].delegate
#define RootViewController [UIApplication sharedApplication].keyWindow.rootViewController
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow
// 获得当前版本号
#define VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
/**
 *  path
 */
#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define CACHES_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


// 调试打印
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[类:%s %d行]%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

// 创建单例对象

// .h文件
#define SingletonH(name) + (instancetype)shared##name;

// .m文件
#if __has_feature(objc_arc)

#define SingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}

#else

#define SingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return 1;} \
- (id)autorelease { return self;}

#endif
@end
