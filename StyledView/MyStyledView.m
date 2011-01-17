//
//  MyStyledView.m
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  BSD License
//

#import "MyStyledView.h"
#import "NSBezierPath+Additions.h"
#import "NSImage+Additions.h"


@implementation MyStyledView

@synthesize gradient;
@synthesize gradientAngle;
@synthesize inactiveGradient;
@synthesize backgroundColor;
@synthesize inactiveBackgroundColor;
@synthesize backgroundImage;
@synthesize inactiveBackgroundImage;
@synthesize leftCapWidth;
@synthesize topCapHeight;
@synthesize topEdgeColor;
@synthesize topHighlightColor;
@synthesize bottomHighlightColor;
@synthesize bottomEdgeColor;
@synthesize leftEdgeGradient;
@synthesize rightEdgeGradient;
@synthesize innerShadow;
@synthesize innerGlow;


- (void)dealloc {

	self.gradient = nil;
	self.inactiveGradient = nil;
	self.backgroundColor = nil;
	self.inactiveBackgroundColor = nil;
	self.backgroundImage = nil;
	self.inactiveBackgroundImage = nil;
	self.topEdgeColor = nil;
	self.topHighlightColor = nil;
	self.bottomHighlightColor = nil;
	self.bottomEdgeColor = nil;
	self.leftEdgeGradient = nil;	
	self.rightEdgeGradient = nil;
	self.innerShadow = nil;
	self.innerGlow = nil;
	[super dealloc];
}


- (void)drawRect:(NSRect)dirtyRect {
	
	NSRect rect = self.bounds;
	BOOL isKeyWindow = [[self window] isKeyWindow];	
	
	NSColor *backgroundColorToDraw = isKeyWindow ? self.backgroundColor : self.inactiveBackgroundColor ? : self.backgroundColor;
	if (backgroundColorToDraw != nil) {
		[backgroundColorToDraw set];
		NSRectFill(rect);
	}
	
	NSGradient *gradientToDraw = isKeyWindow ? self.gradient : self.inactiveGradient ? : self.gradient;
	if (gradientToDraw) {
		[gradientToDraw drawInRect:rect angle:self.gradientAngle ? : self.isFlipped ? 90 : -90];
	}
	
	NSImage *backgroundImageToDraw = isKeyWindow ? self.backgroundImage : self.inactiveBackgroundImage ? : self.backgroundImage;
	if (backgroundImageToDraw) {		
		if (self.leftCapWidth != NSNotFound || self.topCapHeight != NSNotFound) {
			[backgroundImageToDraw drawInRect:rect withLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
		} else {
			[backgroundImageToDraw drawInRect:rect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
		}
	}
	
	CGFloat topInset = 0.0;
	CGFloat bottomInset = 0.0;
	CGFloat leftInset = 0.0;
	CGFloat rightInset = 0.0;
	
	if (self.topEdgeColor) {
		topInset += 1.0;
		NSBezierPath *topHighlightPath = [NSBezierPath bezierPath];
		[topHighlightPath setLineWidth:0.0];
		[topHighlightPath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, NSMaxY(rect) -0.5))];
		[topHighlightPath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), NSMaxY(rect) -0.5))];
		[topHighlightPath closePath];
		
		[self.topEdgeColor set];	
		[topHighlightPath stroke];
	}
	
	if (self.topHighlightColor) {
		topInset += 1.0;
		NSBezierPath *topHighlightPath = [NSBezierPath bezierPath];
		[topHighlightPath setLineWidth:0.0];
		[topHighlightPath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, NSMaxY(rect) -1.5))];
		[topHighlightPath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), NSMaxY(rect) -1.5))];
		[topHighlightPath closePath];
		
		[self.topHighlightColor set];	
		[topHighlightPath stroke];
	}
	
	if (self.bottomHighlightColor) {
		bottomInset += 1.0;
		NSBezierPath *bottomHighlightPath = [NSBezierPath bezierPath];
		[bottomHighlightPath setLineWidth:1.0];
		[bottomHighlightPath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, rect.origin.y + 1.5))];
		[bottomHighlightPath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), rect.origin.y + 1.5))];
		[bottomHighlightPath closePath];
		
		[self.bottomHighlightColor set];	
		[bottomHighlightPath stroke];
	}
	
	if (self.bottomEdgeColor) {
		bottomInset += 1.0;
		NSBezierPath *bottomEdgePath = [NSBezierPath bezierPath];
		[bottomEdgePath setLineWidth:1.0];
		[bottomEdgePath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, rect.origin.y + 0.5))];
		[bottomEdgePath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), rect.origin.y + 0.5))];
		[bottomEdgePath closePath];
		
		[self.bottomEdgeColor set];	
		[bottomEdgePath stroke];
	}
	
	if (self.leftEdgeGradient) {
		leftInset += 1.0;
		NSRect edgeRect = NSMakeRect(0.0, 0.0, 1.0, NSMaxY(rect));
		edgeRect.origin.y += bottomInset;
		edgeRect.size.height -= (bottomInset + topInset);
		[self.leftEdgeGradient drawInRect:edgeRect angle:self.isFlipped ? 90 : -90];
	}
	
	if (self.rightEdgeGradient) {
		rightInset += 1.0;
		NSRect edgeRect = NSMakeRect((NSMaxX(rect) - 1.0), 0.0, 1.0, NSMaxY(rect));
		edgeRect.origin.y += bottomInset;
		edgeRect.size.height -= (bottomInset + topInset);		
		[self.rightEdgeGradient drawInRect:edgeRect angle:self.isFlipped ? 90 : -90];
	}
	
	CGRect shadowRect = rect;
	shadowRect.origin.x += leftInset;
	shadowRect.size.width -= (leftInset + rightInset);
	shadowRect.origin.y += bottomInset;
	shadowRect.size.height -= (bottomInset + topInset);
	
	if (self.innerShadow) {
		NSBezierPath *innerShadowPath = [NSBezierPath bezierPathWithRect:shadowRect];
		[innerShadowPath fillWithInnerShadow:self.innerShadow];
	}
	
	if (self.innerGlow) {
		NSBezierPath *innerGlowPath = [NSBezierPath bezierPathWithRect:shadowRect];
		[innerGlowPath fillWithInnerShadow:self.innerGlow];
	}	
}

@end
