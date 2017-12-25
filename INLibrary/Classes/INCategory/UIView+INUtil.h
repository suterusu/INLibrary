//
//  UIView+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <UIKit/UIKit.h>

@interface UIView (INUtil)

- (id)findFirstResponder;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat x, y, width, height;
@property (nonatomic, assign) CGFloat left, top, right, bottom;
@property (nonatomic,readonly) CGPoint innerCenter;

@end
