//
//  INPopupTransitionAnimator.m
//  Pods
//
//  Created by Inba on 2018/01/07.
//
//

#import "INPopupTransitionAnimator.h"

@interface INPopupTransitionAnimator ()<CAAnimationDelegate>{
    id<UIViewControllerContextTransitioning> _transitionContext;
}

@end

@implementation INPopupTransitionAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _animationDuration = 0.15;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return _animationDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect endRect = [transitionContext finalFrameForViewController:toVC];
    
    
    if (fromView == nil) {
        toView.alpha = 0;
        toView.backgroundColor = [UIColor colorWithWhite:0 alpha:.6];
        [containerView addSubview:toView];
        [UIView animateWithDuration:_animationDuration animations:^{
            toView.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    }else{
        [UIView animateWithDuration:_animationDuration animations:^{
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
