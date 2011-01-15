//
//  NSGradient+Additions.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@interface NSGradient (Additions)

+ (NSGradient *)gradientWithColors:(NSArray *)colorArray;
+ (NSGradient *)gradientWithStartingColor:(NSColor *)startingColor endingColor:(NSColor *)endingColor;

@end
