//
//  UIScrollView+UIScrollView_Addition.m
//  StrenuousExercise
//
//  Created by admin on 2021/9/18.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "UIScrollView+UIScrollView_Addition.h"


static char const * const kse_emptyDataSetEnabled = "se_emptyDataSetEnabled";
static char const * const kse_emptyDataSetTitle = "se_emptyDataSetTitle";
static char const * const kse_emptyDataSetImg = "se_emptyDataSetImg";
static char const * const kse_emptyDataSetVerticalOffset = "se_emptyDataSetVerticalOffset";
static char const * const kse_emptyDataSetSpaceHeightForEmptyDataSet = "se_emptyDataSetSpaceHeightForEmptyDataSet";
static char const * const kse_emptyDataSetBgColor = "se_emptyDataSetBgColor";
static char const * const kse_emptyDataSetActionClosure = "se_emptyDataSetActionClosure";


@interface UITableView(noData)
@end
@implementation UITableView(noData)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            Method origin1 = class_getInstanceMethod(self, @selector(initWithCoder:));
            Method origin2 = class_getInstanceMethod(self, @selector(initWithFrame:));
            
            Method my1     = class_getInstanceMethod(self, @selector(se_initWithFrame:));
            Method my2     = class_getInstanceMethod(self, @selector(se_initWithCoder:));

            method_exchangeImplementations(origin1, my1);
            method_exchangeImplementations(origin2, my2);
        }
        
    });
}

- (instancetype)se_initWithFrame:(CGRect)frame
{
    id instance = [self se_initWithFrame:frame];
    NSLog(@"se_initWithFrame:%@",NSStringFromCGRect(frame));
    
    self.se_emptyDataSetEnabled = YES;
    return  instance;
}

- (instancetype)se_initWithCoder:(NSCoder *)coder
{
    id instance = [self se_initWithCoder:coder];
    NSLog(@"se_initWithCoder:%@",coder);
    
    self.se_emptyDataSetEnabled = YES;
    return instance;
}
@end

@interface UICollectionView(noData)
@end
@implementation UICollectionView(noData)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            Method origin1 = class_getInstanceMethod(self, @selector(initWithCoder:));
            Method origin2 = class_getInstanceMethod(self, @selector(initWithFrame:));
            
            Method my1     = class_getInstanceMethod(self, @selector(se_initWithFrame:));
            Method my2     = class_getInstanceMethod(self, @selector(se_initWithCoder:));

            method_exchangeImplementations(origin1, my1);
            method_exchangeImplementations(origin2, my2);
        }
        
    });
}

- (instancetype)se_initWithFrame:(CGRect)frame
{
    id instance = [self se_initWithFrame:frame];
    NSLog(@"se_initWithFrame:%@",NSStringFromCGRect(frame));
    
    self.se_emptyDataSetEnabled = YES;
    return  instance;
}

- (instancetype)se_initWithCoder:(NSCoder *)coder
{
    id instance = [self se_initWithCoder:coder];
    NSLog(@"se_initWithCoder:%@",coder);
    
    self.se_emptyDataSetEnabled = YES;
    return instance;
}
@end

@interface UIScrollView (UIScrollView_Addition)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@implementation UIScrollView (UIScrollView_Addition)

- (void)setSe_emptyDataSetEnabled:(BOOL)se_emptyDataSetEnabled
{
    
    objc_setAssociatedObject(self, kse_emptyDataSetEnabled, @(se_emptyDataSetEnabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (se_emptyDataSetEnabled)
    {
        self.emptyDataSetDelegate = self;
        self.emptyDataSetSource = self;
        [self reloadEmptyDataSet];
    }
    else
    {
        self.emptyDataSetDelegate = nil;
        self.emptyDataSetSource = nil;
    }
}

- (BOOL)se_emptyDataSetEnabled
{
    NSNumber * val = objc_getAssociatedObject(self, kse_emptyDataSetEnabled);
    return [val boolValue];
}

- (void)setSe_emptyDataSetTitle:(NSAttributedString *)se_emptyDataSetTitle
{
    objc_setAssociatedObject(self, kse_emptyDataSetTitle, se_emptyDataSetTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSAttributedString *)se_emptyDataSetTitle
{
    NSAttributedString * attr = objc_getAssociatedObject(self, kse_emptyDataSetTitle) ?: UIScrollView_emptyTitle ;
    return attr;
}

- (UIImage *)se_emptyDataSetImg
{
    UIImage * img =  objc_getAssociatedObject(self, kse_emptyDataSetImg) ?: UIScrollView_emptyImg;
    return  img;
}

- (void)setSe_emptyDataSetImg:(UIImage *)se_emptyDataSetImg
{
    objc_setAssociatedObject(self, kse_emptyDataSetImg, se_emptyDataSetImg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setSe_emptyDataSetVerticalOffset:(CGFloat)se_emptyDataSetVerticalOffset
{
    objc_setAssociatedObject(self, kse_emptyDataSetVerticalOffset, @(se_emptyDataSetVerticalOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)se_emptyDataSetVerticalOffset
{
    NSNumber * number = objc_getAssociatedObject(self, kse_emptyDataSetVerticalOffset);
    if (number != nil)
    {
        return [number doubleValue];
    }
    return 0;
}
- (CGFloat)se_emptyDataSetSpaceHeightForEmptyDataSet
{
    NSNumber * number = objc_getAssociatedObject(self, kse_emptyDataSetSpaceHeightForEmptyDataSet);
    if (number != nil)
    {
        return [number doubleValue];
    }
    return UIScrollView_emptyElementSpace;
}

- (void)setSe_emptyDataSetSpaceHeightForEmptyDataSet:(CGFloat)se_emptyDataSetSpaceHeightForEmptyDataSet
{
    objc_setAssociatedObject(self, kse_emptyDataSetSpaceHeightForEmptyDataSet, @(se_emptyDataSetSpaceHeightForEmptyDataSet), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)se_emptyDataSetBgColor
{
    UIColor * bgolor = objc_getAssociatedObject(self, kse_emptyDataSetBgColor) ?: UIScrollView_emptyBgColor;
    return bgolor;
}

- (void)setSe_emptyDataSetBgColor:(UIColor *)se_emptyDataSetBgColor
{
    objc_setAssociatedObject(self, kse_emptyDataSetBgColor, se_emptyDataSetBgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UISCrollView_ActionBlock)se_emptyDataSetActionClosure
{
    return objc_getAssociatedObject(self, kse_emptyDataSetActionClosure);
}
- (void)setSe_emptyDataSetActionClosure:(UISCrollView_ActionBlock)se_emptyDataSetActionClosure
{
    objc_setAssociatedObject(self, kse_emptyDataSetActionClosure, se_emptyDataSetActionClosure, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - UIScrollView+EmptyDataSet

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.se_emptyDataSetTitle;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.se_emptyDataSetImg;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.se_emptyDataSetBgColor;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    self.se_emptyDataSetActionClosure ? self.se_emptyDataSetActionClosure(scrollView) : nil;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.se_emptyDataSetSpaceHeightForEmptyDataSet;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.se_emptyDataSetVerticalOffset;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

@end


