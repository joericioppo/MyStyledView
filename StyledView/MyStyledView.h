//
//  MyStyledView.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  BSD License
//


@interface MyStyledView : NSView {}

@property (nonatomic, retain) NSGradient	*gradient;
@property (nonatomic, retain) NSGradient	*inactiveGradient;
@property (nonatomic, assign) CGFloat		gradientAngle;

@property (nonatomic, retain) NSColor		*backgroundColor;
@property (nonatomic, retain) NSColor		*inactiveBackgroundColor;

@property (nonatomic, retain) NSImage		*backgroundImage;
@property (nonatomic, retain) NSImage		*inactiveBackgroundImage;
@property (nonatomic, assign) CGFloat		leftCapWidth;
@property (nonatomic, assign) CGFloat		topCapHeight;

@property (nonatomic, retain) NSColor		*topEdgeColor;
@property (nonatomic, retain) NSColor		*topHighlightColor;
@property (nonatomic, retain) NSColor		*bottomHighlightColor;
@property (nonatomic, retain) NSColor		*bottomEdgeColor;

@property (nonatomic, retain) NSGradient	*leftEdgeGradient;
@property (nonatomic, retain) NSGradient	*rightEdgeGradient;

@property (nonatomic, retain) NSShadow		*innerShadow;
@property (nonatomic, retain) NSShadow		*innerGlow;

@property (nonatomic, assign) BOOL			shouldRasterize;

// -------------- topEdge
// -------------- topHighlight
// ::::::::::::::
// :::::::::::::: gradient/background
// ::::::::::::::
// -------------- bottomHighlight
// -------------- bottomEdge

// If shouldRasterize == YES, then you need to invalidate the rasterization whenever the view needs to be re-cached. Changing the view attributes (gradient, backgroundColor, etc.) _won't_ call this automatically. Changes to the frame size _will_ automatically call this.
- (void)invalidateRasterization;

@end
