//
//  SelectTypeViewController.m
//  composr
//
//  Created by Lei Bao on 6/29/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "SelectTypeViewController.h"

@interface SelectTypeViewController ()
- (IBAction)onNeverMind:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnText;
@property (weak, nonatomic) IBOutlet UIButton *btnPhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnLink;
@property (weak, nonatomic) IBOutlet UIButton *btnVideo;
@property (weak, nonatomic) IBOutlet UIButton *btnLocation;
@property (weak, nonatomic) IBOutlet UIButton *btnEvent;
@property (weak, nonatomic) IBOutlet UIButton *btnPoll;
@property (weak, nonatomic) IBOutlet UIButton *btnBarcode;

-(void)closeWindow;

@end

@implementation SelectTypeViewController

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
    
    NSLog(@"loaded");
    
    float btnTextY = self.btnText.frame.origin.y;
    float btnPhotoY = self.btnPhoto.frame.origin.y;
    float btnLinkY = self.btnLink.frame.origin.y;
    float btnVideoY = self.btnVideo.frame.origin.y;
    float btnLocationY = self.btnLocation.frame.origin.y;
    float btnEventY = self.btnEvent.frame.origin.y;
    float btnPollY = self.btnPoll.frame.origin.y;
    float btnBarcodeY = self.btnBarcode.frame.origin.y;
    
    self.btnText.frame = CGRectMake(self.btnText.frame.origin.x, self.view.frame.size.height, self.btnText.frame.size.width, self.btnText.frame.size.height);
    self.btnPhoto.frame = CGRectMake(self.btnPhoto.frame.origin.x, self.view.frame.size.height, self.btnPhoto.frame.size.width, self.btnPhoto.frame.size.height);
    self.btnLink.frame = CGRectMake(self.btnLink.frame.origin.x, self.view.frame.size.height, self.btnLink.frame.size.width, self.btnLink.frame.size.height);
    self.btnVideo.frame = CGRectMake(self.btnVideo.frame.origin.x, self.view.frame.size.height, self.btnVideo.frame.size.width, self.btnVideo.frame.size.height);
    self.btnLocation.frame = CGRectMake(self.btnLocation.frame.origin.x, self.view.frame.size.height, self.btnLocation.frame.size.width, self.btnLocation.frame.size.height);
    self.btnEvent.frame = CGRectMake(self.btnEvent.frame.origin.x, self.view.frame.size.height, self.btnEvent.frame.size.width, self.btnEvent.frame.size.height);
    self.btnPoll.frame = CGRectMake(self.btnPoll.frame.origin.x, self.view.frame.size.height, self.btnPoll.frame.size.width, self.btnPoll.frame.size.height);
    self.btnBarcode.frame = CGRectMake(self.btnBarcode.frame.origin.x, self.view.frame.size.height, self.btnBarcode.frame.size.width, self.btnBarcode.frame.size.height);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnText.frame = CGRectMake(self.btnText.frame.origin.x, btnTextY, self.btnText.frame.size.width, self.btnText.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnPhoto.frame = CGRectMake(self.btnPhoto.frame.origin.x, btnPhotoY, self.btnPhoto.frame.size.width, self.btnPhoto.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnLink.frame = CGRectMake(self.btnLink.frame.origin.x, btnLinkY, self.btnLink.frame.size.width, self.btnLink.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnVideo.frame = CGRectMake(self.btnVideo.frame.origin.x, btnVideoY, self.btnVideo.frame.size.width, self.btnVideo.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnLocation.frame = CGRectMake(self.btnLocation.frame.origin.x, btnLocationY, self.btnLocation.frame.size.width, self.btnLocation.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnEvent.frame = CGRectMake(self.btnEvent.frame.origin.x, btnEventY, self.btnEvent.frame.size.width, self.btnEvent.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:1.1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnPoll.frame = CGRectMake(self.btnPoll.frame.origin.x, btnPollY, self.btnPoll.frame.size.width, self.btnPoll.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:1.2 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnBarcode.frame = CGRectMake(self.btnBarcode.frame.origin.x, btnBarcodeY, self.btnBarcode.frame.size.width, self.btnBarcode.frame.size.height);
    } completion:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onNeverMind:(id)sender {
    
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnText.frame = CGRectMake(self.btnText.frame.origin.x, -120, self.btnText.frame.size.width, self.btnText.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnPhoto.frame = CGRectMake(self.btnPhoto.frame.origin.x, -120, self.btnPhoto.frame.size.width, self.btnPhoto.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnLink.frame = CGRectMake(self.btnLink.frame.origin.x, -120, self.btnLink.frame.size.width, self.btnLink.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnVideo.frame = CGRectMake(self.btnVideo.frame.origin.x, -120, self.btnVideo.frame.size.width, self.btnVideo.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnLocation.frame = CGRectMake(self.btnLocation.frame.origin.x, -120, self.btnLocation.frame.size.width, self.btnLocation.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnEvent.frame = CGRectMake(self.btnEvent.frame.origin.x, -120, self.btnEvent.frame.size.width, self.btnEvent.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnPoll.frame = CGRectMake(self.btnPoll.frame.origin.x, -120, self.btnPoll.frame.size.width, self.btnPoll.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2 options:0 animations:^{
        self.btnBarcode.frame = CGRectMake(self.btnBarcode.frame.origin.x, -120, self.btnBarcode.frame.size.width, self.btnBarcode.frame.size.height);
    } completion:nil];
    
    [self performSelector:@selector(closeWindow) withObject:nil afterDelay:0.3];

    
    
}

- (void)closeWindow {
    self.view.window.frame = CGRectMake(0, self.view.frame.size.height + 120, self.view.frame.size.width, self.view.frame.size.height);
}

@end
