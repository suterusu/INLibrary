//
//  INSlideTabbarController.m
//  INLibrary
//
//  Created by Inba on 2018/08/15.
//

#import "INSlideTabbarController.h"

typedef NS_ENUM(NSUInteger,INSlideTabbarControllerSlideDirection){
    INSlideTabbarControllerSlideDirectionFromLeftToRight,
    INSlideTabbarControllerSlideDirectionFromRightToLeft
};

@interface INSlideTabbarController ()<UITabBarControllerDelegate,UIViewControllerAnimatedTransitioning>

@end

@implementation INSlideTabbarController

-(id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSInteger indexFrom = [self.viewControllers indexOfObject:fromVC];
    NSInteger indexTo = [self.viewControllers indexOfObject:toVC];

    [containerView insertSubview:toView aboveSubview:fromView];
    
    INSlideTabbarControllerSlideDirection direction = (indexTo > indexFrom)?INSlideTabbarControllerSlideDirectionFromRightToLeft:INSlideTabbarControllerSlideDirectionFromLeftToRight;

    CGRect firstToVCFrame = toView.bounds;
    switch (direction) {
        case INSlideTabbarControllerSlideDirectionFromRightToLeft:{
            firstToVCFrame.origin = CGPointMake(containerView.frame.size.width, 0);
            break;}
        case INSlideTabbarControllerSlideDirectionFromLeftToRight:{
            firstToVCFrame.origin = CGPointMake(-containerView.frame.size.width, 0);
            break;}
    }
    toView.frame = firstToVCFrame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        CGRect fromViewNextRect = fromView.frame;
        CGRect toViewNextRect = toView.frame;

        CGFloat movementAbs = containerView.frame.size.width;
        switch (direction) {
            case INSlideTabbarControllerSlideDirectionFromRightToLeft:{
                fromViewNextRect.origin = CGPointMake(fromViewNextRect.origin.x - movementAbs, 0);
                toViewNextRect.origin = CGPointMake(toViewNextRect.origin.x - movementAbs, 0);
                break;}
            case INSlideTabbarControllerSlideDirectionFromLeftToRight:{
                fromViewNextRect.origin = CGPointMake(fromViewNextRect.origin.x + movementAbs, 0);
                toViewNextRect.origin = CGPointMake(toViewNextRect.origin.x + movementAbs, 0);
                break;}
        }
        toView.frame = toViewNextRect;
        fromView.frame = fromViewNextRect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
