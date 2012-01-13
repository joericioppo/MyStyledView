//
//  MyWindowController.m
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/10/11.
//  BSD License
//

#import "MyWindowController.h"
#import "MyStyledView.h"
#import "NSGradient+Additions.h"
#import "NSShadow+Additions.h"

@implementation MyWindowController

@synthesize navBar;
@synthesize background;
@synthesize toolBar;
@synthesize popUpThing;

- (void)awakeFromNib {
	
	//--
	self.navBar.gradient = [NSGradient gradientWithStartingColor:[NSColor colorWithCalibratedWhite:0.7 alpha:1.0]
													 endingColor:[NSColor colorWithCalibratedWhite:0.6 alpha:1.0]];
	
	self.navBar.topEdgeColor = [NSColor colorWithCalibratedWhite:0.75 alpha:1.0];
	self.navBar.bottomHighlightColor = [NSColor colorWithCalibratedWhite:0.7 alpha:1.0];
	self.navBar.bottomEdgeColor = [NSColor colorWithCalibratedWhite:0.25 alpha:1.0];
	
	//--
	self.background.backgroundColor = [NSColor colorWithCalibratedHue:0.625 saturation:0.0 brightness:0.82 alpha:1.0];
//	self.background.imageIsTileable = YES;
//	self.background.backgroundImage = [NSImage imageNamed:@"dark_popup.png"];
//	self.background.innerShadow = [NSShadow shadowWithColor:[NSColor colorWithCalibratedHue:0.625 saturation:0.0 brightness:0.0 alpha:0.23]
//													 offset:NSMakeSize(0.0, 0.0)
//												 blurRadius:2.0];
	self.background.innerGlow = [NSShadow shadowWithColor:[NSColor colorWithCalibratedHue:0.625 saturation:0.0 brightness:0.0 alpha:0.1]
												   offset:NSMakeSize(0.0, 0.0)
											   blurRadius:10.0];
	self.background.bottomEdgeColor = [NSColor colorWithCalibratedWhite:0.27 alpha:1.0];
	
	//--
	self.popUpThing.backgroundImage = [NSImage imageNamed:@"dark_popup.png"]; // image is copywrite, because it is not pixel correct. draw your own mofo.
	self.popUpThing.leftCapWidth = 80.0;
	self.popUpThing.topCapHeight = 60.0;
	self.popUpThing.shouldRasterize = YES;
	
	//--
	self.toolBar.gradient = [NSGradient gradientWithStartingColor:[NSColor colorWithCalibratedHue:0.625 saturation:0.0 brightness:0.7 alpha:1.0] 
													  endingColor:[NSColor colorWithCalibratedHue:0.625 saturation:0.0 brightness:0.6 alpha:1.0]];
	self.toolBar.topEdgeColor = [NSColor colorWithCalibratedWhite:0.8 alpha:1.0];
	self.toolBar.bottomEdgeColor = [NSColor colorWithCalibratedWhite:0.65 alpha:1.0];
	
	NSGradient *shineGadient = [NSGradient gradientWithStartingColor:[NSColor colorWithDeviceWhite:1.0 alpha:1.0] 
														 endingColor:[NSColor colorWithDeviceWhite:1.0 alpha:0.0]];
	NSGradient *shadowGradient = [NSGradient gradientWithStartingColor:[NSColor colorWithDeviceWhite:0.0 alpha:0.0] 
														 endingColor:[NSColor colorWithDeviceWhite:0.0 alpha:0.3]];
	
	self.background.styleBlock = ^(NSRect rect) {
		NSPoint startPoint = NSMakePoint(NSMidX(rect), NSMaxY(rect) + 150.0);
		NSPoint endPoint = NSMakePoint(NSMidX(rect), NSMidY(rect));
		[shadowGradient drawFromCenter:startPoint radius:0.0 toCenter:endPoint radius:rect.size.height + 20.0 options:0];
		[shineGadient drawFromCenter:startPoint radius:0.0 toCenter:endPoint radius:rect.size.height options:0];
	};
}

@end
