//
//  JapanTripEmailViewController.m
//  composr
//
//  Created by Lei Bao on 8/8/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "JapanTripEmailViewController.h"
#import "JapanTripPage1ViewController.h"
#import "JapanTripPage2ViewController.h"
#import "JapanTripPage3ViewController.h"
#import "JapanTripPage4ViewController.h"
#import "JapanTripPage5ViewController.h"
#import "JapanTripPage6ViewController.h"
#import "JapanTripPageEndViewController.h"

@interface JapanTripEmailViewController ()

@property (nonatomic, strong) NSArray *pages;
@property (nonatomic, strong) JapanTripPage1ViewController *page1ViewController;
@property (nonatomic, strong) JapanTripPage2ViewController *page2ViewController;
@property (nonatomic, strong) JapanTripPage3ViewController *page3ViewController;
@property (nonatomic, strong) JapanTripPage4ViewController *page4ViewController;
@property (nonatomic, strong) JapanTripPage5ViewController *page5ViewController;
@property (nonatomic, strong) JapanTripPage6ViewController *page6ViewController;
@property (nonatomic, strong) JapanTripPageEndViewController *pageEndViewController;
@property (nonatomic, strong) UIPageViewController *pageViewController;
- (IBAction)onSwipe:(UISwipeGestureRecognizer *)sender;

@end

@implementation JapanTripEmailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Setup page array
        self.page1ViewController = [[JapanTripPage1ViewController alloc] init];
        self.page2ViewController = [[JapanTripPage2ViewController alloc] init];
        self.page3ViewController = [[JapanTripPage3ViewController alloc] init];
        self.page4ViewController = [[JapanTripPage4ViewController alloc] init];
        self.page5ViewController = [[JapanTripPage5ViewController alloc] init];
        self.page6ViewController = [[JapanTripPage6ViewController alloc] init];
        self.pageEndViewController = [[JapanTripPageEndViewController alloc] init];
        self.pages = @[
                       self.page1ViewController,
                       self.page2ViewController,
                       self.page3ViewController,
                       self.page4ViewController,
                       self.page5ViewController,
                       self.page6ViewController,
                       self.pageEndViewController
                       ];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set up
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    [self.pageViewController setViewControllers:@[self.page1ViewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    self.page1ViewController.view.frame = self.view.bounds;
    self.page2ViewController.view.frame = self.view.bounds;
    self.page3ViewController.view.frame = self.view.bounds;
    self.page4ViewController.view.frame = self.view.bounds;
    self.page5ViewController.view.frame = self.view.bounds;
    self.page6ViewController.view.frame = self.view.bounds;
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


- (IBAction)onSwipe:(UISwipeGestureRecognizer *)sender {
    
    
}
@end
