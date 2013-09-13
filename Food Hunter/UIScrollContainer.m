//
//  UIScrollContainer.m
//  Food Hunter
//
//  Created by Matz on 9/9/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import "UIScrollContainer.h"
#import "ItemViewController.h"

#define iPad    UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define itemOffset              (iPad ? 1.8f : 1.0f)
#define itemViewOffset          (iPad ? 1.7f : 1.0f)
#define imageAmcLeft            (iPad ? 14.0f : 7.0f)
const CGFloat kScrollObjHeight	= 250.0f;
const CGFloat kScrollObjWidth	= 320.0f;


@interface UIScrollContainer()

@property (nonatomic, assign) int kNumImages;
@property (nonatomic,strong) NSMutableArray *items;

@end


@implementation UIScrollContainer


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
    }
    return self;
}


-(void) awakeFromNib {
    
     [self setupModel:nil];
}


#pragma mark -
#pragma mark - Create Layout View

- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [self subviews];
    
    // reposition of subviews
	CGFloat curXLoc = imageAmcLeft;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIView class]] && view.tag > 0)
		{
            
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 15);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth*itemOffset);
            
        }
	}
    
	[self setContentSize:CGSizeMake((_kNumImages * kScrollObjWidth*itemViewOffset), kScrollObjHeight)];
}

- (void) setupModel:(NSArray *)itemArray {

    self.items = [[NSMutableArray alloc]initWithArray:itemArray];
    
    srandom(time(NULL));
    
    self.kNumImages = [_items count];
    for (NSInteger i = 0; i < _kNumImages; i++)
    {
        NSInteger swap = random() % (_kNumImages - i) + i;
        [self.items exchangeObjectAtIndex:swap withObjectAtIndex:i];
    }
    
    NSUInteger i;
    for (i = 1; i <= _kNumImages; i++)
    {
        UIView *itemContainer = [[UIView alloc] init];
        itemContainer.tag = i;
         [itemContainer setFrame:CGRectMake(0,0,305, 270)];
        [self addSubview:itemContainer];
        
        UIImageView* imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"front_review"]];
        [imageView2 setFrame:CGRectMake(0,250,305, 65)];
        [itemContainer addSubview:imageView2];
        
        UILabel *reviewLabel = [[UILabel alloc] init];
        [reviewLabel setFrame:CGRectMake(50,260,180, 30)];
        [reviewLabel setBackgroundColor:[UIColor clearColor]];
        [reviewLabel setFont:[UIFont fontWithName:@"Arial" size:11.0]];
        [reviewLabel setTextColor:[UIColor colorWithRed:(98.0/255) green:(73.0/255) blue:(72.0/255) alpha:0.9 ]];
        reviewLabel.numberOfLines = 2;
        reviewLabel.minimumScaleFactor = 0.5;
        reviewLabel.adjustsFontSizeToFitWidth = YES;
        reviewLabel.text = [[_items objectAtIndex:i-1] objectForKey:@"review"];
        
        [itemContainer addSubview:reviewLabel];
 
        UIImageView* imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[_items objectAtIndex:i-1] objectForKey:@"user"]]];
        [imageView3 setFrame:CGRectMake(248,255,45, 45)];
        [itemContainer addSubview:imageView3];
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[_items objectAtIndex:i-1] objectForKey:@"image"]]];
        
        [imageView setFrame:CGRectMake(0,0,305, 250)];
        imageView.userInteractionEnabled = YES;
        
        imageView.clipsToBounds = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        [itemContainer addGestureRecognizer:tap];
        
        
        imageView.tag = i;
        [itemContainer addSubview:imageView];
  
    }
    
    [self layoutScrollImages];    
}

- (void) imageTapped:(id)sender   {

        int tag = [[sender view ] tag];
        ItemViewController *view = [[ItemViewController alloc] initWithNibName:@"ItemViewController" bundle:nil];
        view.itemIndex= [[_items objectAtIndex:tag-1] objectForKey:@"id"];
        [_parent.navigationController  pushViewController:view animated:YES];
}


@end
