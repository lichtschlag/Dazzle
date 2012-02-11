//
//  DazTouchController.m
//  Dazzle
//
//  Created by Leonhard Lichtschlag on 11/Feb/12.
//  Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.
//

#import "DazTouchController.h"
#import <QuartzCore/CoreAnimation.h>

// ===============================================================================================================
@implementation DazTouchController
// ===============================================================================================================

@synthesize ringEmitter;


// ---------------------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark View Lifecycle
// ---------------------------------------------------------------------------------------------------------------

- (void) viewDidLoad
{
    [super viewDidLoad];
	
	CGRect viewBounds = self.view.layer.bounds;
	
	CALayer *testBox = [CALayer layer];
	testBox.position = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height - 35);
	testBox.bounds = CGRectMake(0, 0, viewBounds.size.width/2.0, 50.0);
	testBox.backgroundColor = [[UIColor colorWithRed:1.0 green:0.8 blue:0.4 alpha:1.0] CGColor];
	[self.view.layer addSublayer:testBox];
	
	// Create the emitter layers
	self.ringEmitter = [CAEmitterLayer layer];
	
	// Place layers just above the tab bar
	self.ringEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height - 60);
	self.ringEmitter.emitterSize		= CGSizeMake(viewBounds.size.width/2.0, 0);
	self.ringEmitter.emitterMode		= kCAEmitterLayerOutline;
	self.ringEmitter.emitterShape	= kCAEmitterLayerLine;
	self.ringEmitter.renderMode		= kCAEmitterLayerAdditive;
		
	// Create the fire emitter cell
	CAEmitterCell* fire = [CAEmitterCell emitterCell];
	[fire setName:@"fire"];
	
	fire.birthRate			= 0;
	fire.emissionLongitude  = M_PI;
	fire.velocity			= -80;
	fire.velocityRange		= 30;
	fire.emissionRange		= 1.1;
	fire.yAcceleration		= -200;
	fire.scaleSpeed			= 0.3;
	fire.lifetime			= 50;
	fire.lifetimeRange		= (50.0 * 0.35);
	
	fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
	fire.contents = (id) [[UIImage imageNamed:@"DazFire"] CGImage];
	
	
	// Add the smoke emitter cell to the smoke emitter layer
	self.ringEmitter.emitterCells	= [NSArray arrayWithObject:fire];
	[self.view.layer addSublayer:self.ringEmitter];
}


- (void) viewWillUnload
{
	[super viewWillUnload];
	[self.ringEmitter removeFromSuperlayer];
	self.ringEmitter = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// ---------------------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark Interaction
// ---------------------------------------------------------------------------------------------------------------

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint touchPoint = [touch locationInView:self.view];
	[self touchAtPosition:touchPoint];
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint touchPoint = [touch locationInView:self.view];
	[self touchAtPosition:touchPoint];
}


- (void) touchAtPosition:(CGPoint)position
{
	float zeroToOne;
	//Update the fire properties
	[self.ringEmitter setValue:[NSNumber numberWithInt:(zeroToOne * 500)]
					forKeyPath:@"emitterCells.fire.birthRate"];
	[self.ringEmitter setValue:[NSNumber numberWithFloat:zeroToOne]
					forKeyPath:@"emitterCells.fire.lifetime"];
	[self.ringEmitter setValue:[NSNumber numberWithFloat:(zeroToOne * 0.35)]
					forKeyPath:@"emitterCells.fire.lifetimeRange"];
}


@end

