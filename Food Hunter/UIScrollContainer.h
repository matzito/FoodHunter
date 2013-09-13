//
//  UIScrollContainer.h
//  Food Hunter
//
//  Created by Matz on 9/9/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollContainer : UIScrollView

@property (strong, nonatomic) UIViewController *parent;

- (void) setupModel:(NSArray *)itemArray;


@end
