//
//  INGeometry.h
//  Pods
//
//  Created by Inba on 2017/12/26.
//
//
#import <UIKit/UIGeometry.h>

/*
#ifndef INGeometry_h
#define INGeometry_h
*/


static inline UIEdgeInsets INEdgeOutsetMake(UIEdgeInsets inset) {
    UIEdgeInsets outsets = {-inset.top, -inset.left, -inset.bottom, -inset.right};
    return outsets;
}


static inline CGFloat INPointsDistance(CGPoint originX,CGPoint originY) {
    CGFloat xDistance = originX.x - originY.x;
    CGFloat yDistance = originX.y - originY.y;
    CGFloat distance = sqrtf(xDistance*xDistance + yDistance*yDistance);
    return distance;
}


static inline CGFloat INPointAndRectDistance(CGPoint point,CGRect rect) {
    // first of all, we check if point is inside rect. If it is, distance is zero
    if (CGRectContainsPoint(rect, point)) return 0.f;
    
    // next we see which point in rect is closest to point
    CGPoint closest = rect.origin;
    if (rect.origin.x + rect.size.width < point.x)
        closest.x += rect.size.width; // point is far right of us
    else if (point.x > rect.origin.x)
        closest.x = point.x; // point above or below us
    if (rect.origin.y + rect.size.height < point.y)
        closest.y += rect.size.height; // point is far below us
    else if (point.y > rect.origin.y)
        closest.y = point.y; // point is straight left or right
                    
    // we've got a closest point; now pythagorean theorem
    // distance^2 = [closest.x,y - closest.x,point.y]^2 + [closest.x,point.y - point.x,y]^2
    // i.e. [closest.y-point.y]^2 + [closest.x-point.x]^2
    CGFloat a = powf(closest.y-point.y, 2.f);
    CGFloat b = powf(closest.x-point.x, 2.f);
    return sqrtf(a + b);
}


//#endif /* INGeometry_h */
