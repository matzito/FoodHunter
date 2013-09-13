//
//  HomeViewController.m
//  Food Hunter
//
//  Created by Matz on 9/9/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import "HomeViewController.h"
#import "ItemViewController.h"



@implementation HomeViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.tabBarItem.image = [UIImage imageNamed:@"me"];
        self.title = NSLocalizedString(@"Food Hunter", @"Food Hunter");
        self.tabBarItem.image = [UIImage imageNamed:@"search"];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_background.png"]]];

    
    }
    return self;
}


-(void) setupModel {
    
    
}


-(void) setupItemContainer {

    NSDictionary* dict = [ NSDictionary dictionaryWithContentsOfFile:[ [ [ NSBundle mainBundle] bundlePath ] stringByAppendingPathComponent:@"data.plist" ] ];
    
    NSMutableArray *itemsArrayAll = [[NSMutableArray alloc]initWithArray:[dict objectForKey: @"items" ]];
    
    NSMutableArray *itemArray = [[NSMutableArray alloc] init];
    
    for (id object in itemsArrayAll) {
        
        if ([[object valueForKey:@"category"] isEqualToString:self.category]){

             [itemArray addObject:object];
            
        } else if ([self.category isEqualToString:@"all"]) {
            
             [itemArray addObject:object];
        }
    }
    
    [self.scrollView1 setupModel:itemArray];
}

-(void) reloadModel{
    
    for (UIView *subview in self.scrollView1.subviews) {
        [subview removeFromSuperview];
    }
    [self setupItemContainer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.scrollView1.parent = self;
    self.scrollMenu.parent = self;
    self.category= @"all";
   [self setupItemContainer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
