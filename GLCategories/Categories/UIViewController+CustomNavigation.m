

#import "UIViewController+CustomNavigation.h"

#import <objc/runtime.h>

static const void *inputParameter = &inputParameter;
static const void *outputTransmitter = &outputTransmitter;

@implementation UIViewController (CustomNavigation)

@dynamic inputParameter;
@dynamic outputTransmitter;

+ (UIViewController *)getRootViewControllerFromNavigationController:(UINavigationController *)navigationController
{
    return [navigationController.viewControllers objectAtIndex:0];
}

- (NSDictionary *)inputParameter
{
    return objc_getAssociatedObject(self, inputParameter);
}

- (void)setInputParameter:(NSDictionary *)aInputParameter
{
    objc_setAssociatedObject(self, inputParameter, aInputParameter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(NSDictionary *parameter))outputTransmitter
{
    return objc_getAssociatedObject(self, outputTransmitter);
}

- (void)setOutputTransmitter:(void (^)(NSDictionary *parameter))aOutputTransmitter
{
    return objc_setAssociatedObject(self, outputTransmitter, aOutputTransmitter, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)executeOutputTransmitter:(NSDictionary *)parameter
{
    if (self.outputTransmitter) {
        self.outputTransmitter(parameter);
    }
}

@end
