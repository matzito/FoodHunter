//
//  UIScrollMenu.m
//  Food Hunter
//
//  Created by Matz on 9/9/13.
//  Copyright (c) 2013 Matz. All rights reserved.
//

#import "UIScrollMenu.h"
#import "HomeViewController.h"

#define iPad    UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define itemOffset              (iPad ? 1.8f : 1.0f)
#define itemViewOffset          (iPad ? 1.7f : 1.0f)
#define imageAmcLeft            (iPad ? 14.0f : 7.0f)


const CGFloat kScrollObjHeight2	= 30.0f;
const CGFloat kScrollObjWidth2	= 106.3f;

@interface UIScrollMenu()

@property (nonatomic, assign) int kNumButtons;
@property (nonatomic,strong) NSMutableArray *items;


-(void)setupModel;

@end

@implementation UIScrollMenu


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.decelerationRate = UIScrollViewDecelerationRateNormal;
    }
    return self;
}

-(void) awakeFromNib {
    
    [self setupModel];
}


#pragma mark -
#pragma mark - Create Layout View


- (void)layoutScrollButtons
{
    
	UIImageView *view = nil;
	NSArray *subviews = [self subviews];
    
	// reposition of subviews
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIButton class]] && view.tag > 0)
		{
            
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth2*itemOffset);
            
        }
	}
    
	// custom content size 
	[self setContentSize:CGSizeMake((_kNumButtons * kScrollObjWidth2*itemViewOffset), kScrollObjHeight2)];
}


- (void) setupModel {

    self.items =   [NSMutableArray arrayWithObjects:
                    [NSString stringWithFormat:@"all"],
                    [NSString stringWithFormat:@"pizza"],
                    [NSString stringWithFormat:@"drinks"],
                    [NSString stringWithFormat:@"hamburgers"],
                    [NSString stringWithFormat:@"pasta"],
                    [NSString stringWithFormat:@"tacos"],
                    [NSString stringWithFormat:@"salads"],
                    [NSString stringWithFormat:@"antojitos"],
                    nil];
    
    
    self.kNumButtons = [_items count]-1;
   
    NSUInteger i;
    for (i = 1; i <= _kNumButtons; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self
                   action:@selector(buttonInfo:) 	
         forControlEvents:UIControlEventTouchDown];
        
        [button setImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0,-103.0, 0, 0)];
        [button setTitle:[_items objectAtIndex:i-1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:(130.0/255) green:(117.0/255) blue:(115.0/255) alpha:0.9 ]forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0,0,107, kScrollObjHeight2)];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [button setTag:i];

        [self addSubview:button];
   
    }
    
    [self layoutScrollButtons];

}

-(void)buttonInfo:(id)sender {
 
    NSString *title = [(UIButton *)sender currentTitle];
    ((HomeViewController *)self.parent).category = title;
    [((HomeViewController *)self.parent) reloadModel];

}

@end
