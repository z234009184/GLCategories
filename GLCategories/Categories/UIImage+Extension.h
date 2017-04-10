

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (instancetype)resizedImage:(NSString *)imageName;

/** 返回一张 1＊1 像素的纯色image */
+ (instancetype)imageWithColor:(UIColor *)color;


//name:图片名 borderWidth:圆环宽度 borderColor:圆环颜色
+ (instancetype)cicleImageWithName:(NSString *)name borderWidth:(CGFloat )borderWidth borderColor:(UIColor *)borderColor;
//无环裁剪    name:图片名
+ (instancetype)cicleImageWithName:(NSString *)Name;

- (instancetype)circleImage;


+ (UIImage *)bankImageWithName:(NSString *)name;
@end
