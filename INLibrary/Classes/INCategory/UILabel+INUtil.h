//
//  UILabel+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <UIKit/UIKit.h>

@interface UILabel (INUtil)


+(CGFloat)expectHeightForText:(NSString *)text Font:(UIFont *)font ByWidth:(CGFloat)width;
-(CGFloat)expectHeightForText:(NSString *)text ByWidth:(CGFloat)width;

//現在のUILabelでギリギリ収まるまでフォントサイズを小さくする
//return 現在の高さ内に収まったら-1 そうでない場合は、minmumのフォントでギリギリ入る高さ
- (CGFloat)adjustFontSizeToFitAtMaxFontSize:(CGFloat)max AtMinmumFontSize:(CGFloat)minmum Interval:(CGFloat)interval;

@end
