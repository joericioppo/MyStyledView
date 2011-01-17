//
//  NSGradient+Additions.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  BSD License
//


@interface NSGradient (Additions)

+ (NSGradient *)gradientWithColors:(NSArray *)colorArray;
+ (NSGradient *)gradientWithStartingColor:(NSColor *)startingColor endingColor:(NSColor *)endingColor;

@end
