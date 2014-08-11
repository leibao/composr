//
//  ListLettersViewController.m
//  composr
//
//  Created by Lei Bao on 6/29/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "ListLettersViewController.h"
#import "letterCell.h"
#import "JapanTripEmailViewController.h"

@interface ListLettersViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *letters;
- (IBAction)onTap:(UITapGestureRecognizer *)sender;
@property (strong, nonatomic) UIWindow *foregroundWindow;

@end

@implementation ListLettersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.letters = @[
                         @{ @"subject" : @"My Japan Trip",
                            @"to" : @"Erin, Lee, Shilya",
                            @"bk" : @"bk-japantrip"},
                         @{ @"subject" : @"Cute Sofa",
                            @"to" : @"Erin, Lee, Shilya",
                            @"bk" : @"bk-cutesofa"},
                         @{ @"subject" : @"Greece Trip Planning",
                            @"to" : @"Erin, Lee, Shilya",
                            @"bk" : @"bk-greece"},
                         @{ @"subject" : @"Shilya's Birthday",
                            @"to" : @"Erin, Lee, Shilya",
                            @"bk" : @"bk-birthday"},
                         ];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // scrollview with the image
//    self.ScrollView.contentSize = self.ImageView.frame.size;
//    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list"]];
//    iv.frame = CGRectMake(0, 0, iv.frame.size.width, iv.frame.size.height);
//    
//    [self.ScrollView addSubview:iv];
    
    // setup table view
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //register the cell
    UINib *letterCellNib = [UINib nibWithNibName:@"letterCell" bundle:nil];
    [self.tableView registerNib:letterCellNib forCellReuseIdentifier:@"letterCell"];
    
    self.tableView.rowHeight = 200;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.letters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    letterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"letterCell" forIndexPath:indexPath];
    
    NSDictionary *letters = self.letters[indexPath.row];
    cell.subjectLabel.text = letters[@"subject"];
    cell.toLabel.text = letters[@"to"];
    //cell.bkImage.image = letters[@"bk"];
    NSString *imgName = letters[@"bk"];
    [cell.bkImage setImage:[UIImage imageNamed:imgName]];
    NSLog(@"%@", letters[@"bk"]);
    return cell;
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    
    self.foregroundWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
   // UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[TextViewController new]];
    
    JapanTripEmailViewController *emailvc = [[JapanTripEmailViewController alloc] init];
    
    self.foregroundWindow.rootViewController = emailvc;
    self.foregroundWindow.windowLevel = UIWindowLevelStatusBar;
    self.foregroundWindow.hidden = NO;
    
    
}
@end
