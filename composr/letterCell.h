//
//  letterCell.h
//  composr
//
//  Created by Lei Bao on 7/11/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface letterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bkImage;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;

@end
