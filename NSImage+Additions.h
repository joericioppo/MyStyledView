//
//  NSImage+Additions.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSImage (Additions)

- (void)drawInRect:(NSRect)rect withLeftCapWidth:(CGFloat)leftCap topCapHeight:(CGFloat)topCap;
- (void)drawInRect:(NSRect)rect withContentStretch:(NSRect)contentStretch; // 1.0 == 1pt

@end
