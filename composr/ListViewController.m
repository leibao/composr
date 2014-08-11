//
//  ListViewController.m
//  composr
//
//  Created by Lei Bao on 6/17/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "ListViewController.h"



@interface ListViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIWindow *foregroundWindow;

-(void)onMenuButton;
-(void)onProfileButton;
-(void)onComposeButton;

@end

@implementation ListViewController

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
    
    self.scrollView.contentSize = self.imageView.frame.size;
    
    
    //Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"btn-menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage: leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onMenuButton)];
    
    self.navigationItem.leftBarButtonItem = menuButton;
    
    //Configure the left button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"btn-profile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *profileButton = [[UIBarButtonItem alloc] initWithImage: rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onProfileButton)];
    self.navigationItem.rightBarButtonItem = profileButton;
    
   
    UIImage *middlebuttonImage = [[UIImage imageNamed:@"btn-compose"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *middleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, 80, 80)];
    [middleButton setBackgroundImage:middlebuttonImage forState:UIControlStateNormal];
    UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 200)];
    [buttonContainer addSubview:middleButton];
    
    [middleButton addTarget:self action:@selector(onComposeButton) forControlEvents:UIControlEventTouchUpInside];
    
  //buttonContainer.backgroundColor = [UIColor redColor];
   // middleButton.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = buttonContainer;
    
    
    //NSLog(@"button %@", middleButton);
    
    //self.navigationItem.title = @"test";
    
    //load list
    UIImageView *iv = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"list"]];
    iv.frame = CGRectMake(0.0, 0.0, iv.frame.size.width, iv.frame.size.height);
    [self.scrollView addSubview:iv];
    
    
    //Animate the button

    
    
    //[self performSelector:@selector(fade1) withObject:nil afterDelay:0];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ontap:(id)sender {
}

- (void)onMenuButton {
    
}

- (void)onProfileButton {
    
}

- (void)onComposeButton {

    
//    //load Compose page
//    ComposeSubjectToViewController *composeSubjectToVC = [[ComposeSubjectToViewController alloc] init];
//    
//   // UINavigationController *nac = [[UINavigationController alloc] initWithRootViewController:composeSubjectToVC];
//    
//    
//    composeSubjectToVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    
//    [self presentViewController:composeSubjectToVC animated:YES completion:nil];
    
    // email view
    
    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.foregroundWindow.rootViewController = [ new];
    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
    self.foregroundWindow.hidden = NO;
    
    
}




@end
