//
//  EmailBodyViewController.m
//  composr
//
//  Created by Lei Bao on 7/25/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "EmailBodyViewController.h"
#import "TextViewController.h"

@interface EmailBodyViewController ()
@property (weak, nonatomic) IBOutlet UITextView *emailBodyTextView;
@property (strong, nonatomic) UIWindow *foregroundWindow;
- (IBAction)onTap:(id)sender;

- (IBAction)onDoneBtn:(id)sender;
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation EmailBodyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.emailBodyTextView becomeFirstResponder];
    
    
    //Get the stored data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *bodyText = [defaults objectForKey:@"bodyText"];
    self.emailBodyTextView.text = bodyText;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    NSLog(@"started editing");
    
    //store data
    NSString *bodyText = [self.emailBodyTextView text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:bodyText forKey:@"bodyText"];
    
}


- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
    
}

- (IBAction)onDoneBtn:(id)sender {
    
    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[TextViewController new]];
    
    self.foregroundWindow.rootViewController = nvc;
    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
    self.foregroundWindow.hidden = NO;
    
    [self.view endEditing:YES];
    
    NSString *bodyText = [self.emailBodyTextView text];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:bodyText forKey:@"bodyText"];
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
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
                         self.emailBodyTextView.frame = CGRectMake(10, 40, self.view.frame.size.width - 20, self.view.frame.size.height - kbSize.height - 50);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
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
                         self.emailBodyTextView.frame = CGRectMake(10, 40, self.view.frame.size.width - 20, self.view.frame.size.height - 50);
                     }
                     completion:nil];
}

@end
