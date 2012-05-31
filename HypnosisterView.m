//
//  HypnosisterView.m
//  Hypnosister
//
//  Created by Sara Duckler on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisterView.h"

@implementation HypnosisterView

@synthesize lineColor = _lineColor;

//OVERRIDE
- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self) {
		// All Hypnosister views start with a clear color background
		[self setBackgroundColor:[UIColor clearColor]];		
	}
	
	return self;
}

- (id)initWithFrame:(CGRect)frame andColor:(UIColor *)color
{
	self = [self initWithFrame:frame];
	
	if (self) {
		self.lineColor = color;
		
		if (self.lineColor == Nil) {
			self.lineColor = [UIColor blackColor];
		}
	}
	
	return self;
}

//OVERRIDE
- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect bounds = [self bounds];
	
	// Calculate the center point of our circle
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width / 2.0;
	center.y = bounds.origin.y + bounds.size.height / 2.0;
	
	// Calculate the max radius
	float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
	
	// Set the line width
	CGContextSetLineWidth(ctx, 10.0);
	
	// Set the pen color to be gray
	CGContextSetStrokeColorWithColor(ctx, [self.lineColor CGColor]);
	
	for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
		// Add our shape to the drawing context
		CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
		
		// Perform the actual drawing
		CGContextStrokePath(ctx);
	}
	
}

@end
