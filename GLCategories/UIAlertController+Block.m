//
//  UIAlertController+Block.m
//  MengKe
//
//  Created by 陈园 on 16/2/24.
//  Copyright © 2016年 chends. All rights reserved.
//

#import "UIAlertController+Block.h"

@implementation UIAlertController (Block)

+ (void)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)style sureBtnTitle:(NSString *)sureTitle sureBlock:(void(^)())sureBlock cancelBtnTitle:(NSString *)cancelTitle cancelBlock:(void(^)())cancelBlock showVc:(UIViewController *)showVc {
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    [alertVc addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }]];
    
    [alertVc addAction:[UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock) {
            sureBlock();
        }
    }]];
    [showVc presentViewController:alertVc animated:YES completion:nil];
    
}

+ (void)alertNoticeWithMessage:(NSString *)message sureblock:(void (^)(void))sureblock cancelblock:(void (^)(void))cancelblock viewController:(UIViewController *)viewController {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^
                        (UIAlertAction * _Nonnull action) {
                            
                            if (cancelblock) {
                                cancelblock();
                                [alertVC dismissViewControllerAnimated:YES completion:nil];
                            }
                        }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureblock) {
            sureblock();
            [alertVC dismissViewControllerAnimated:YES completion:nil];
        }
    }]];
    [viewController presentViewController:alertVC animated:YES completion:nil];
    
    //    return alertVC;
    
}

+ (UIAlertController *)alertSureWithMessage:(NSString *)message sureblock:(void (^)(void))sureblock{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureblock) {
            sureblock();
        }
    }]];
    return alertVC;
}



@end
