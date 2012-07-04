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
@synthesize text = _text;

- (void)setLineColor:(UIColor *)lineColor
{
	_lineColor = lineColor;
	[self setNeedsDisplay];
}

//OVERRIDE
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (motion == UIEventSubtypeMotionShake) {
		NSLog(@"Device is shaking.");
		if (self.lineColor == [UIColor redColor]) {
			[self setLineColor:[UIColor blueColor]];
		} else if (self.lineColor == [UIColor blueColor]) {
			[self setLineColor:[UIColor redColor]];
		} else {
			[self setLineColor:[UIColor blueColor]];
		}
	}
}

//OVERRIDE
- (BOOL)canBecomeFirstResponder
{
	// We need to handle "shake" events
	return YES;
}

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
		
		self.text = @"Hello, world!";
	}
	
	return self;
}

- (void)drawMessage:(CGContextRef)ctx atPoint:(CGPoint)center withShadow:(BOOL)shadow
{
	// Get a font to draw it in
	UIFont *font = [UIFont boldSystemFontOfSize:28];
	CGRect textRect;
	
	// How big is this string when drawn in this font?
	textRect.size = [self.text sizeWithFont:font];
	
	// Let's put that string in the center of the view
	textRect.origin.x = center.x - textRect.size.width / 2.0;
	textRect.origin.y = center.y - textRect.size.height / 2.0;
	
	// Set the fill color of the current context to black
	[[UIColor blackColor] setFill];
	
	if (shadow) {
		CGSize offset = CGSizeMake(4, 3);
		CGColorRef shadowColor = [[UIColor darkGrayColor] CGColor];
		CGContextSetShadowWithColor(ctx, offset, 2.0, shadowColor);
	}
	
	// Draw the string
	[self.text drawInRect:textRect withFont:font];	
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
//	CGContextSetStrokeColorWithColor(ctx, [self.lineColor CGColor]);
	[self.lineColor setStroke];
	
	for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
		// Add our shape to the drawing context
		CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
		
		// Perform the actual drawing
		CGContextStrokePath(ctx);
	}
	
	// Draw our secret message
	[self drawMessage:ctx atPoint:center withShadow:YES];
}

@end
