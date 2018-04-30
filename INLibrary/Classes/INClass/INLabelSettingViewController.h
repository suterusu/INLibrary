//
//  INLabelSettingViewController.h
//  INLabelTextChanger
//
//  Created by Inba on 2018/04/30.
//  Copyright © 2018年 Inba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBKeyboardViewController.h"

@protocol INLabelSettingViewControllerDelegate

-(void)aa:(NSString *)text;

@end


@interface INLabelSettingViewController : MBKeyboardViewController

@property (weak,nonatomic) id<INLabelSettingViewControllerDelegate> delegate;

+(INLabelSettingViewController *)makeVCAtLabel:(UILabel *)label BaseView:(UIView *)base;
@end
