//
//  UILabel+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import "UILabel+INUtil.h"

@implementation UILabel (INUtil)

- (void)adjustFontSizeToFitAtMaxFontSize:(CGFloat)max AtMinmumFontSize:(CGFloat)minmum Interval:(CGFloat)interval;
{
    if (self.text) {
        UIFont *font = self.font;
        CGSize size = self.frame.size;
        
        for (CGFloat maxSize = max; maxSize >= minmum; maxSize -= interval)
        {
            font = [font fontWithSize:maxSize];
            CGSize constraintSize = CGSizeMake(size.width, MAXFLOAT);
            self.numberOfLines = 0;
            CGSize labelSize = [self sizeThatFits:constraintSize];
            
            
            if(labelSize.height <= size.height)
            {
                self.font = font;
                break;
            }//
        }
        // set the font to the minimum size anyway
        self.font = font;
    }
}

@end
