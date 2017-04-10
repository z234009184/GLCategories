

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigation)

@property (nonatomic, strong) NSDictionary *inputParameter;
@property (nonatomic, copy) void (^outputTransmitter)(NSDictionary *parameter);

+ (UIViewController *)getRootViewControllerFromNavigationController:(UINavigationController *)navigationController;

@end
