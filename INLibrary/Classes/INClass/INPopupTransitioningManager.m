//
//  INPopupTransitioningManager.m
//  INLibrary
//
//  Created by Inba on 2018/01/30.
//

#import "INPopupTransitioningManager.h"
#import <UIKit/UIKit.h>

@interface INPopupTransitionPresentationController : UIPresentationController

@property CGRect containerFrame;
@property (weak) UIView *dimView;

@end


@implementation INPopupTransitionPresentationController

-(CGRect)frameOfPresentedViewInContainerView{
    return self.containerFrame;
}

-(void)presentationTransitionWillBegin{
    UIView *dimView = [[UIView alloc]initWithFrame:self.containerView.bounds];
    dimView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [self.containerView addSubview:dimView];
    dimView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    dimView.tag = 1;
    _dimView = dimView;
}

-(void)dismissalTransitionWillBegin{
    UIView *dimView = [self.containerView viewWithTag:1];
    id<UIViewControllerTransitionCoordinator> tc = self.presentedViewController.transitionCoordinator;
    [tc animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        dimView.backgroundColor  = [UIColor colorWithWhite:0 alpha:0];
    } completion:nil];
}

@end


@interface INPopupTransitioningManager (){
    CGRect _screenFrame;
}

@property (weak,nonatomic) INPopupTransitionPresentationController *popupTransitionPresentationController;


@end

@implementation INPopupTransitioningManager

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (!self) {
        return nil;
    }
    _screenFrame = frame;
    _animationDuration = 0.3;
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return _animationDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect endRect = [transitionContext finalFrameForViewController:toVC];
    
    
    if (fromView == nil) {
        toView.frame = endRect;
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

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _screenFrame = dismissed.view.frame;
    return self;
}

-(UIView *)dimView{
    return _popupTransitionPresentationController.dimView;
}

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    INPopupTransitionPresentationController *presentationController = [[INPopupTransitionPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    presentationController.containerFrame = _screenFrame;
    _popupTransitionPresentationController = presentationController;
    return presentationController;
}


@end
