//
//  ItemViewController.m
//  Food Hunter
//
//  Created by Matz on 9/10/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
            }
    return self;
}

- (void)setupModel{
       
    self.imageContainer.image = [UIImage imageNamed:[self.itemData objectForKey:@"image"]];
    self.titleContainer.text = [self.itemData objectForKey:@"name"];
    self.reviewContainer.text = [self.itemData objectForKey:@"review"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_background.png"]]];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //NSLog(@"%@",self.itemIndex);
    
    NSDictionary* dict = [ NSDictionary dictionaryWithContentsOfFile:[ [ [ NSBundle mainBundle] bundlePath ] stringByAppendingPathComponent:@"data.plist" ] ];
    
    NSMutableArray *popo = [[NSMutableArray alloc]initWithArray:[dict objectForKey: @"items" ]];
    
    for (id object in popo) {
        
        if ([[object valueForKey:@"id"] isEqualToString:self.itemIndex]){
            self.itemData = object;
            [self setupModel];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
