//
//  NSBezierPath+Additions.m
//  MyStyledView
//
//	http://www.seanpatrickobrien.com/journal/posts/3
//

#import "NSBezierPath+Additions.h"
#import "NSGraphicsContext+Additions.h"


@implementation NSBezierPath (Additions)

- (void)fillWithInnerShadow:(NSShadow *)shadow {
	
	[NSGraphicsContext drawInContextUsingBlock:^(NSGraphicsContext *currentContext) {
	
		NSSize offset = shadow.shadowOffset;
		NSSize originalOffset = offset;
		CGFloat radius = shadow.shadowBlurRadius;
		NSRect bounds = NSInsetRect(self.bounds, -(ABS(offset.width) + radius), -(ABS(offset.height) + radius));
		offset.height += bounds.size.height;
		shadow.shadowOffset = offset;
		NSAffineTransform *transform = [NSAffineTransform transform];
		if ([currentContext isFlipped])
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
	
	}];
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
	
	[NSGraphicsContext drawInContextUsingBlock:^(NSGraphicsContext *currentContext) {
	
		[shadow set];
		[[NSColor blackColor] set];
		NSRectClip(bounds);
		[path fill];
		
	}];
	
	[path release];
	[shadow release];
}

@end
