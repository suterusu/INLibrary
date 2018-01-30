//
//  INBarView.m
//  INLibrary
//
//  Created by Inba on 2018/01/30.
//

#import "INBarView.h"


@interface INBarView ()

@property (weak,nonatomic) UILabel *topLabel;

@end

@implementation INBarView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect{
    CGContextRef con =  UIGraphicsGetCurrentContext();
    CGRect labelText = [@"aaaa" boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil];
    [@"aaaa" drawInRect:rect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]}];
    
    UIBezierPath *bar = [UIBezierPath bezierPathWithRoundedRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(labelText.size.height, 0, 0, 0)) cornerRadius:5];
    [[UIColor grayColor] setFill];
    [bar fill];

    
}
@end
