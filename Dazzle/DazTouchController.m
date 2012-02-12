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
@synthesize testBox;


// ---------------------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark View Lifecycle
// ---------------------------------------------------------------------------------------------------------------

- (void) viewDidLoad
{
    [super viewDidLoad];
	
	CGRect viewBounds = self.view.layer.bounds;
	
	self.testBox		= [CALayer layer];
	self.testBox.position		= CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height/2.0);
	self.testBox.bounds			= CGRectMake(0.0, 0.0, 50.0, 50.0);
	self.testBox.cornerRadius	= 25.0;
	self.testBox.backgroundColor = [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.1] CGColor];
	[self.view.layer addSublayer:testBox];
	
	// Create the emitter layers
	self.ringEmitter = [CAEmitterLayer layer];
	
	// Place layers just above the tab bar
	self.ringEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height/2.0);
	self.ringEmitter.emitterSize	= CGSizeMake(50, 0);
	self.ringEmitter.emitterMode	= kCAEmitterLayerOutline;
	self.ringEmitter.emitterShape	= kCAEmitterLayerCircle;
	self.ringEmitter.renderMode		= kCAEmitterLayerAdditive;
		
	// Create the fire emitter cell
	CAEmitterCell* ring = [CAEmitterCell emitterCell];
	[ring setName:@"ring"];
	
	ring.birthRate			= 0;
	//	ring.emissionLongitude  = M_PI;
	ring.velocity			= 250;
	//	ring.velocityRange		= 0;
	//	ring.emissionRange		= M_PI;
	//	ring.yAcceleration		= -200;
	ring.scale				= 0.3;
	ring.scaleSpeed			= 0.3;
	ring.lifetime			= 2;
	//	ring.lifetimeRange		= 0;
	
	ring.color = [[UIColor whiteColor] CGColor];
	ring.contents = (id) [[UIImage imageNamed:@"DazStarOutline"] CGImage];
		
	// Putting things together
	self.ringEmitter.emitterCells = [NSArray arrayWithObject:ring];
	[self.view.layer addSublayer:self.ringEmitter];
}


- (void) viewWillUnload
{
	[super viewWillUnload];
	[self.ringEmitter removeFromSuperlayer];
	self.ringEmitter = nil;
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
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
	// Bling bling..
	CABasicAnimation *burst = [CABasicAnimation animationWithKeyPath:@"emitterCells.ring.birthRate"];
	burst.fromValue			= [NSNumber numberWithFloat: 25.0];
	burst.toValue			= [NSNumber numberWithFloat: 0.0];
	burst.duration			= 0.5;
	burst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	[self.ringEmitter addAnimation:burst forKey:@"burst"]; 

	// Move to touch point
	[CATransaction begin];
	[CATransaction setDisableActions: YES];
	self.ringEmitter.emitterPosition	= position;
	self.testBox.position				= position;
	[CATransaction commit];
}


@end

