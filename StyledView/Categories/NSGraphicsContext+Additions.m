//
//  NSGraphicsContext+Additions.m
//  MyStyledView
//
//  adapted from http://jonathandann.wordpress.com/2009/09/09/forget-the-code/
//  BSD License
//

#import "NSGraphicsContext+Additions.h"


@implementation NSGraphicsContext (Additions)

+ (void)drawInContextUsingBlock:(void (^)(NSGraphicsContext *currentContext))block {
	
	if (block == nil) {
		return;
	}
	
	[self saveGraphicsState];
	block([self currentContext]);
	[self restoreGraphicsState];
}

@end
