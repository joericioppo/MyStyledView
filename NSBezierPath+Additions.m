//
//  NSBezierPath+Additions.m
//
// http://www.seanpatrickobrien.com/journal/posts/3
//

#import "NSBezierPath+Additions.h"


@implementation NSBezierPath (Additions)

- (void)fillWithInnerShadow:(NSShadow *)shadow {
	
	[NSGraphicsContext saveGraphicsState];
	
	NSSize offset = shadow.shadowOffset;
	NSSize originalOffset = offset;
	CGFloat radius = shadow.shadowBlurRadius;
	NSRect bounds = NSInsetRect(self.bounds, -(ABS(offset.width) + radius), -(ABS(offset.height) + radius));
	offset.height += bounds.size.height;
	shadow.shadowOffset = offset;
	NSAffineTransform *transform = [NSAffineTransform transform];
	if ([[NSGraphicsContext currentContext] isFlipped])
		[transform translateXBy:0 yBy:bounds.size.height];
	else
		[transform translateXBy:0 yBy:-bounds.size.height];
	
	NSBezierPath *drawingPath = [NSBezierPath bezierPathWithRect:bounds];
	[drawingPath setWindingRule:NSEvenOddWindingRule];
	[drawingPath appendBezierPath:self];
	[drawingPath transformUsingAffineTransform:transform];
	
	[self addClip];
	[shadow set];
	[[NSColor blackColor] set];
	[drawingPath fill];
	
	shadow.shadowOffset = originalOffset;
	
	[NSGraphicsContext restoreGraphicsState];
}

- (void)drawBlurWithColor:(NSColor *)color radius:(CGFloat)radius {
	
	NSRect bounds = NSInsetRect(self.bounds, -radius, -radius);
	NSShadow *shadow = [[NSShadow alloc] init];
	shadow.shadowOffset = NSMakeSize(0, bounds.size.height);
	shadow.shadowBlurRadius = radius;
	shadow.shadowColor = color;
	NSBezierPath *path = [self copy];
	NSAffineTransform *transform = [NSAffineTransform transform];
	if ([[NSGraphicsContext currentContext] isFlipped])
		[transform translateXBy:0 yBy:bounds.size.height];
	else
		[transform translateXBy:0 yBy:-bounds.size.height];
	[path transformUsingAffineTransform:transform];
	
	[NSGraphicsContext saveGraphicsState];
	
	[shadow set];
	[[NSColor blackColor] set];
	NSRectClip(bounds);
	[path fill];
	
	[NSGraphicsContext restoreGraphicsState];
	
	[path release];
	[shadow release];
}

+ (NSBezierPath *)bezierPathRightEdgeForRect:(NSRect)rect {
	
	return [NSBezierPath bezierPathWithRect:NSMakeRect(NSMaxX(rect) - 1.0, rect.origin.y, 1.0, rect.size.height)];
}

@end
