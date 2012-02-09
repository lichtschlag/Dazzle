//
//  DazInfoController.m
//  Dazzle
//
//  Created by Leonhard Lichtschlag on 9/Feb/12.
//  Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.
//

#import "DazInfoController.h"

// ===============================================================================================================
@implementation DazInfoController
// ===============================================================================================================


// ---------------------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark View Lifecycle
// ---------------------------------------------------------------------------------------------------------------

- (void) viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void) viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void) viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}


- (void) viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Accept all orientations defined in the Info.plist
	return YES;
}


@end
