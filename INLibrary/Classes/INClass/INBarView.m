//
//  INBarView.m
//  INLibrary
//
//  Created by Inba on 2018/01/30.
//

#import "INBarView.h"

#define INBarViewTextAndBarSpace 3

@interface INBarView ()

@property (weak,nonatomic) UILabel *topLabel;

@end

@implementation INBarView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultSetup];
    }
    
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultSetup];

    }
    return self;
}

-(void)defaultSetup{
    self.opaque = NO;
    self.backgroundColor = [UIColor clearColor];
    self.topFont = [UIFont systemFontOfSize:10];
    self.middleFont = [UIFont systemFontOfSize:10];
    self.bottomFont = [UIFont systemFontOfSize:10];
    self.barBackColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.barFrontColor = [UIColor redColor];
    self.cornerRadius = 2;
    self.barRightLeftCap = 7;
}

-(void)drawRect:(CGRect)rect{
    CGSize topLabelSize = self.topText?[self.topText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.topFont} context:nil].size:CGSizeZero;
    CGSize middleLabelSize = self.middleText?[self.middleText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.middleFont} context:nil].size:CGSizeZero;
    CGSize bottomLabelSize = self.bottomText?[self.bottomText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.bottomFont} context:nil].size:CGSizeZero;
    
    CGFloat topSpaceFromBar = topLabelSize.height>0?topLabelSize.height + INBarViewTextAndBarSpace:0;
    CGFloat bottomSpaceFromBar = bottomLabelSize.height>0?bottomLabelSize.height + INBarViewTextAndBarSpace:0;
    
    CGRect barRect = UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(topSpaceFromBar, self.barRightLeftCap, bottomSpaceFromBar, self.barRightLeftCap));
    
    
    NSMutableParagraphStyle *paragrahpStyle = [[NSMutableParagraphStyle alloc]init];
    paragrahpStyle.alignment = NSTextAlignmentCenter;
    if (self.topText) {
        
        [self.topText drawInRect:CGRectMake((rect.size.width - topLabelSize.width)/2.0, 0, topLabelSize.width, topLabelSize.height) withAttributes:@{NSFontAttributeName:self.topFont,NSParagraphStyleAttributeName:paragrahpStyle}];
    }
    
    if (self.bottomText) {
        NSMutableParagraphStyle *paragrahpStyle = [[NSMutableParagraphStyle alloc]init];
        paragrahpStyle.alignment = NSTextAlignmentCenter;
        
        [self.bottomText drawInRect:CGRectMake((rect.size.width - bottomLabelSize.width)/2.0, CGRectGetMaxY(barRect) + INBarViewTextAndBarSpace, bottomLabelSize.width, bottomLabelSize.height) withAttributes:@{NSFontAttributeName:self. bottomFont,NSParagraphStyleAttributeName:paragrahpStyle}];
    }
    
    UIBezierPath *back = [UIBezierPath bezierPathWithRoundedRect:barRect cornerRadius:self.cornerRadius];
    [self.barBackColor setFill];
    [back fill];
    
    if (self.middleText) {
        [self.middleText drawInRect:CGRectMake((rect.size.width - middleLabelSize.width)/2.0, CGRectGetMidY(barRect) - middleLabelSize.height / 2.0, middleLabelSize.width, middleLabelSize.height) withAttributes:@{NSFontAttributeName:self. middleFont,NSParagraphStyleAttributeName:paragrahpStyle}];
    }
    
    CGRect frontRect = UIEdgeInsetsInsetRect(barRect, UIEdgeInsetsMake(barRect.size.height*(1 - self.percent), 0, 0, 0));

    UIBezierPath *front = [UIBezierPath bezierPathWithRoundedRect:frontRect byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    [self.barFrontColor setFill];
    [front fillWithBlendMode:kCGBlendModeSourceAtop alpha:1];

    
}
@end
