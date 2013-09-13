//
//  AboutViewController.m
//  Food Hunter
//
//  Created by Matz on 9/11/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//


#import "AboutViewController.h"


@interface AboutViewController ()


@end

@implementation AboutViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      
        self.title = NSLocalizedString(@"Info", @"Info");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    

}

- (void)viewDidUnload
{


}


@end
