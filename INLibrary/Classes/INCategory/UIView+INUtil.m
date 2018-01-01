//
//  UIView+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import "UIView+INUtil.h"

@implementation UIView (INUtil)

- (id)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        
        if ([subView isFirstResponder]) {
            return subView;
        }
        
        UIView *responder = [subView findFirstResponder];
        if (responder) {
            return responder;
        }
    }
    
    return nil;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

-(CGPoint)innerCenter{
    return CGPointMake(self.width/2, self.height/2);
}

- (void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}



-(CGPoint)topRight{
    return CGPointMake(self.right, self.top);
}

-(CGPoint)topLeft{
    return CGPointMake(self.left, self.top);
}

-(CGPoint)bottomRight{
    return CGPointMake(self.right, self.bottom);
}

-(CGPoint)bottomLeft{
    return CGPointMake(self.left, self.bottom);
}

-(CGRect)expandedFrameTop:(CGFloat)top Left:(CGFloat)left Bottom:(CGFloat)bottom Right:(CGFloat)right{
    return UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(-top, -left, -bottom, -right));
}

@end
