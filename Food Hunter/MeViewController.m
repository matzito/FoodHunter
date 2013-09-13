//
//  MeViewController.m
//  Food Hunter
//
//  Created by Matz on 9/11/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Me", @"Me");
        self.tabBarItem.image = [UIImage imageNamed:@"me"];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_background.png"]]];

        self.activityTable.backgroundView = nil;
    }
    return self;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.items count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableCell"];
    // setup cell
 
    cell.nameLabel.text = [[self.items objectAtIndex:[indexPath row]] objectForKey:@"name"];
    cell.categoryLabel.text= [NSString stringWithFormat:@"%@",[[self.items objectAtIndex:[indexPath row]] objectForKey:@"name"]];
    cell.restaurantLabel.text = [[self.items objectAtIndex:[indexPath row]] objectForKey:@"restaurant"];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"row"]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.activityTable registerNib:[UINib nibWithNibName:@"CustomTableCell" bundle:nil] forCellReuseIdentifier:@"CustomTableCell"];

    self.items = [[NSMutableArray alloc] init];
    
    NSDictionary* dict = [ NSDictionary dictionaryWithContentsOfFile:[ [ [ NSBundle mainBundle] bundlePath ] stringByAppendingPathComponent:@"data.plist" ] ];
    
    NSMutableArray *popo = [[NSMutableArray alloc]initWithArray:[dict objectForKey: @"items" ]];
    
    for (id object in popo) {
        
        if ([[object valueForKey:@"user"] isEqualToString:@"malvaradov10"]){
  
            [self.items addObject:object];
        }
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
