//
//  Tab2ViewController.m
//  composr
//
//  Created by Lei Bao on 6/30/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "Tab2ViewController.h"
#import "ListLettersViewController.h"
#import "MyselfViewController.h"
#import "SelectTypeViewController.h"
#import "ChooseTypeViewController.h"

@interface Tab2ViewController ()

@property (nonatomic, strong) ListLettersViewController *tab1vc;
@property (nonatomic, strong) UINavigationController *emptytab1nvc;
@property (nonatomic, strong) MyselfViewController *tab2vc;
@property (strong, nonatomic) UIWindow *selectTypeWindow;
@property (weak, nonatomic) IBOutlet UIView *DisplayView;
@property (strong, nonatomic) UIWindow *foregroundWindow;


- (IBAction)ontab1:(id)sender;
- (IBAction)ontab2:(id)sender;
- (IBAction)onCompose:(id)sender;

@end

@implementation Tab2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // setup tabbars
        self.tab1vc = [[ListLettersViewController alloc] init];        
        self.tab2vc = [[MyselfViewController alloc] init];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [super viewDidLoad];
    self.tab1vc.view.frame = self.DisplayView.frame;
    
    [self.DisplayView addSubview: self.tab1vc.view];
    
    //clear default keys
    NSString *subjectText = @"Subject";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:subjectText forKey:@"subjectText"];
    
    NSString *toText = @"To";

    [defaults setObject:toText forKey:@"toText"];
    
    NSString *bodyText = @"";
    
    [defaults setObject:bodyText forKey:@"bodyText"];
    
    NSString *templatecount = @"template1";
    
    [defaults setObject:templatecount forKey:@"templatecount"];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ontab1:(id)sender {
        [self.DisplayView addSubview: self.tab1vc.view];
}

- (IBAction)ontab2:(id)sender {
        [self.DisplayView addSubview: self.tab2vc.view];
}

- (IBAction)onCompose:(id)sender {
   
    /* No navigation bar on the top of the selecet type page */
    self.selectTypeWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.selectTypeWindow.rootViewController = [SelectTypeViewController new];
    self.selectTypeWindow.windowLevel = UIWindowLevelStatusBar;
    self.selectTypeWindow.hidden = NO;
    
    
    /* user navigation bar on the top of the selecet type page */
//    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//
//    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[SelectTypeViewController new]];
//
//    self.foregroundWindow.rootViewController = nvc;
//    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
//    self.foregroundWindow.hidden = NO;
    
    
}
@end
