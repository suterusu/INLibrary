//
//  INBarView.h
//  INLibrary
//
//  Created by Inba on 2018/01/30.
//

#import <UIKit/UIKit.h>


/*
バーの上と下と真ん中に文字入れられる奴
 */
@interface INBarView : UIView


/*0~1*/
@property (nonatomic) float percent;

@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat barRightLeftCap;

@property (nonatomic) UIColor *barFrontColor;
@property (nonatomic) UIColor *barBackColor;

@property (nonatomic) NSString *topText;
@property (nonatomic) UIFont *topFont;

@property (nonatomic) NSString *middleText;
@property (nonatomic) UIFont *middleFont;

@property (nonatomic) NSString *bottomText;
@property (nonatomic) UIFont *bottomFont;

@end
