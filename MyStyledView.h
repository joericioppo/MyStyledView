//
//  MyStyledView.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MyStyledView : NSView {}

@property (nonatomic, retain) NSGradient	*gradient;
@property (nonatomic, assign) CGFloat		gradientAngle;
@property (nonatomic, retain) NSGradient	*inactiveGradient;

@property (nonatomic, retain) NSColor		*backgroundColor;
@property (nonatomic, retain) NSColor		*inactiveBackgroundColor;

@property (nonatomic, copy)	  NSArray		*backgroundImages; //three part image. (leftCap, middleFill, rightCap)
@property (nonatomic, copy)	  NSArray		*inactiveBackgroundImages; //three part image. (leftCap, middleFill, rightCap)

@property (nonatomic, retain) NSColor		*topEdgeColor;
@property (nonatomic, retain) NSColor		*topHighlightColor;
@property (nonatomic, retain) NSColor		*bottomHighlightColor;
@property (nonatomic, retain) NSColor		*bottomEdgeColor;

@property (nonatomic, retain) NSGradient	*rightEdgeGradient;
@property (nonatomic, retain) NSGradient	*leftEdgeGradient;

@property (nonatomic, retain) NSShadow		*innerShadow;
@property (nonatomic, retain) NSShadow		*innerGlow;

// -------------- topEdge
// -------------- topHighlight
// ::::::::::::::
// :::::::::::::: gradient/background
// ::::::::::::::
// -------------- bottomHighlight
// -------------- bottomEdge

@end
