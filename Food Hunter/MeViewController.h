//
//  MeViewController.h
//  Food Hunter
//
//  Created by Matz on 9/11/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableCell.h"

@interface MeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) IBOutlet UITableView* activityTable;
@property (strong, nonatomic) NSMutableArray* items;


@end
