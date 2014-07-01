//
//  LoginViewController.m
//  composr
//
//  Created by Lei Bao on 6/29/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "LoginViewController.h"
#import "TabViewController.h"
#import "ListLettersViewController.h"
#import "Tab2ViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) UIWindow *foregroundWindow;
- (IBAction)onCancelButton:(id)sender;
- (IBAction)onSigninButton:(id)sender;

@end

@implementation LoginViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCancelButton:(id)sender {
    
   // self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   // self.foregroundWindow.rootViewController = [LoginViewController new];
   // self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
    self.view.window.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    NSLog(@"cancel");
}

- (IBAction)onSigninButton:(id)sender {
    
    //ListLettersViewController *Listvc = [[ListLettersViewController alloc] init];
    Tab2ViewController *tabvc = [[Tab2ViewController alloc] init];
    [self presentViewController:tabvc animated:YES completion: nil];
    
}
@end
