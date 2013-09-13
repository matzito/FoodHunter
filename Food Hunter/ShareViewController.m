//
//  ShareViewController.m
//  Food Hunter
//
//  Created by Matz on 9/11/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import "ShareViewController.h"
 #import <QuartzCore/QuartzCore.h> 

@interface ShareViewController ()

@end

@implementation ShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Share", @"Share");
        self.tabBarItem.image = [UIImage imageNamed:@"First"];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_background.png"]]];
        
       /* [self.reviewContainer.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [self.reviewContainer.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
        [self.reviewContainer.layer setShadowOpacity:1.0];
        [self.reviewContainer.layer setShadowRadius:0.3];*/
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

@end
