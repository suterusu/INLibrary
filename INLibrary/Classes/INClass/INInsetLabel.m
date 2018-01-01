//
//  INInsetLabel.m
//  Pods
//
//  Created by Inba on 2017/12/26.
//
//

#import "INInsetLabel.h"
#import "INGeometry.h"

@implementation INInsetLabel

-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    CGRect defRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    return UIEdgeInsetsInsetRect(defRect, INEdgeOutsetMake(_inset));
}

- (void) drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _inset)];
}

@end
