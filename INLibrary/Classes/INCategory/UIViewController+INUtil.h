//
//  UIViewController+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (INUtil)

+(UIViewController *)topParentViewController;

-(void)showAlertAtTitle:(NSString *)title Message:(NSString *)message;

-(void)showAlertAtTitle:(NSString *)title Message:(NSString *)message Forcehandler:(void (^)(UIAlertAction *action))handler;

-(void)showAlertAtTitle:(NSString *)title Message:(NSString *)message Yeshandler:(void (^)(UIAlertAction *action))handler;

@end
