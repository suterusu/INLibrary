//
//  UIViewController+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import "UIViewController+INUtil.h"

@implementation UIViewController (INUtil)

-(void)showAlertAtTitle:(NSString *)title Message:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"CommonText_YES", nil) style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)showAlertAtTitle:(NSString *)title Message:(NSString *)message Yeshandler:(void (^ __nullable)(UIAlertAction *action))handler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"CommonText_YES", nil) style:UIAlertActionStyleDefault handler:handler]];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"CommonText_NO", nil) style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
