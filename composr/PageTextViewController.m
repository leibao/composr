//
//  PageTextViewController.m
//  composr
//
//  Created by Lei Bao on 7/29/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "PageTextViewController.h"

@interface PageTextViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation PageTextViewController

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
    //check templatecount
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *templatecount = [defaults objectForKey:@"templatecount"];
    
    self.scrollView.contentSize = self.imageView.frame.size;
    
    //Which template to show
    if ([templatecount isEqual:@"template1"]) {
        
        [self.imageView setImage:[UIImage imageNamed:@"email-1"]];
        
    } else if ([templatecount isEqual:@"template2"]) {
        
        [self.imageView setImage:[UIImage imageNamed:@"email-2"]];
        
    } else if ([templatecount isEqual:@"template3"]) {
        
        [self.imageView setImage:[UIImage imageNamed:@"email-3"]];
        
    } else if ([templatecount isEqual:@"template4"]) {
        
        [self.imageView setImage:[UIImage imageNamed:@"email-4"]];
        
    } else if ([templatecount isEqual:@"template5"]) {
        
        [self.imageView setImage:[UIImage imageNamed:@"email-5"]];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
