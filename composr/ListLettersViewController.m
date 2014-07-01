//
//  ListLettersViewController.m
//  composr
//
//  Created by Lei Bao on 6/29/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "ListLettersViewController.h"

@interface ListLettersViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ListLettersViewController

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
    self.ScrollView.contentSize = self.ImageView.frame.size;
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list"]];
    iv.frame = CGRectMake(0, 0, iv.frame.size.width, iv.frame.size.height);
    
    [self.ScrollView addSubview:iv];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
