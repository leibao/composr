//
//  EmailPreviewViewController.m
//  composr
//
//  Created by Lei Bao on 7/28/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "EmailPreviewViewController.h"
#import "TextViewController.h"

#import "PageTextViewController.h"
#import "PageEndViewController.h"

@interface EmailPreviewViewController ()

@property (nonatomic, strong) NSArray *pages;
@property (nonatomic, strong) PageTextViewController *pageTextViewController;
@property (nonatomic, strong) PageEndViewController *pageEndViewController;
@property (nonatomic, strong) UIPageViewController *pageViewController;


- (IBAction)onTap:(id)sender;
@property (strong, nonatomic) UIWindow *foregroundWindow;
- (IBAction)onSwipe:(id)sender;



@end

@implementation EmailPreviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Setup page array
        self.pageTextViewController = [[PageTextViewController alloc] init];
        self.pageEndViewController = [[PageEndViewController alloc] init];
        
        self.pages = @[
                       self.pageTextViewController,
                       self.pageEndViewController
                       ];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //check how many pages are created
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int pagecount = [defaults integerForKey:@"pagecount"];
    NSString *pagetype = [defaults objectForKey:@"pagetype"];
    
    NSLog(@"%d", pagecount);
    NSLog(@"%@", pagetype);
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    [self.pageViewController setViewControllers:@[self.pageTextViewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
     
     self.pageTextViewController.view.frame = self.view.bounds;
     self.pageEndViewController.view.frame = self.view.bounds;
     self.pageViewController.view.frame = self.view.bounds;
     
     [self.view addSubview:self.pageViewController.view];


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
         int index = [self.pages indexOfObject:viewController];
         if (index > 0) {
             return self.pages[index - 1];
         }
         return nil;
     }
     
     - (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
         int index = [self.pages indexOfObject:viewController];
         
         if (index < (self.pages.count - 1)) {
             
             return self.pages[index + 1];
         }
         
         return nil;
     }

- (IBAction)onTap:(id)sender {
    
    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[TextViewController new]];
    
    self.foregroundWindow.rootViewController = nvc;
    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
    self.foregroundWindow.hidden = NO;
    
}
- (IBAction)onSwipe:(id)sender {
    
    
}
     
     
     
@end
