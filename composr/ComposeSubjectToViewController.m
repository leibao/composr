//
//  ComposeSubjectToViewController.m
//  composr
//
//  Created by Lei Bao on 6/19/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "ComposeSubjectToViewController.h"
#import "ChooseTypeViewController.h"
#import "ListViewController.h"


@interface ComposeSubjectToViewController ()
@property (weak, nonatomic) IBOutlet UIView *inputFields;
@property (weak, nonatomic) IBOutlet UITextField *subjectField;
@property (weak, nonatomic) IBOutlet UITextField *toField;
@property (weak, nonatomic) IBOutlet UIView *buttonBar;

@property (strong, nonatomic) IBOutlet UIView *wholeView;

- (IBAction)onTap:(id)sender;
- (IBAction)onNext:(id)sender;
- (IBAction)onSwipeDown:(id)sender;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation ComposeSubjectToViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
}

- (IBAction)onNext:(id)sender {
    //load Choose Type page
    ChooseTypeViewController *chooseTypeVC = [[ChooseTypeViewController alloc] init];
    //UINavigationController *nac = [[UINavigationController alloc] initWithRootViewController:chooseTypeVC];
    //UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    //self.navigationItem.leftBarButtonItem = backButton;
    
    chooseTypeVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:chooseTypeVC animated:YES completion:nil];
    
}

- (IBAction)onSwipeDown:(id)sender {
    
//    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
//        self.wholeView.frame = CGRectMake(0, self.wholeView.frame.size.height, self.wholeView.frame.size.width, self.wholeView.frame.size.height);
//    } completion:^(BOOL finished) {
//       
//        ListViewController *listVC = [[ListViewController alloc] init];
//        
//        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:listVC];
//        
//        [self presentViewController:nvc animated:NO completion:nil];
//
//    }];
    
    }

- (void)willShowKeyboard:(NSNotification *)notification {
    
    
    NSDictionary *userInfo = [notification userInfo];
    
    
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    NSLog(@"loginblock y: %f", self.inputFields.frame.origin.y);
    NSLog(@"ID field y: %f", self.subjectField.frame.origin.y);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{

                         self.inputFields.frame = CGRectMake(0, self.inputFields.frame.origin.y - kbSize.height + 150, self.inputFields.frame.size.width, self.inputFields.frame.size.height);
                         
                         self.buttonBar.frame = CGRectMake(0, self.buttonBar.frame.origin.y - kbSize.height, self.buttonBar.frame.size.width, self.buttonBar.frame.size.height);
                         

                         
                         NSLog(@"inputFields y2: %f", self.inputFields.frame.origin.y);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{

                         self.inputFields.frame = CGRectMake(0, self.inputFields.frame.origin.y + kbSize.height - 150, self.inputFields.frame.size.width, self.inputFields.frame.size.height);
                         
                         self.buttonBar.frame = CGRectMake(0, self.buttonBar.frame.origin.y + kbSize.height, self.buttonBar.frame.size.width, self.buttonBar.frame.size.height);

                        
                         
                     }
                     completion:nil];
}

@end
