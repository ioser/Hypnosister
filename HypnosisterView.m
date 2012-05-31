//
//  HypnosisterView.m
//  Hypnosister
//
//  Created by Sara Duckler on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisterView.h"

@implementation HypnosisterView

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect bounds = [self bounds];
	
	// Calculate the center point of our circle
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width / 2.0;
	center.y = bounds.origin.y + bounds.size.height / 2.0;
	
	// Calculate the max radius
	float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
	
	// Set the line width
	CGContextSetLineWidth(ctx, 10.0);
	
	// Set the pen color to be gray
	CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
	
	// Add our shape to the drawing context
	CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
	
	// Perform the actual drawing
	CGContextStrokePath(ctx);
}

@end
