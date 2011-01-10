//
//  MyStyledView.m
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyStyledView.h"
//#import "NSGradient+Additions.h"
#import "NSBezierPath+Additions.h"
//#import "NSShadow+Additions.h"


@implementation MyStyledView

@synthesize gradient;
@synthesize gradientAngle;
@synthesize inactiveGradient;
@synthesize backgroundColor;
@synthesize inactiveBackgroundColor;
@synthesize backgroundImages;
@synthesize inactiveBackgroundImages;
@synthesize topEdgeColor;
@synthesize topHighlightColor;
@synthesize bottomHighlightColor;
@synthesize bottomEdgeColor;
@synthesize rightEdgeGradient;
@synthesize leftEdgeGradient;
@synthesize innerShadow;
@synthesize innerGlow;

//- (id)initWithFrame:(NSRect)frame {
//	
//    self = [super initWithFrame:frame];
//    if (self) {
//    }
//    return self;
//}

- (void)drawRect:(NSRect)dirtyRect {
	
	NSRect rect = self.bounds;
	BOOL isKeyWindow = [[self window] isKeyWindow];	
	
	NSColor *backgroundColorToDraw = isKeyWindow ? self.backgroundColor : self.inactiveBackgroundColor ? : self.backgroundColor;
	if (backgroundColorToDraw != nil) {
		[backgroundColorToDraw set];
		NSRectFill(rect);
	}
	
	NSGradient *gradientToDraw = isKeyWindow ? self.gradient : self.inactiveGradient ? self.inactiveGradient : self.gradient; //hrm
	if (gradientToDraw) {
		[gradientToDraw drawInRect:rect angle:self.gradientAngle ? : self.isFlipped ? 90 : -90];
	}
	
	NSArray *backgroundImagesToDraw =  isKeyWindow ? self.backgroundImages : self.inactiveBackgroundImages ? : self.backgroundImages;
	if (backgroundImagesToDraw.count == 3) {
		
		__block BOOL shouldDrawThreePartImage = NO;
		[self.backgroundImages enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			if ([obj isKindOfClass:[NSImage class]]) {
				shouldDrawThreePartImage = YES;
			} else {
				shouldDrawThreePartImage = NO;
				*stop = YES;
			}
			
		}];
		
		if (shouldDrawThreePartImage) {			
			NSImage *leftCap = [self.backgroundImages objectAtIndex:0];
			NSImage *middleFill = [self.backgroundImages objectAtIndex:1];
			NSImage *rightCap = [self.backgroundImages objectAtIndex:2];			
			NSDrawThreePartImage(rect, leftCap, middleFill, rightCap, 
								 NO, NSCompositeSourceOver, 1.0, self.isFlipped);	
		}
	}
	
	if (self.innerShadow) {
		NSBezierPath *innerShadowPath = [NSBezierPath bezierPathWithRect:rect];
		[innerShadowPath fillWithInnerShadow:self.innerShadow];
	}
	
	if (self.innerGlow) {
		NSBezierPath *innerGlowPath = [NSBezierPath bezierPathWithRect:rect];
		[innerGlowPath fillWithInnerShadow:self.innerGlow];
	}
	
	if (self.topEdgeColor) {
		NSBezierPath *topHighlightPath = [NSBezierPath bezierPath];
		[topHighlightPath setLineWidth:0.0];
		[topHighlightPath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, NSMaxY(rect) -0.5))];
		[topHighlightPath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), NSMaxY(rect) -0.5))];
		[topHighlightPath closePath];
		
		[self.topEdgeColor set];	
		[topHighlightPath stroke];
	}
	
	if (self.topHighlightColor) {
		NSBezierPath *topHighlightPath = [NSBezierPath bezierPath];
		[topHighlightPath setLineWidth:0.0];
		[topHighlightPath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, NSMaxY(rect) -1.5))];
		[topHighlightPath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), NSMaxY(rect) -1.5))];
		[topHighlightPath closePath];
		
		[self.topHighlightColor set];	
		[topHighlightPath stroke];
	}
	
	if (self.bottomHighlightColor) {
		NSBezierPath *bottomHighlightPath = [NSBezierPath bezierPath];
		[bottomHighlightPath setLineWidth:1.0];
		[bottomHighlightPath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, rect.origin.y + 1.5))];
		[bottomHighlightPath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), rect.origin.y + 1.5))];
		[bottomHighlightPath closePath];
		
		[self.bottomHighlightColor set];	
		[bottomHighlightPath stroke];
	}
	
	if (self.bottomEdgeColor) {
		NSBezierPath *bottomEdgePath = [NSBezierPath bezierPath];
		[bottomEdgePath setLineWidth:1.0];
		[bottomEdgePath moveToPoint:NSPointFromCGPoint(CGPointMake(rect.origin.x, rect.origin.y + 0.5))];
		[bottomEdgePath lineToPoint:NSPointFromCGPoint(CGPointMake(NSMaxX(rect), rect.origin.y + 0.5))];
		[bottomEdgePath closePath];
		
		[self.bottomEdgeColor set];	
		[bottomEdgePath stroke];
	}
	
	if (self.rightEdgeGradient) {
		NSRect edgeRect = NSMakeRect((NSMaxX(rect) - 1.5), 0.0, 1.0, NSMaxY(rect));		
		[self.rightEdgeGradient drawInRect:edgeRect angle:self.isFlipped ? 90 : -90];
	}
	
	if (self.leftEdgeGradient) {
		NSRect edgeRect = NSMakeRect(0.0, 0.0, 1.0, NSMaxY(rect));
		[self.leftEdgeGradient drawInRect:edgeRect angle:self.isFlipped ? 90 : -90];
	}
}

@end
