//
//  ChooseTypeViewController.m
//  composr
//
//  Created by Lei Bao on 6/19/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "ChooseTypeViewController.h"
#import "ListViewController.h"
#import "ComposeSubjectToViewController.h"

@interface ChooseTypeViewController ()
- (IBAction)onDrag:(UIPanGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (weak, nonatomic) IBOutlet UIView *templateHolder;
@property (weak, nonatomic) IBOutlet UITextView *typingArea;
@property (weak, nonatomic) IBOutlet UILabel *typingAreaLabel;

-(void)onLeftButton;
-(void)onRightButton;
@end

@implementation ChooseTypeViewController

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
   // self.navigationItem.title = @"Choose Mail Type";
   
    /* set up left and right buttons */
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton)];
   self.navigationItem.leftBarButtonItem = leftButton;

    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    //load scroll view
    self.scrollView.contentSize = self.templateHolder.frame.size;
    
   
    
   // UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ChooseStyle"]];
    
    //iv.frame = CGRectMake(0.0, 0.0, iv.frame.size.width, iv.frame.size.height);
    [self.scrollView addSubview: self.templateHolder];
    
    self.typingArea.delegate = self;
}

- (void)textViewDidChange:(UITextView *)textView {
    
    self.typingAreaLabel.text = @"";
    NSLog(@"typed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDrag:(UIPanGestureRecognizer *)sender {
    
//    CGPoint point = [sender locationInView:self.view];
//    
//    if (sender.state == UIGestureRecognizerStateBegan) {
//        
//        // when this window is at the top of the view
//        if (self.view.frame.origin.y == 0) {
//            [UIView animateWithDuration:1 animations:^{
//                self.view.frame = CGRectMake(0, point.y, self.view.frame.size.width, self.view.frame.size.height);
//            } completion:nil];
//        }
//        
//        // when this window is at the bottom of the view
//        else if (self.view.frame.origin.y == self.view.frame.size.height - 40) {
//            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
//                self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//            } completion:nil];
//        }
//        
//        
//    } // end of statebegan
//    
//    else if (sender.state == UIGestureRecognizerStateEnded) {
//
//        
//            //decide to bounce back to top or going all the way down
//            
//            if (point.y < 80) {
//                
//                [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
//                    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//                } completion:nil];
//                
//            } // end point.y < 40
//            
//            else if (point.y >= 80) {
//                
//                [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
//                    self.view.frame = CGRectMake(0, self.view.frame.size.height - 80, self.view.frame.size.width, self.view.frame.size.height);
//                } completion:nil];
//                
//
//                
//            } //end point.y >= 40
//            
//
//        
//    } // end of stateEnded
    
}//end of onDrag

- (void)onLeftButton {
        self.view.window.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)onRightButton {
    
}


@end
