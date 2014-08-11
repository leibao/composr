//
//  TabViewController.m
//  composr
//
//  Created by Lei Bao on 6/29/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "TabViewController.h"
#import "ListLettersViewController.h"
#import "MyselfViewController.h"
#import "EmptyListViewController.h"
#import "SelectTypeViewController.h"
#import "ComposeSubjectToViewController.h"

@interface TabViewController ()

@property (nonatomic, strong) ListLettersViewController *tab1vc;
@property (nonatomic, strong) UINavigationController *emptytab1nvc;
@property (nonatomic, strong) EmptyListViewController *emptytab1vc;
@property (nonatomic, strong) MyselfViewController *tab2vc;
@property (weak, nonatomic) IBOutlet UIView *DisplayView;

@property (strong, nonatomic) UIWindow *selectTypeWindow;
@property (weak, nonatomic) IBOutlet UIView *bouncer;

@property (strong, nonatomic) UIWindow *foregroundWindow;

- (IBAction)ontab1:(id)sender;
- (IBAction)ontab2:(id)sender;
- (IBAction)onCompose:(id)sender;

@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // setup tabbars
        self.tab1vc = [[ListLettersViewController alloc] init];
        self.emptytab1vc = [[EmptyListViewController alloc] init];
        //self.emptytab1nvc = [[UINavigationController alloc] initWithRootViewController:self.emptytab1vc];
      
        self.tab2vc = [[MyselfViewController alloc] init];
        
        //self.emptytab1nvc.navigationBar.alpha = 0;
       // self.emptytab1nvc.navigationBar.translucent = YES;
       
    }
    return self;
}



- (void)viewDidLoad
{
    
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
    
    [super viewDidLoad];
    self.emptytab1vc.view.frame = self.DisplayView.frame;
    
    [self.DisplayView addSubview: self.emptytab1vc.view];
    NSLog(@"before bounce: %f", self.bouncer.center.y);
    
    self.bouncer.center = CGPointMake(160, 410);
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat animations:^{
        self.bouncer.center = CGPointMake(160, 430);
        NSLog(@"bounced %f", self.bouncer.center.y);
        
    } completion:nil];
    
  
}

- (void)viewDidAppear:(BOOL)animated {
    //clear default keys
    NSString *subjectText = @"Subject";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:subjectText forKey:@"subjectText"];
    
    NSString *toText = @"To";
    
    [defaults setObject:toText forKey:@"toText"];
    
    NSString *bodyText = @"";
    
    [defaults setObject:bodyText forKey:@"bodyText"];
    
    NSString *startTypingLabelText = @"Start typing here...";
    
    [defaults setObject:startTypingLabelText forKey:@"startTypingLabelText"];
    
    NSString *templatecount = @"template1";

    [defaults setObject:templatecount forKey:@"templatecount"];
    
    int pagecount = 0;
    
    [defaults setInteger:pagecount forKey:@"pagecount"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ontab1:(id)sender {
    
    [self.DisplayView addSubview: self.emptytab1vc.view];
    self.bouncer.hidden = NO;
}

- (IBAction)ontab2:(id)sender {
    
    [self.DisplayView addSubview: self.tab2vc.view];
    
    self.bouncer.hidden = YES;
    
}

- (IBAction)onCompose:(id)sender {
//    loading mail types
    self.selectTypeWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.selectTypeWindow.rootViewController = [SelectTypeViewController new];
    self.selectTypeWindow.windowLevel = UIWindowLevelStatusBar;
    self.selectTypeWindow.hidden = NO;
    
    self.bouncer.hidden = YES;

    //Loading the subject-to page
    
    //self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[ComposeSubjectToViewController new]];
//    
//    self.foregroundWindow.rootViewController = nvc;
//    
//    //self.foregroundWindow.rootViewController = [ComposeSubjectToViewController new];
//    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
//    self.foregroundWindow.hidden = NO;
    
    
    
    
}
@end
