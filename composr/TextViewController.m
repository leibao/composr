//
//  TextViewController.m
//  composr
//
//  Created by Lei Bao on 7/17/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "TextViewController.h"
#import "SubjectViewController.h"
#import "SelectTypeViewController.h"
#import "ToViewController.h"
#import "EmailBodyViewController.h"
#import "EmailPreviewViewController.h"

@interface TextViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *templateHolder;
@property (weak, nonatomic) IBOutlet UIButton *displaySubjectText;

@property (weak, nonatomic) IBOutlet UILabel *toLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UIButton *subjectBtn;
@property (weak, nonatomic) IBOutlet UIButton *toBtn;

@property (strong, nonatomic) UIWindow *selectTypeWindow;


@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *allTemplateView;

@property (nonatomic, assign) float templateCount;

@property (weak, nonatomic) IBOutlet UITextView *emailBodyTextView;

@property (weak, nonatomic) IBOutlet UILabel *dearLabel;
@property (weak, nonatomic) IBOutlet UIButton *startTypingLabel;
@property (weak, nonatomic) IBOutlet UILabel *line1Label;
@property (weak, nonatomic) IBOutlet UILabel *line2Label;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *bkBeachImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bkPaintingImageView;



- (IBAction)template1Btn:(id)sender;
- (IBAction)template2Btn:(id)sender;
- (IBAction)template3Btn:(id)sender;
- (IBAction)template4Btn:(id)sender;
- (IBAction)template5Btn:(id)sender;

- (IBAction)onTap:(UITapGestureRecognizer *)sender;
- (IBAction)onDrag:(UIPanGestureRecognizer *)sender;
- (IBAction)onTapTextView:(UITapGestureRecognizer *)sender;


- (IBAction)onSubjectButton:(id)sender;
- (IBAction)onToButton:(id)sender;
- (IBAction)onTapBKImage:(UITapGestureRecognizer *)sender;
- (IBAction)onStartTypingBtn:(id)sender;

- (void)textViewDidBeginEditing:(UITextView *)emailBodyTextView;
- (void)textViewDidChangeSelection:(UITextView *)emailBodyTextView;

@property (weak, nonatomic) IBOutlet UIScrollView *fontpairingScrollView;
@property (weak, nonatomic) IBOutlet UIView *fontpairingView;
- (IBAction)fontpairingBtn1:(id)sender;
- (IBAction)fontpairingBtn2:(id)sender;
- (IBAction)fontpairingBtn3:(id)sender;
- (IBAction)fontpairingBtn4:(id)sender;
- (IBAction)fontpairingBtn5:(id)sender;

- (void)setTemplate1;
- (void)setTemplate2;
- (void)setTemplate3;
- (void)setTemplate4;
- (void)setTemplate5;
- (void)whichFontPairing;
- (void)setupDearLabel;

@end

@implementation TextViewController

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
    /* set up left and right buttons */
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    //load scroll view
    self.scrollView.contentSize = self.templateHolder.frame.size;
    [self.scrollView addSubview: self.templateHolder];

    self.fontpairingScrollView.contentSize = self.fontpairingView.frame.size;
    [self.fontpairingScrollView addSubview: self.fontpairingView];
    
    //set the template to the first template
    [self setTemplate1];
    
    //set font pairing to #1
    //store font choice
    NSString *fontchoice = @"pairing1";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fontchoice forKey:@"fontchoice"];
    
    self.emailBodyTextView.delegate = self;
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    //Get the stored data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //set subject text wrapping

    NSString *subjectText = [defaults objectForKey:@"subjectText"];
    self.subjectLabel.text = subjectText;
//    if (subjectText.length >= 6) {
//        self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 110, 260, 80);
//        NSLog(@"long");
//        
//    }
//    else {
//        self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 110, 260, 40);
//        NSLog(@"short");
//        self.subjectLabel.text = subjectText;
//    }
//    
    
    
    
    NSString *toText = [defaults objectForKey:@"toText"];
    self.toLabel.text = toText;

    NSString *bodyText = [defaults objectForKey:@"bodyText"];
    self.emailBodyTextView.text = bodyText;
    
    NSString *startTypingLabelText = [defaults objectForKey:@"startTypingLabelText"];
    self.startTypingLabel.titleLabel.text = startTypingLabelText;
    
    NSString *templatecount = [defaults objectForKey:@"templatecount"];
    
    
    //Which template to show
    if ([templatecount isEqual:@"template1"]) {
        [self setTemplate1];

        
    } else if ([templatecount isEqual:@"template2"]) {

        [self setTemplate2];

    } else if ([templatecount isEqual:@"template3"]) {

        [self setTemplate3];

    } else if ([templatecount isEqual:@"template4"]) {
        
        [self setTemplate4];
        
    } else if ([templatecount isEqual:@"template5"]) {
        
        [self setTemplate5];
    }
    
    if (![toText isEqual: @"To"]) {
        self.dearLabel.text = [NSString stringWithFormat: @"Dear %@:", toText];
        self.dearLabel.alpha = 1;
        self.dearLabel.frame = CGRectMake(self.startTypingLabel.frame.origin.x, self.startTypingLabel.frame.origin.y + 10, self.dearLabel.frame.size.width, self.dearLabel.frame.size.height);
        self.emailBodyTextView.frame = CGRectMake(self.emailBodyTextView.frame.origin.x, self.emailBodyTextView.frame.origin.y + self.dearLabel.frame.size.height + 10, self.emailBodyTextView.frame.size.width, self.emailBodyTextView.frame.size.height);
        self.startTypingLabel.frame = CGRectMake(self.startTypingLabel.frame.origin.x, self.startTypingLabel.frame.origin.y + self.dearLabel.frame.size.height + 10, self.startTypingLabel.frame.size.width, self.startTypingLabel.frame.size.height);
        
    } else { self.dearLabel.alpha = 0;
    }
    
    if (![bodyText isEqual: @""]) {
        self.startTypingLabel.alpha = 0;
        
    } else { self.startTypingLabel.alpha = 1;
    }
    
    //which font pairing to show
    [self whichFontPairing];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onLeftButton {
                                        
    /* No navigation bar on the top of the selecet type page */
    self.selectTypeWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.selectTypeWindow.rootViewController = [SelectTypeViewController new];
    self.selectTypeWindow.windowLevel = UIWindowLevelStatusBar;
    self.selectTypeWindow.hidden = NO;
    
    [self.view endEditing:YES];
    
}

- (void)onRightButton {
    
    //store page count
    NSString *pagetype = @"textpage";

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int pagecount = [defaults integerForKey:@"pagecount"];
    
    pagecount ++;
    
    [defaults setObject:pagetype forKey:@"pagetype"];
    [defaults setInteger:pagecount forKey:@"pagecount"];
    
    NSLog(@"%d", pagecount);
    NSLog(@"%@", pagetype);
    
    //load email preview page with navigation bar
    //EmailPreviewViewController *vc = [[EmailPreviewViewController alloc] init];
   // [self.navigationController pushViewController:vc animated:YES];
    
    //load a seperate view window without navigation bar
    EmailPreviewViewController *vc = [[EmailPreviewViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:vc animated:YES completion: nil];
    
}


- (IBAction)template1Btn:(id)sender {

    //store template count
    NSString *templatecount = @"template1";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:templatecount forKey:@"templatecount"];


    //set the template to the first template
    [self setTemplate1];
    
    [self setupDearLabel];
    
}

- (IBAction)template2Btn:(id)sender {

    //store template count
    NSString *templatecount = @"template2";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:templatecount forKey:@"templatecount"];
    
    self.templateCount = 2;

    //set the template to the first template
    [self setTemplate2];
    
    [self setupDearLabel];

    
}

- (IBAction)template3Btn:(id)sender {

    //store template count
    NSString *templatecount = @"template3";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:templatecount forKey:@"templatecount"];
    
    //set the template to the first template
    [self setTemplate3];
    
    [self setupDearLabel];

    
}

- (IBAction)template4Btn:(id)sender {

    //store template count
    NSString *templatecount = @"template4";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:templatecount forKey:@"templatecount"];
    
    //set the template to the first template
    [self setTemplate4];
    
    [self setupDearLabel];
}

- (IBAction)template5Btn:(id)sender {
    
    //store template count
    NSString *templatecount = @"template5";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:templatecount forKey:@"templatecount"];
    
    //set the template to the first template
    [self setTemplate5];
    
    [self setupDearLabel];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
}



- (IBAction)onDrag:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.allTemplateView];
    CGPoint velocity = [sender velocityInView:self.allTemplateView];
    
    CGPoint center = self.allTemplateView.center;
    
    float originalViewLocation = self.allTemplateView.frame.origin.y;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // NSLog(@"gesture began at: %@", NSStringFromCGPoint(point));
        NSLog(@"UIGestureRecognizerStateBegan point.y: %f", point.y);
        NSLog(@"UIGestureRecognizerStateBegan origin.y: %f", self.allTemplateView.frame.origin.y);
        
        // find out where is the view
        if (self.allTemplateView.frame.origin.y == 43 ) {
            
            [UIView animateWithDuration:1 delay:0 options:0 animations:^{
                self.allTemplateView.frame = CGRectMake(0, point.y, self.allTemplateView.frame.size.width, self.allTemplateView.frame.size.height);
                self.scrollView.frame = CGRectMake(0, self.view.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
            } completion:nil];
        }
        
        else if (self.allTemplateView.frame.origin.y == 200) {
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
                self.allTemplateView.frame = CGRectMake(0, 43, self.allTemplateView.frame.size.width, self.allTemplateView.frame.size.height);
                self.scrollView.frame = CGRectMake(0, 380, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
            } completion:nil];
            
            
        }
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"UIGestureRecognizerStateEnded point.y: %f", point.y);
        NSLog(@"UIGestureRecognizerStateEnded view origin.y: %f", self.allTemplateView.frame.origin.y);
        
        
        if (self.allTemplateView.frame.origin.y == 43 ) {
            
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
                self.allTemplateView.frame = CGRectMake(0, 43, self.allTemplateView.frame.size.width, self.allTemplateView.frame.size.height);
                self.scrollView.frame = CGRectMake(0, 380, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
            } completion:nil];
        }
        
        else {
            if (point.y < 40) {
                [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
                    self.allTemplateView.frame = CGRectMake(0, 43, self.allTemplateView.frame.size.width, self.allTemplateView.frame.size.height);
                    self.scrollView.frame = CGRectMake(0, 380, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
                } completion:nil];
            } else if (point.y >= 40) {
                [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
                    self.allTemplateView.frame = CGRectMake(0, 200, self.allTemplateView.frame.size.width, self.allTemplateView.frame.size.height);
                    self.scrollView.frame = CGRectMake(0, self.view.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
                } completion:nil];
            }
            NSLog(@"view end location: %f", self.view.frame.origin.y);
            NSLog(@"-------------------------------------------");
            
        }
        
        
        
    }
    
    
}

- (IBAction)onTapTextView:(UITapGestureRecognizer *)sender {
    //load a seperate view window without navigation bar
    EmailBodyViewController *vc = [[EmailBodyViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion: nil];
    
    //store TextView data
    NSString *bodyText = [self.emailBodyTextView text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:bodyText forKey:@"bodyText"];
    
}

- (IBAction)onSubjectButton:(id)sender {
    //load a seperate view window with navigation bar
//   SubjectViewController *vc = [[SubjectViewController alloc] init];
//////    [self.navigationController pushViewController:vc animated:YES];
//    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
//   [self presentViewController:nc animated:YES completion: nil];
    
    //load a seperate view window without navigation bar
    SubjectViewController *vc = [[SubjectViewController alloc] init];
    [self presentViewController:vc animated:YES completion: nil];
    
  //load a view
//    self.subjectView.frame = CGRectMake(0, 0, self.subjectView.frame.size.width, self.subjectView.frame.size.height);
//    
//    [self.subjectField becomeFirstResponder];
//    NSLog(@"clicked");
    
    //store TextView data
    NSString *bodyText = [self.emailBodyTextView text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:bodyText forKey:@"bodyText"];
    NSLog(@"store data");
    
}

- (IBAction)onToButton:(id)sender {
    //load a seperate view window without navigation bar
    ToViewController *vc = [[ToViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion: nil];
    
    //store TextView data
    NSString *bodyText = [self.emailBodyTextView text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:bodyText forKey:@"bodyText"];
    NSLog(@"store data");
    
    
    
}

- (IBAction)onTapBKImage:(UITapGestureRecognizer *)sender {
}

- (IBAction)onStartTypingBtn:(id)sender {
    
    //load a seperate view window without navigation bar
    EmailBodyViewController *vc = [[EmailBodyViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion: nil];
    
    //store TextView data
    NSString *bodyText = [self.emailBodyTextView text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:bodyText forKey:@"bodyText"];

}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    NSLog(@"started editing");

    self.startTypingLabel.titleLabel.text = @"";
    
    //store data
    NSString *startTypingLabelText = [self.startTypingLabel.titleLabel text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:startTypingLabelText forKey:@"startTypingLabelText"];
    
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"textViewDidChange");
}



/* --------------------------------------- setup dear label ----------------------------------- */

- (void)setupDearLabel {
    //Get the stored data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *toText = [defaults objectForKey:@"toText"];
    
    if (![toText isEqual: @"To"]) {
        self.dearLabel.text = [NSString stringWithFormat: @"Dear %@", toText];
        self.dearLabel.alpha = 1;
        self.dearLabel.frame = CGRectMake(self.startTypingLabel.frame.origin.x, self.startTypingLabel.frame.origin.y, self.dearLabel.frame.size.width, self.dearLabel.frame.size.height);
        self.emailBodyTextView.frame = CGRectMake(self.emailBodyTextView.frame.origin.x, self.emailBodyTextView.frame.origin.y + self.dearLabel.frame.size.height, self.emailBodyTextView.frame.size.width, self.emailBodyTextView.frame.size.height);
        self.startTypingLabel.frame = CGRectMake(self.startTypingLabel.frame.origin.x, self.startTypingLabel.frame.origin.y + self.dearLabel.frame.size.height, self.startTypingLabel.frame.size.width, self.startTypingLabel.frame.size.height);
        
    } else { self.dearLabel.alpha = 0;
    }
}


/* --------------------------------------- setup tempalte ----------------------------------- */

//template1
- (void)setTemplate1 {
    
    self.contentView.frame = CGRectMake(0, 0, 300, 433);
    self.contentView.backgroundColor = [UIColor clearColor];

    self.dateLabel.frame = CGRectMake(self.contentView.frame.origin.x + 30, self.contentView.frame.origin.y + 40, 260, 40);
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    
//    //Get the stored data
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    //set subject text wrapping
//    
//    NSString *subjectText = [defaults objectForKey:@"subjectText"];
//
//    if (subjectText.length >= 20) {
//        
//        self.subjectLabel.font = [UIFont systemFontOfSize:18];
//        self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 60, 260, 80);
//
//        self.subjectLabel.text = subjectText;
//
//        NSLog(@"%d", subjectText.length);
//        
//    } else if ((subjectText.length >= 12) && (subjectText.length < 20)) {
//        
//        self.subjectLabel.font = [UIFont systemFontOfSize:24];
//        self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 30, 260, 120);
//
//        self.subjectLabel.text = subjectText;
//        NSLog(@"%d", subjectText.length);
//    }
//    else {
//        self.subjectLabel.font = [UIFont systemFontOfSize:32];
//        
//        self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 130, 260, 40);
//
//        self.subjectLabel.text = subjectText;
//        
//        NSLog(@"%d", subjectText.length);
//    }
    
    self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 60, 260, 80);
    self.subjectLabel.textAlignment = NSTextAlignmentLeft;
    self.subjectBtn.frame = CGRectMake(self.subjectLabel.frame.origin.x, self.subjectLabel.frame.origin.y, self.subjectLabel.frame.size.width, self.subjectLabel.frame.size.height);
    
    
    self.toLabel.frame = CGRectMake(self.subjectLabel.frame.origin.x, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 260, 20);
    self.toLabel.textAlignment = NSTextAlignmentLeft;
    self.toBtn.frame = CGRectMake(self.subjectLabel.frame.origin.x, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 260, 30);
    self.emailBodyTextView.frame = CGRectMake(self.toLabel.frame.origin.x - 5, self.toLabel.frame.origin.y + self.toLabel.frame.size.height + 10, 260, 400);
    //starttyping button
    self.startTypingLabel.frame = CGRectMake(self.toLabel.frame.origin.x, self.toLabel.frame.origin.y + self.toLabel.frame.size.height + 10, 260, 40);


    self.line1Label.alpha = 0;
    self.line2Label.alpha = 0;
    self.bkBeachImageView.alpha = 0;
    self.bkPaintingImageView.alpha = 0;
    //font pairing
    [self whichFontPairing];
}


//template2
- (void)setTemplate2 {
    
    self.contentView.frame = CGRectMake(0, 0, 300, 433);
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.dateLabel.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y + 40, 320, 40);
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.line1Label.alpha = 0.5;
    self.line1Label.frame = CGRectMake(105, self.dateLabel.frame.origin.y + 90, 110, 1);
    
    self.subjectLabel.frame = CGRectMake(45, self.line1Label.frame.origin.y + 20, 230, 40);
    self.subjectBtn.frame = CGRectMake(45, self.line1Label.frame.origin.y + 20, 230, 40);
    self.subjectLabel.textAlignment = NSTextAlignmentCenter;
    
    self.toLabel.frame = CGRectMake(45, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 230, 20);
    self.toBtn.frame = CGRectMake(45, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 230, 30);
    self.toLabel.textAlignment = NSTextAlignmentCenter;
    
    self.emailBodyTextView.frame = CGRectMake(self.toLabel.frame.origin.x - 5, self.toLabel.frame.origin.y + self.toLabel.frame.size.height + 30, 230, 400);
    //starttyping button
    self.startTypingLabel.frame = CGRectMake(self.toLabel.frame.origin.x, self.toLabel.frame.origin.y + self.toLabel.frame.size.height + 30, 230, 40);

    self.bkBeachImageView.alpha = 0;
    self.line2Label.alpha = 0;
    self.bkPaintingImageView.alpha = 0;
    
    //font pairing
    [self whichFontPairing];
    
    
}

//template3
- (void)setTemplate3 {
    
    self.contentView.frame = CGRectMake(0, 0, 300, 433);
    self.contentView.backgroundColor = [UIColor clearColor];

    self.line1Label.alpha = 1;
    self.line1Label.frame = CGRectMake(10, self.contentView.frame.origin.y + 40, 300, 5);
    
    self.dateLabel.frame = CGRectMake(self.contentView.frame.origin.x, self.line1Label.frame.origin.y + 20, 320, 40);
    self.dateLabel.textAlignment = NSTextAlignmentCenter;

    
    self.subjectLabel.frame = CGRectMake(45, self.dateLabel.frame.origin.y + self.dateLabel.frame.size.height, 240, 40);
    self.subjectBtn.frame = CGRectMake(45, self.dateLabel.frame.origin.y + self.dateLabel.frame.size.height, 240, 40);
    self.subjectLabel.textAlignment = NSTextAlignmentCenter;
    
    self.toLabel.frame = CGRectMake(45, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 240, 20);
    self.toBtn.frame = CGRectMake(45, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 240, 30);
    self.toLabel.textAlignment = NSTextAlignmentCenter;
    
    self.line2Label.alpha = 1;
    self.line2Label.frame = CGRectMake(10, self.contentView.frame.origin.y + 198, 300, 5);
    
    self.emailBodyTextView.frame = CGRectMake(self.toLabel.frame.origin.x - 5, self.line2Label.frame.origin.y + 35, 240, 400);
    //starttyping button
    self.startTypingLabel.frame = CGRectMake(self.toLabel.frame.origin.x, self.line2Label.frame.origin.y + 35, 240, 40);
    self.bkPaintingImageView.alpha = 0;
    self.bkBeachImageView.alpha = 0;
    //font pairing
    [self whichFontPairing];
    
    
}

//template4
- (void)setTemplate4 {
    
    self.contentView.frame = CGRectMake(0, 0, 300, 433);
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.dateLabel.frame = CGRectMake(self.contentView.frame.origin.x + 35, self.contentView.frame.origin.y + 35, 240, 40);
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    
    self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 125, 240, 40);
    self.subjectLabel.textAlignment = NSTextAlignmentRight;
    self.subjectBtn.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 125, 240, 40);
    
    self.toLabel.frame = CGRectMake(self.subjectLabel.frame.origin.x, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 240, 20);
    self.toBtn.frame = CGRectMake(self.subjectLabel.frame.origin.x, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 240, 30);
    self.toLabel.textAlignment = NSTextAlignmentRight;
    
    self.emailBodyTextView.frame = CGRectMake(self.toLabel.frame.origin.x - 5, 290, 240, 400);
    //starttyping button
    self.startTypingLabel.frame = CGRectMake(self.toLabel.frame.origin.x, 290, 240, 40);

    self.line1Label.alpha = 0.5;
    self.line1Label.frame = CGRectMake(10, 280, 300, 3);
    
    self.line2Label.alpha = 0;
    self.bkPaintingImageView.alpha = 0;
    self.bkBeachImageView.alpha = 1;
    self.bkBeachImageView.frame = CGRectMake(0, 0, 300, 270);
    self.contentView.backgroundColor = [UIColor clearColor];
    //font pairing
    [self whichFontPairing];
    
}

//template5
- (void)setTemplate5 {
 
    self.contentView.frame = CGRectMake(10, 50, 300, 433);
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.dateLabel.frame = CGRectMake(self.contentView.frame.origin.x + 20, self.contentView.frame.origin.y - 20, 240, 40);
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    self.subjectLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 60, 240, 40);
    self.subjectBtn.frame = CGRectMake(self.dateLabel.frame.origin.x, self.dateLabel.frame.origin.y + 60, 240, 40);
    self.toLabel.frame = CGRectMake(self.subjectLabel.frame.origin.x, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 240, 20);
    self.toBtn.frame = CGRectMake(self.subjectLabel.frame.origin.x, self.subjectLabel.frame.origin.y + self.subjectLabel.frame.size.height, 240, 30);
    self.emailBodyTextView.frame = CGRectMake(self.toLabel.frame.origin.x - 5, self.toLabel.frame.origin.y + self.toLabel.frame.size.height + 30, 240, 400);
    //starttyping button
    self.startTypingLabel.frame = CGRectMake(self.toLabel.frame.origin.x, self.toLabel.frame.origin.y + self.toLabel.frame.size.height + 30, 240, 40);
    self.subjectLabel.textAlignment = NSTextAlignmentLeft;
    self.toLabel.textAlignment = NSTextAlignmentLeft;
    self.line1Label.alpha = 0;
    self.line2Label.alpha = 0;
    self.bkPaintingImageView.alpha = 1;
    self.bkBeachImageView.alpha = 0;
    self.bkPaintingImageView.frame = CGRectMake(0, 0, 300, 533);
    //font pairing
    [self whichFontPairing];
    
    
}

/* --------------------------------------- font pairing buttons ----------------------------------- */

- (void)whichFontPairing {
    
    //Get the stored data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *fontchoice = [defaults objectForKey:@"fontchoice"];
    
    if ([fontchoice isEqualToString:@"pairing1"]) {
        //subject line
        float fontsizesubject = self.subjectLabel.font.pointSize;
        self.subjectLabel.font = [UIFont fontWithName:@"PTSerif-Regular" size:fontsizesubject];
        
        //to
        float fontsizeto = self.toLabel.font.pointSize;
        self.toLabel.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizeto];
        
        
        //email body
        float fontsizebody = self.emailBodyTextView.font.pointSize;
        self.emailBodyTextView.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizebody];
        
        //dear
        float fontsizedear = self.dearLabel.font.pointSize;
        self.dearLabel.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizedear];
        
        //start typing here
        float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
        self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizestarttyping];
    }
    else if ([fontchoice isEqualToString:@"pairing2"]) {
        //subject line
        float fontsizesubject = self.subjectLabel.font.pointSize;
        self.subjectLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizesubject];
        
        //to
        float fontsizeto = self.toLabel.font.pointSize;
        self.toLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizeto];
        
        
        //email body
        float fontsizebody = self.emailBodyTextView.font.pointSize;
        self.emailBodyTextView.font = [UIFont fontWithName:@"EBGaramond" size:fontsizebody];
        
        //dear
        float fontsizedear = self.dearLabel.font.pointSize;
        self.dearLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizedear];
        
        //start typing here
        float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
        self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizestarttyping];
    }
    else if ([fontchoice isEqualToString:@"pairing3"]) {
        //subject line
        float fontsizesubject = self.subjectLabel.font.pointSize;
        self.subjectLabel.font = [UIFont fontWithName:@"Lato-Light" size:fontsizesubject];
        
        //to
        float fontsizeto = self.toLabel.font.pointSize;
        self.toLabel.font = [UIFont fontWithName:@"Lato-BoldItalic" size:fontsizeto];
        
        
        //email body
        float fontsizebody = self.emailBodyTextView.font.pointSize;
        self.emailBodyTextView.font = [UIFont fontWithName:@"Lato-Light" size:fontsizebody];
        
        //dear
        float fontsizedear = self.dearLabel.font.pointSize;
        self.dearLabel.font = [UIFont fontWithName:@"Lato-Light" size:fontsizedear];
        
        //start typing here
        float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
        self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"Lato-Light" size:fontsizestarttyping];
    }
    else if ([fontchoice isEqualToString:@"pairing4"]) {
        //subject line
        float fontsizesubject = self.subjectLabel.font.pointSize;
        self.subjectLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:fontsizesubject];
        
        //to
        float fontsizeto = self.toLabel.font.pointSize;
        self.toLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:fontsizeto];
        
        
        //email body
        float fontsizebody = self.emailBodyTextView.font.pointSize;
        self.emailBodyTextView.font = [UIFont fontWithName:@"EBGaramond" size:fontsizebody];
        
        //dear
        float fontsizedear = self.dearLabel.font.pointSize;
        self.dearLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizedear];
        
        //start typing here
        float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
        self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizestarttyping];
    }
    else if ([fontchoice isEqualToString:@"pairing5"]) {
        //subject line
        float fontsizesubject = self.subjectLabel.font.pointSize;
        self.subjectLabel.font = [UIFont fontWithName:@"Oswald-Regular" size:fontsizesubject];
        
        //to
        float fontsizeto = self.toLabel.font.pointSize;
        self.toLabel.font = [UIFont fontWithName:@"Lato-Black" size:fontsizeto];
        
        
        //email body
        float fontsizebody = self.emailBodyTextView.font.pointSize;
        self.emailBodyTextView.font = [UIFont fontWithName:@"Lato-Regular" size:fontsizebody];
        
        //dear
        float fontsizedear = self.dearLabel.font.pointSize;
        self.dearLabel.font = [UIFont fontWithName:@"Lato-Regular" size:fontsizedear];
        
        //start typing here
        float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
        self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"Lato-Regular" size:fontsizestarttyping];
    }
    
}

- (IBAction)fontpairingBtn1:(id)sender {
 
    //subject line
    float fontsizesubject = self.subjectLabel.font.pointSize;
    self.subjectLabel.font = [UIFont fontWithName:@"PTSerif-Regular" size:fontsizesubject];
    
    //to
    float fontsizeto = self.toLabel.font.pointSize;
    self.toLabel.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizeto];
    
    
    //email body
    float fontsizebody = self.emailBodyTextView.font.pointSize;
    self.emailBodyTextView.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizebody];
    
    //dear
    float fontsizedear = self.dearLabel.font.pointSize;
    self.dearLabel.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizedear];
    
    //start typing here
    float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
    self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"PTSans-Regular" size:fontsizestarttyping];
    
    //store font choice
    NSString *fontchoice = @"pairing1";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fontchoice forKey:@"fontchoice"];
    
}



- (IBAction)fontpairingBtn2:(id)sender {
    //subject line
    float fontsizesubject = self.subjectLabel.font.pointSize;
    self.subjectLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizesubject];
    
    //to
    float fontsizeto = self.toLabel.font.pointSize;
    self.toLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizeto];
    
    
    //email body
    float fontsizebody = self.emailBodyTextView.font.pointSize;
    self.emailBodyTextView.font = [UIFont fontWithName:@"EBGaramond" size:fontsizebody];
    
    //dear
    float fontsizedear = self.dearLabel.font.pointSize;
    self.dearLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizedear];
    
    //start typing here
    float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
    self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizestarttyping];
    
    //store font choice
    NSString *fontchoice = @"pairing2";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fontchoice forKey:@"fontchoice"];
}

- (IBAction)fontpairingBtn3:(id)sender {
    //subject line
    float fontsizesubject = self.subjectLabel.font.pointSize;
    self.subjectLabel.font = [UIFont fontWithName:@"Lato-Light" size:fontsizesubject];
    
    //to
    float fontsizeto = self.toLabel.font.pointSize;
    self.toLabel.font = [UIFont fontWithName:@"Lato-BoldItalic" size:fontsizeto];
    
    
    //email body
    float fontsizebody = self.emailBodyTextView.font.pointSize;
    self.emailBodyTextView.font = [UIFont fontWithName:@"Lato-Light" size:fontsizebody];
    
    //dear
    float fontsizedear = self.dearLabel.font.pointSize;
    self.dearLabel.font = [UIFont fontWithName:@"Lato-Light" size:fontsizedear];
    
    //start typing here
    float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
    self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"Lato-Light" size:fontsizestarttyping];
    
    //store font choice
    NSString *fontchoice = @"pairing3";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fontchoice forKey:@"fontchoice"];
}

- (IBAction)fontpairingBtn4:(id)sender {
    //subject line
    float fontsizesubject = self.subjectLabel.font.pointSize;
    self.subjectLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:fontsizesubject];
    
    //to
    float fontsizeto = self.toLabel.font.pointSize;
    self.toLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:fontsizeto];
    
    
    //email body
    float fontsizebody = self.emailBodyTextView.font.pointSize;
    self.emailBodyTextView.font = [UIFont fontWithName:@"EBGaramond" size:fontsizebody];
    
    //dear
    float fontsizedear = self.dearLabel.font.pointSize;
    self.dearLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizedear];
    
    //start typing here
    float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
    self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"EBGaramond" size:fontsizestarttyping];
    
    //store font choice
    NSString *fontchoice = @"pairing4";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fontchoice forKey:@"fontchoice"];
}

- (IBAction)fontpairingBtn5:(id)sender {
    //subject line
    float fontsizesubject = self.subjectLabel.font.pointSize;
    self.subjectLabel.font = [UIFont fontWithName:@"Oswald-Regular" size:fontsizesubject];
    
    //to
    float fontsizeto = self.toLabel.font.pointSize;
    self.toLabel.font = [UIFont fontWithName:@"Lato-Black" size:fontsizeto];
    
    
    //email body
    float fontsizebody = self.emailBodyTextView.font.pointSize;
    self.emailBodyTextView.font = [UIFont fontWithName:@"Lato-Regular" size:fontsizebody];
    
    //dear
    float fontsizedear = self.dearLabel.font.pointSize;
    self.dearLabel.font = [UIFont fontWithName:@"Lato-Regular" size:fontsizedear];
    
    //start typing here
    float fontsizestarttyping = self.startTypingLabel.titleLabel.font.pointSize;
    self.startTypingLabel.titleLabel.font = [UIFont fontWithName:@"Lato-Regular" size:fontsizestarttyping];
    
    //store font choice
    NSString *fontchoice = @"pairing5";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fontchoice forKey:@"fontchoice"];
}
@end
