//
//  CustomTableCell.h
//  Food Hunter
//
//  Created by Matz on 9/12/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel *nameLabel;
@property (nonatomic,strong) IBOutlet UILabel *categoryLabel;
@property (nonatomic,strong) IBOutlet UILabel *restaurantLabel;

@end
