//
//  EmailPreviewViewController.h
//  composr
//
//  Created by Lei Bao on 7/28/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailPreviewViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageController;

@end
