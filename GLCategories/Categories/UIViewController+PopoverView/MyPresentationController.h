//
//  MyPresentationController.h
//  LAB
//
//  Created by 张国梁 on 16/9/9.
//  Copyright © 2016年 LAB. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CoverView : UIView
@end
@interface MyPresentationController : UIPresentationController
@property (strong, nonatomic) CoverView *coverView; // 蒙板

@property (assign, nonatomic) CGRect presentFrame; // 弹出视图的frame
@end
