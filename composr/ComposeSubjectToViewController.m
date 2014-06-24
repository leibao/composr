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
- (IBAction)onDrag:(UIPanGestureRecognizer *)sender;

- (IBAction)onSwipeLeft:(UISwipeGestureRecognizer *)sender;

- (IBAction)onTapTo:(id)sender;



- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

float inputFieldsOriginalY;

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
    inputFieldsOriginalY = self.inputFields.frame.origin.y;
    // Do any additional setup after loading the view from its nib.
    [self.subjectField becomeFirstResponder];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
    self.inputFields.frame = CGRectMake(0, inputFieldsOriginalY, self.inputFields.frame.size.width, self.inputFields.frame.size.height);
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

- (IBAction)onDrag:(UIPanGestureRecognizer *)sender {
    
    
    CGPoint point = [sender locationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        // when this window is at the top of the view
        if (self.view.frame.origin.y == 0) {
            [UIView animateWithDuration:1 animations:^{
                self.view.frame = CGRectMake(0, point.y, self.view.frame.size.width, self.view.frame.size.height);
            } completion:nil];
        }
        
        // when this window is at the bottom of the view
        else if (self.view.frame.origin.y == self.view.frame.size.height - 40) {
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
                self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            } completion:nil];
        }
        
        
    } // end of statebegan
    
    else if (sender.state == UIGestureRecognizerStateEnded) {
        
        
        //decide to bounce back to top or going all the way down
        
        if (point.y < 80) {
            
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
                self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            } completion:nil];
            
        } // end point.y < 40
        
        else if (point.y >= 80) {
            
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
                self.view.frame = CGRectMake(0, self.view.frame.size.height - 80, self.view.frame.size.width, self.view.frame.size.height);
            } completion:nil];
            
            [self.view endEditing:YES];
            
        } //end point.y >= 40
        
        
        
    } // end of stateEnded

}



- (IBAction)onSwipeLeft:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipe left");
    
    //load Choose Type page
    ChooseTypeViewController *chooseTypeVC = [[ChooseTypeViewController alloc] init];
    //UINavigationController *nac = [[UINavigationController alloc] initWithRootViewController:chooseTypeVC];
    //UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    //self.navigationItem.leftBarButtonItem = backButton;
    
    chooseTypeVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:chooseTypeVC animated:YES completion:nil];
    
    
}

- (IBAction)onTapTo:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
            self.inputFields.frame = CGRectMake(0, self.inputFields.frame.origin.y - 180, self.inputFields.frame.size.width, self.inputFields.frame.size.height);
    }];
    

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
