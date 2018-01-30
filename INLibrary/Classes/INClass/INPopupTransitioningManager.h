//
//  INPopupTransitioningManager.h
//  INLibrary
//
//  Created by Inba on 2018/01/30.
//

#import <Foundation/Foundation.h>

@interface INPopupTransitioningManager : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>


-(instancetype)initWithFrame:(CGRect)frame;

@property (readonly,weak) UIView *dimView;
@property CGFloat animationDuration;

@end
