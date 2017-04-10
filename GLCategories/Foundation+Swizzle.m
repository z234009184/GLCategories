//
//  Foundation+Swizzle.m
//  RuntimeSwizzle
//
//  Created by 张国梁 on 15/11/5.
//  Copyright © 2015年 CoderGL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

/** 只需要把此类加入工程中，不需要#import 妈妈再也不用担心数组字典的崩溃了 **/
@implementation NSObject (Swizzle) // swizzle 的意思是搅拌 就是交换的意思

/**
 *  通过运行时机制 为NSObject基类拓展一个类方法 来交换两个工厂方法(可以把系统的工厂方法交换掉)
 *
 *  @param class            类 （为哪个类交换方法）
 *  @param originalSelector 本身自己的方法
 *  @param otherSelector    要交换的方法
 */
+ (void)swizzleClassMethod:(Class)class originalSelector:(SEL)originalSelector otherSelector:(SEL)otherSelector {
    
    // 1.得到 自己本身的方法 (注意交换的是 类方法 即工厂方法)
    Method originalMethod = class_getClassMethod(class, originalSelector);
    // 2.得到 要交换的方法 (注意交换的是 类方法 即工厂方法)
    Method otherMethod = class_getClassMethod(class, otherSelector);
    
    // 3.进行方法交换(就是表面上调用的是自己的方法 实际上调用的是交换后的方法的实现) (注意交换的是 类方法 即工厂方法)
    method_exchangeImplementations(originalMethod, otherMethod);
}



/**
 *  通过运行时机制 为NSObject基类拓展一个类方法 来交换两个实例方法(可以把系统的对象方法交换掉)
 *
 *  @param class            类 （为哪个类交换方法）
 *  @param originalSelector 本身自己的方法
 *  @param otherSelector    要交换的方法
 */
+ (void)swizzleInstanceMethod:(Class)class originalSelector:(SEL)originalSelector otherSelector:(SEL)otherSelector {
    
    // 1.得到 自己本身的方法 (注意交换的是 对象方法 即工厂方法)
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    // 2.得到 要交换的方法 (注意交换的是 对象方法 即工厂方法)
    Method otherMethod = class_getInstanceMethod(class, otherSelector);
    
    // 3.进行方法交换(就是表面上调用的是自己的方法 实际上调用的是交换后的方法的实现) (注意交换的是 对象方法 即实例方法)
    method_exchangeImplementations(originalMethod, otherMethod);
}

@end

@implementation NSArray (Swizzle)
/**
 *  这个类一加载到内存当中就会调用(就是系统加载到内存中就会自动调用且只会调用一次，不用我们手动调用)
 */
+ (void)load {
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originalSelector:@selector(objectAtIndex:) otherSelector:@selector(otherObjectAtIndex:)];
}

/**
 *  要交换的方法
 */
- (id)otherObjectAtIndex:(NSUInteger)index {
    if (index <= self.count) {
        /* 能来到这里说明数组没有越界(之所以调用这个方法 是因为两个方法已经调换了 下面那句相当于调用原来的方法) */
        return [self otherObjectAtIndex:index];
    } else {
        NSLog(@"能来到这里说明数组越界了!!为了保证不崩溃返回是一个空相当于什么都没有做");
        return nil;
    }
}
@end

@implementation UIFont (Swizzle)
//+ (void)load {
//    [self swizzleClassMethod:[UIFont class] originalSelector:@selector(systemFontOfSize:) otherSelector:@selector(othersystemFontOfSize:)];
//    [self swizzleInstanceMethod:[UIFont class] originalSelector:@selector(fontWithSize:) otherSelector:@selector(otherFontWithSize:)];
//}

//+ (UIFont *)othersystemFontOfSize:(CGFloat)fontSize {
//    return [UIFont othersystemFontOfSize:fontSize * ([UIScreen mainScreen].scale * 0.5)];
//}
//- (UIFont *)otherFontWithSize:(CGFloat)fontSize {
//    return [self otherFontWithSize:fontSize * ([UIScreen mainScreen].scale * 0.5)];
//}

@end
