//
//  NSImage+Additions.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/10/11.
//  BSD License
//


@interface NSImage (Additions)

- (void)drawInRect:(NSRect)rect withLeftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight;
- (void)drawInRect:(NSRect)rect withContentStretch:(NSRect)contentStretch; // 1.0 == 1pt

@end
