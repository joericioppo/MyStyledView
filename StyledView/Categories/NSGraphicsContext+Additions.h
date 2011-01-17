//
//  NSGraphicsContext+Additions.h
//  MyStyledView
//
//  adapted from http://jonathandann.wordpress.com/2009/09/09/forget-the-code/
//  BSD License
//


@interface NSGraphicsContext (Additions)

+ (void)drawInContextUsingBlock:(void (^)(NSGraphicsContext *currentContext))block;

@end
