//
//  ItemViewController.h
//  Food Hunter
//
//  Created by Matz on 9/10/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageContainer;
@property (strong, nonatomic) IBOutlet UILabel *titleContainer;
@property (strong, nonatomic) IBOutlet UILabel *reviewContainer;
@property (assign, nonatomic) NSString *itemIndex;
@property (assign, nonatomic) NSDictionary *itemData;



@end
