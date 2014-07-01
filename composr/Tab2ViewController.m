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

@interface Tab2ViewController ()

@property (nonatomic, strong) ListLettersViewController *tab1vc;
@property (nonatomic, strong) UINavigationController *emptytab1nvc;
@property (nonatomic, strong) MyselfViewController *tab2vc;
@property (strong, nonatomic) UIWindow *selectTypeWindow;
@property (weak, nonatomic) IBOutlet UIView *DisplayView;


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
    
    self.selectTypeWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.selectTypeWindow.rootViewController = [SelectTypeViewController new];
    self.selectTypeWindow.windowLevel = UIWindowLevelStatusBar;
    self.selectTypeWindow.hidden = NO;
}
@end
