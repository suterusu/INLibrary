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


static inline UIEdgeInsets UIEdgeOutsetMake(UIEdgeInsets inset) {
    UIEdgeInsets outsets = {-inset.top, -inset.left, -inset.bottom, -inset.right};
    return outsets;
}

//#endif /* INGeometry_h */
