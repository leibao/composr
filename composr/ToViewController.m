//
//  ToViewController.m
//  composr
//
//  Created by Lei Bao on 7/21/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "ToViewController.h"
#import "TextViewController.h"

@interface ToViewController ()
- (IBAction)doneBtn:(id)sender;
@property (strong, nonatomic) UIWindow *foregroundWindow;
@property (weak, nonatomic) IBOutlet UITextField *toField;
@property (weak, nonatomic) IBOutlet UIScrollView *contactsScrollView;
@property (weak, nonatomic) IBOutlet UIView *imageholderView;
- (IBAction)contact1Btn:(id)sender;
- (IBAction)contact2Btn:(id)sender;
- (IBAction)contact3Btn:(id)sender;
- (IBAction)contact4Btn:(id)sender;
- (IBAction)contact5Btn:(id)sender;
- (IBAction)contact6Btn:(id)sender;
- (IBAction)onTap:(UITapGestureRecognizer *)sender;

// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation ToViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [self.toField becomeFirstResponder];
    
    //set data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *toText = [defaults objectForKey:@"toText"];
    self.toField.placeholder = toText;


    
    //setup scrollview
    self.contactsScrollView.contentSize = self.imageholderView.frame.size;
    self.contactsScrollView.delegate = self;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneBtn:(id)sender {
    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[TextViewController new]];
    
    self.foregroundWindow.rootViewController = nvc;
    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
    self.foregroundWindow.hidden = NO;
    
    [self.view endEditing:YES];
    
    NSString *toText = [self.toField text];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:toText forKey:@"toText"];
}
- (IBAction)contact1Btn:(id)sender {
    
    NSString *toFieldText;
    
    toFieldText = self.toField.text;
    
    if (self.toField.text.length == 0) {
        self.toField.text = @"Joe";
    } else {
        self.toField.text = [NSString stringWithFormat: @"%@, Joe", toFieldText];}

}

- (IBAction)contact2Btn:(id)sender {
    NSString *toFieldText;
    
    toFieldText = self.toField.text;
    
    if (self.toField.text.length == 0) {
        self.toField.text = @"Tris";
    } else {
        self.toField.text = [NSString stringWithFormat: @"%@, Tris", toFieldText];}
}

- (IBAction)contact3Btn:(id)sender {
    NSString *toFieldText;
    
    toFieldText = self.toField.text;
    
    if (self.toField.text.length == 0) {
        self.toField.text = @"Bella";
    } else {
        self.toField.text = [NSString stringWithFormat: @"%@, Bella", toFieldText];}
}

- (IBAction)contact4Btn:(id)sender {
}

- (IBAction)contact5Btn:(id)sender {
}

- (IBAction)contact6Btn:(id)sender {
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
}

//Keyboard height
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
                         self.contactsScrollView.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.contactsScrollView.frame.size.height, self.contactsScrollView.frame.size.width, self.contactsScrollView.frame.size.height);
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
                         self.contactsScrollView.frame = CGRectMake(0, self.view.frame.size.height - self.contactsScrollView.frame.size.height, self.contactsScrollView.frame.size.width, self.contactsScrollView.frame.size.height);
                     }
                     completion:nil];
}


@end
