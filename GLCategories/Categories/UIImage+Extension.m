

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (instancetype)resizedImage:(NSString *)imageName 
{
    UIImage *image = [UIImage imageNamed:imageName];
    image =  [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5) resizingMode:UIImageResizingModeStretch];
    
    return image;
}


+ (instancetype)imageWithColor:(UIColor *)color {
    
    // 开启图片上下文
    CGSize imageSize = CGSizeMake(1.0, 1.0);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 得到上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画矩形
    CGContextAddRect(ctx, CGRectMake(0, 0, imageSize.width, imageSize.height));
    
    // 设置颜色
    [color set];
    
    // 渲染
    CGContextFillPath(ctx);
    
    // 从当前上下文取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


//name:图片名 borderWidth:圆环宽度 borderColor:圆环颜色
+(instancetype)cicleImageWithName:(NSString *)name borderWidth:(CGFloat )borderWidth borderColor:(UIColor *)borderColor{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;     CGFloat imageH = oldImage.size.height + 2 * borderWidth;     CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 4.画边框(大圆)
    [borderColor set];     CGFloat bigRadius = imageW * 0.5;
    // 大圆半径
    CGFloat centerX = bigRadius;
    // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);     CGContextFillPath(ctx);
    // 画圆
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 8.结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}
//无环裁剪    name:图片名
+ (instancetype)cicleImageWithName:(NSString *)name {
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    // 2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 4.画圆
    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);     CGContextAddEllipseInRect(ctx, circleRect);
    // 5.按照当前的路径形状(圆形)裁剪, 超出这个形状以外的内容都不显示
    CGContextClip(ctx);
    // 6.画图
    [oldImage drawInRect:circleRect];
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 8.结束
    UIGraphicsEndImageContext();
    return newImage;
}

- (instancetype)circleImage
{
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [self drawInRect:rect];
    
    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}


+ (UIImage *)bankImageWithName:(NSString *)name {
    UIImage *image;
    if ([name containsString:@"工商"]) {
        image = [UIImage imageNamed:@"gongshang"];
    } else if ([name containsString:@"农业"]) {
        image = [UIImage imageNamed:@"nongye"];
    } else if ([name containsString:@"中国"]) {
        image = [UIImage imageNamed:@"zhongguo"];
    } else if ([name containsString:@"建设"]) {
        image = [UIImage imageNamed:@"jianshe"];
    } else if ([name containsString:@"邮储"]) {
        image = [UIImage imageNamed:@"youchu"];
    } else if ([name containsString:@"中信"]) {
        image = [UIImage imageNamed:@"zhongxin"];
    } else if ([name containsString:@"光大"]) {
        image = [UIImage imageNamed:@"guangda"];
    } else if ([name containsString:@"平安"]) {
        image = [UIImage imageNamed:@"pingan"];
    } else if ([name containsString:@"交通"]) {
        image = [UIImage imageNamed:@"jiaotong"];
    } else if ([name containsString:@"兴业"]) {
        image = [UIImage imageNamed:@"xingye"];
    } else if ([name containsString:@"民生"]) {
        image = [UIImage imageNamed:@"minsheng"];
    } else if ([name containsString:@"招商"]) {
        image = [UIImage imageNamed:@"zhaoshang"];
    } else if ([name containsString:@"浦发"]) {
        image = [UIImage imageNamed:@"pufa"];
    } else if ([name containsString:@"上海"]) {
        image = [UIImage imageNamed:@"shanghai"];
    } else if ([name containsString:@"华夏"]) {
        image = [UIImage imageNamed:@"huaxia"];
    } else if ([name containsString:@"广发"]) {
        image = [UIImage imageNamed:@"guangfa"];
    } else {
        image = [UIImage imageNamed:@""];
    }
    return image;
}

@end
