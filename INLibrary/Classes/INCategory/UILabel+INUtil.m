//
//  UILabel+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import "UILabel+INUtil.h"
#import "UIView+INUtil.h"

@implementation UILabel (INUtil)

+(CGFloat)expectHeightForText:(NSString *)text Font:(UIFont *)font ByWidth:(CGFloat)width{
    UILabel *label =  [[self alloc]init];
    label.text = text;
    label.font = font;
    return [label textRectForBounds:CGRectMake(0, 0, width, CGFLOAT_MAX) limitedToNumberOfLines:0].size.height;
}

-(CGFloat)expectHeightForText:(NSString *)text ByWidth:(CGFloat)width{
    NSString *preText = self.text;
    self.text = text;
    CGFloat expectHeight = [self textRectForBounds:CGRectMake(0, 0, width, CGFLOAT_MAX) limitedToNumberOfLines:0].size.height;
    self.text = preText;
    return expectHeight;
}

- (CGFloat)adjustFontSizeToFitAtMaxFontSize:(CGFloat)max AtMinmumFontSize:(CGFloat)minmum Interval:(CGFloat)interval;
{
    CGFloat idealHeight = 0;
    if (self.text) {
        CGSize size = self.frame.size;
        
        for (CGFloat fontSize = max; fontSize >= minmum; fontSize -= interval)
        {
            self.font = [self.font fontWithSize:fontSize];
            CGRect textRect = [self textRectForBounds:CGRectMake(0, 0, self.width, MAXFLOAT) limitedToNumberOfLines:0];
            idealHeight = textRect.size.height;
            if(textRect.size.height <= size.height)
            {
                return self.height;
            }
        }
    }
    
    return idealHeight;
}

@end
