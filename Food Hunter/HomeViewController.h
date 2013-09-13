//
//  HomeViewController.h
//  Food Hunter
//
//  Created by Matz on 9/9/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollContainer.h"
#import "UIScrollMenu.h"

@interface HomeViewController : UIViewController


@property (strong, nonatomic) NSMutableArray *itemsToDisplay;

@property (strong, nonatomic) NSString *category;



@property (strong, nonatomic) IBOutlet UIScrollContainer *scrollView1;
@property (strong, nonatomic) IBOutlet UIScrollMenu *scrollMenu;

-(void) reloadModel;


@end	
