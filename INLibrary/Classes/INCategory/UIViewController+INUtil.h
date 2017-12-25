//
//  UIViewController+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (INUtil)

-(void)showAlertAtTitle:(NSString *)title Message:(NSString *)message;

-(void)showAlertAtTitle:(NSString *)title Message:(NSString *)message Yeshandler:(void (^)(UIAlertAction *action))handler;

@end
