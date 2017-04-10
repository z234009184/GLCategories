//
//  PopoverView.h
//  Embark
//
//  Created by Oliver Rickard on 20/08/2012.
//
//

#import <UIKit/UIKit.h>

@class PopoverView;

@protocol PopoverViewDelegate <NSObject>

@optional

//Delegate receives this call as soon as the item has been selected
- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index;

//Delegate receives this call once the popover has begun the dismissal animation
- (void)popoverViewDidDismiss:(PopoverView *)popoverView;

@end

@interface PopoverView : UIView {
    CGRect boxFrame;
    CGSize contentSize;
    CGPoint arrowPoint;
    
    BOOL above;
    
    id<PopoverViewDelegate> delegate;
    
    NSArray *subviewsArray;
    
    NSArray *dividerRects;
    
    UIView *contentView;
    
    UIView *titleView;
    
    UIActivityIndicatorView *activityIndicator;
    
    BOOL showDividerRects;
}

@property (nonatomic, retain) UIView *titleView;

@property (nonatomic, retain) UIView *contentView;

@property (nonatomic, retain) NSArray *subviewsArray;
@property (nonatomic, strong) UIColor *boxColor;


- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)contentView;


#pragma mark - Dismissal
//Dismisses the view, and removes it from the view stack.
- (void)dismiss;



@end
