//
//  NSImage+Additions.m
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSImage+Additions.h"
#import "NSGraphicsContext+Additions.h"

@implementation NSImage (Additions)

- (void)drawInRect:(NSRect)rect withContentStretch:(NSRect)contentStretch {
	
	NSSize imageSize = self.size;
	
	if (imageSize.width > rect.size.width || imageSize.height > rect.size.height) {
		NSRect imageRect = NSMakeRect(0.0, 0.0, imageSize.width, imageSize.height);
		[self drawInRect:rect fromRect:imageRect operation:NSCompositeSourceOver fraction:1.0];
		return;
	}
	
	CGFloat middleFillHeight = rect.size.height - imageSize.height;
	CGFloat middleFillWidth = rect.size.width - imageSize.width;
	
	CGFloat topSliceSourceOriginY = self.size.height - NSMaxY(contentStretch);
	CGFloat topSliceAdjustedOriginY = NSMinY(contentStretch) + middleFillHeight;	
	CGFloat topSliceHeight = self.size.height - topSliceSourceOriginY;
	
	CGFloat rightSliceSourceOriginX = NSMaxX(contentStretch);
	CGFloat rightSliceAdjustedOriginX = NSMinX(contentStretch) + middleFillWidth;
	CGFloat rightSliceWidth = self.size.width - rightSliceSourceOriginX;
	
	NSRect bottomLeftCornerRect = NSMakeRect(0.0, 0.0, contentStretch.origin.x, contentStretch.origin.y);
	[self drawInRect:bottomLeftCornerRect fromRect:bottomLeftCornerRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect leftEdgeFillSourceRect = NSMakeRect(0.0, contentStretch.origin.y, contentStretch.origin.x, contentStretch.size.height);
	NSRect leftEdgeFillDrawingRect = NSMakeRect(0.0, contentStretch.origin.y, contentStretch.origin.x, middleFillHeight);
	[self drawInRect:leftEdgeFillDrawingRect fromRect:leftEdgeFillSourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect topLeftCornerSourceRect = NSMakeRect(0.0, topSliceSourceOriginY, contentStretch.origin.x, topSliceHeight);
	NSRect topLeftCornerDrawingRect = NSMakeRect(0.0, topSliceAdjustedOriginY, contentStretch.origin.x, topSliceHeight);
	[self drawInRect:topLeftCornerDrawingRect fromRect:topLeftCornerSourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect topEdgeFillSourceRect = NSMakeRect(contentStretch.origin.x, topSliceSourceOriginY, contentStretch.size.width, topSliceHeight);
	NSRect topEdgeFillDrawingRect = NSMakeRect(contentStretch.origin.x, topSliceAdjustedOriginY, middleFillWidth, topSliceHeight);
	[self drawInRect:topEdgeFillDrawingRect fromRect:topEdgeFillSourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect topRightCornerSourceRect = NSMakeRect(rightSliceSourceOriginX, topSliceSourceOriginY, rightSliceWidth, topSliceHeight);
	NSRect topRightCornerDrawingRect = NSMakeRect(rightSliceAdjustedOriginX, topSliceAdjustedOriginY, rightSliceWidth, topSliceHeight);
	[self drawInRect:topRightCornerDrawingRect fromRect:topRightCornerSourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect rightEdgeFillSourceRect = NSMakeRect(rightSliceSourceOriginX, contentStretch.origin.y, rightSliceWidth, contentStretch.size.height);
	NSRect rightEdgeFillDrawingRect = NSMakeRect(rightSliceAdjustedOriginX, contentStretch.origin.y, rightSliceWidth, middleFillHeight);
	[self drawInRect:rightEdgeFillDrawingRect fromRect:rightEdgeFillSourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect bottomRightCornerSourceRect = NSMakeRect(rightSliceSourceOriginX, 0.0, rightSliceWidth, contentStretch.origin.y);
	NSRect bottomRightCornerDrawingRect = NSMakeRect(rightSliceAdjustedOriginX, 0.0, rightSliceWidth, contentStretch.origin.y);
	[self drawInRect:bottomRightCornerDrawingRect fromRect:bottomRightCornerSourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect bottomEdgeFillSourceRect = NSMakeRect(contentStretch.origin.x, 0.0, contentStretch.size.width, contentStretch.origin.y);
	NSRect bottomEdgeFillDrawingRect = NSMakeRect(contentStretch.origin.x, 0.0, middleFillWidth, contentStretch.origin.y);
	[self drawInRect:bottomEdgeFillDrawingRect fromRect:bottomEdgeFillSourceRect operation:NSCompositeSourceOver fraction:1.0];
	
	NSRect rectToStretch = contentStretch;
	NSRect stretchedRectToDraw = NSMakeRect(rectToStretch.origin.x, rectToStretch.origin.y, middleFillWidth, middleFillHeight);
	[self drawInRect:stretchedRectToDraw fromRect:rectToStretch operation:NSCompositeSourceOver fraction:1.0];
}

- (void)drawInRect:(NSRect)rect withLeftCap:(CGFloat)leftCap topCap:(CGFloat)topCap {
	
	NSRect contentStretch = NSMakeRect(leftCap, rect.size.height - topCap, 0.0, 0.0);
	[self drawInRect:rect withContentStretch:contentStretch];
}

@end
