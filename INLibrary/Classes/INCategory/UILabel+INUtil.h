//
//  UILabel+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <UIKit/UIKit.h>

@interface UILabel (INUtil)

//現在のUILabelでギリギリ収まるまでフォントサイズを小さくする
- (void)adjustFontSizeToFitAtMaxFontSize:(CGFloat)max AtMinmumFontSize:(CGFloat)minmum Interval:(CGFloat)interval;

@end
