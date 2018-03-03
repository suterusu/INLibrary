//
//  INButton.m
//  BEMCheckBox
//
//  Created by Inba on 2018/02/06.
//

#import "INButton.h"

@implementation INButton



-(void)awakeFromNib{
    [super awakeFromNib];
    [self.titleLabel addObserver:self forKeyPath:@"textColor" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"cha%@",change);
    
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event{
    [super beginTrackingWithTouch:touch withEvent:event];
    [self setTintColor:[self.tintColor colorWithAlphaComponent:0.5]];
    self.highlighted = YES;
    //[self setTitleColor:[self.currentTitleColor colorWithAlphaComponent:0.3] forState:UIControlStateNormal];
    [self layoutIfNeeded];

    
    return YES;

}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event{
    BOOL isIn = [self hitTest:[touch locationInView:self] withEvent:event];
    if (isIn) {
        [self setTintColor:[self.tintColor colorWithAlphaComponent:0.3]];
        //[self setTitleColor:[self.currentTitleColor colorWithAlphaComponent:0.3] forState:UIControlStateNormal];
    }else{
        [self setTintColor:[self.tintColor colorWithAlphaComponent:1]];
        //[self setTitleColor:[self.currentTitleColor colorWithAlphaComponent:1] forState:UIControlStateNormal];
    }
    
    return [super continueTrackingWithTouch:touch withEvent:event];
}

- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event{
    [super endTrackingWithTouch:touch withEvent:event];

    [UIView transitionWithView:self
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.highlighted = NO;
                        [self setTintColor:[self.tintColor colorWithAlphaComponent:1]];
                        //[self setTitleColor:[self.currentTitleColor colorWithAlphaComponent:1] forState:UIControlStateNormal];
                        [self layoutIfNeeded];
                    } completion:nil];
    
}

-(void)cancelTrackingWithEvent:(UIEvent *)event{
    [super cancelTrackingWithEvent:event];
    [UIView transitionWithView:self
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.highlighted = NO;
                        [self setTintColor:[self.tintColor colorWithAlphaComponent:1]];
                        //[self setTitleColor:[self.currentTitleColor colorWithAlphaComponent:1] forState:UIControlStateNormal];
                        [self layoutIfNeeded];
                    } completion:nil];
}


@end

