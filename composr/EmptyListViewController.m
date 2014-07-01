//
//  EmptyListViewController.m
//  composr
//
//  Created by Lei Bao on 6/29/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "EmptyListViewController.h"
#import "LoginViewController.h"

@interface EmptyListViewController ()
@property (strong, nonatomic) UIWindow *foregroundWindow;
@property (weak, nonatomic) IBOutlet UIImageView *bkimage;
- (IBAction)onLogin:(id)sender;

- (void)onLoginButton;

@end

@implementation EmptyListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.navigationItem.title = @"LetterPost";
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-white"]];
    
    
    NSLog(@"title is: %@", self.navigationItem.title);
    
    //configure right button
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStylePlain target:self action:@selector(onLoginButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.bkimage.center = CGPointMake(160, 284);
    
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat animations:^{
        self.bkimage.center = CGPointMake(320, 284);

        
    } completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogin:(id)sender {
    
    
    NSLog(@"login");
    
    // LoginViewController *lvc = [[LoginViewController alloc] init];
    
    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.foregroundWindow.rootViewController = [LoginViewController new];
    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
    self.foregroundWindow.hidden = NO;
}

- (void)onLoginButton {

    
}

@end
