//
//  JapanTripPageEndViewController.m
//  composr
//
//  Created by Lei Bao on 8/8/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "JapanTripPageEndViewController.h"
#import "Tab2ViewController.h"

@interface JapanTripPageEndViewController ()
- (IBAction)onClose:(id)sender;

@end

@implementation JapanTripPageEndViewController

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

- (IBAction)onClose:(id)sender {
    Tab2ViewController *tabvc = [[Tab2ViewController alloc] init];
    [self presentViewController:tabvc animated:YES completion: nil];
    
}
@end
