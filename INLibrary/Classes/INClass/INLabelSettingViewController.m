//
//  INLabelSettingViewController.m
//  INLabelTextChanger
//
//  Created by Inba on 2018/04/30.
//  Copyright © 2018年 Inba. All rights reserved.
//

#import "INLabelSettingViewController.h"
#import "INPopupTransitionAnimator.h"



@interface INLabelSettingViewController ()<UIViewControllerTransitioningDelegate,UITextFieldDelegate>

@property (weak,nonatomic) UILabel *label;
@property (weak,nonatomic) UIView *base;
@property (weak,nonatomic) UITextField *textView;

@end

@implementation INLabelSettingViewController

+(INLabelSettingViewController *)makeVCAtLabel:(UILabel *)label BaseView:(UIView *)base{
    INLabelSettingViewController *vc = [[INLabelSettingViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.transitioningDelegate = vc;

    UIView *aa = [base snapshotViewAfterScreenUpdates:YES];
    [vc.view addSubview:aa];
    
    
    UILabel *fakeLabel = [[UILabel alloc]init];
    fakeLabel.font = label.font;
    fakeLabel.textColor = label.textColor;
    fakeLabel.backgroundColor = [UIColor whiteColor];
    fakeLabel.frame = [base convertRect:label.frame toView:label.superview];
    [vc.view addSubview:fakeLabel];
    vc.label = fakeLabel;
    vc.boundsChangeReasonView = vc.label;
    
    UITextField *textView = [[UITextField alloc]initWithFrame:CGRectZero];
    textView.center = vc.label.center;
    textView.bounds = CGRectMake(0, 0, 0, fakeLabel.frame.size.height);
    [vc.view addSubview:textView];
    vc.textView = textView;
    
    return vc;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            [self.delegate aa:textField.text];
        }];
    });
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.label.text = text;
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.boundsChangeReasonView = self.label;
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
    self.textView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)prefersStatusBarHidden{
    return [UIApplication sharedApplication].statusBarHidden;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
