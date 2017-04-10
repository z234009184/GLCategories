//
//  UIAlertController+Block.h
//  MengKe
//
//  Created by 陈园 on 16/2/24.
//  Copyright © 2016年 chends. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Block)


+ (void)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)style sureBtnTitle:(NSString *)sureTitle sureBlock:(void(^)())sureBlock cancelBtnTitle:(NSString *)cancelTitle cancelBlock:(void(^)())cancelBlock showVc:(UIViewController *)showVc;


+ (void)alertNoticeWithMessage:(NSString *)message sureblock:(void (^)(void))sureblock cancelblock:(void (^)(void))cancelblock viewController:(UIViewController *)viewController;
/**
 *  提示确认
 *
 *  @param message   标题
 *  @param sureblock 确认操作
 *
 *  @return UIAlertController
 */
+(UIAlertController *)alertSureWithMessage:(NSString *)message sureblock:(void (^)(void))sureblock;

@end
