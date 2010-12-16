//
//  mainViewController.h
//  gradientOnNavigationBar
//
//  Created by maliy on 12/15/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import "mainViewController.h"

#define COLOR_COMPONENTS      { 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0 }

@implementation UINavigationBar (UINavigationBarCategory)

- (void) drawRect:(CGRect) rect
{	
	// emulate the tint colored bar
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat locations[2] = { 0.0, 1.0 };
	CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
	
	CGFloat components[8] = COLOR_COMPONENTS;
	CGGradientRef gradient = CGGradientCreateWithColorComponents(myColorspace, components, locations, 2);
	CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0,self.frame.size.height), 0);
	CGGradientRelease(gradient);
	
	CGColorSpaceRelease(myColorspace);
	
	// top Line
	CGContextSetRGBStrokeColor(context, 1, 1, 1, 1.0);
	CGContextMoveToPoint(context, 0, 0);
	CGContextAddLineToPoint(context, self.frame.size.width, 0);
	CGContextStrokePath(context);
	
	// bottom line
	CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
	CGContextMoveToPoint(context, 0, self.frame.size.height);
	CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
	CGContextStrokePath(context);
}

@end



@implementation mainViewController

#pragma mark lifeCycle

- (id) init
{
	if (self = [super init])
	{
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}



#pragma mark -

- (void) viewDidAppear:(BOOL) animated
{
}

- (void) viewDidDisappear:(BOOL) animated
{
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
{
	return YES;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	[super loadView];
	
	self.navigationItem.title = NSLocalizedString(@"UINavigationBarGradient", @"");
	
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	
	UIView *contentView = [[UIView alloc] initWithFrame:screenRect];
	contentView.autoresizesSubviews = YES;
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	contentView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
	
	self.view = contentView;
	[contentView release];

}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
}



@end
