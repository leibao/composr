//
//  SubjectViewController.m
//  composr
//
//  Created by Lei Bao on 7/17/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "SubjectViewController.h"
#import "TextViewController.h"

@interface SubjectViewController ()
@property (weak, nonatomic) IBOutlet UITextField *subjectField;
@property (strong, nonatomic) UIWindow *foregroundWindow;
- (IBAction)doneBtn:(id)sender;
- (IBAction)automakeBtn:(id)sender;
@property (nonatomic, strong) NSArray *myArray;

@end

@implementation SubjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       // define the auto subjects

        
    }
    return self;
}

- (void)viewDidLoad
{
    
    [self.subjectField becomeFirstResponder];
    
    /* set up left and right buttons */
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back1" style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton)];
//    self.navigationItem.leftBarButtonItem = leftButton;
    

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *subjectText = [defaults objectForKey:@"subjectText"];
    
    self.subjectField.placeholder = subjectText;
    
    self.myArray = @[@"7.7, Sunny with some fluffy clouds", @"Thinking of you", @"Summer in Carbo", @"New Year in Kyoto", @"Smile, here’s a letter from me", @"I bet you will love this", @"Wish you all the love in the world", @"Sending a little spring", @"Time Flies", @"My Trip To Spain", @"Half Dome Hike"];


    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *subjectText = [defaults objectForKey:@"subjectText"];
    
    self.subjectField.placeholder = subjectText;
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

    //store data
    NSString *subjectText = [self.subjectField text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:subjectText forKey:@"subjectText"];
    
    
    
}



- (IBAction)automakeBtn:(id)sender {


    
    int i;

    i = arc4random_uniform(self.myArray.count);
    
    NSLog(@"array number: %d", i);
    
    self.subjectField.text = self.myArray[i];
    
    
}



@end
