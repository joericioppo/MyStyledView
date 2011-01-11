//
//  NSGraphicsContext+Additions.h
//  MyStyledView
//
// http://jonathandann.wordpress.com/2009/09/09/forget-the-code/
//

#import <Cocoa/Cocoa.h>


@interface NSGraphicsContext (Additions)

+ (void)drawInContextUsingBlock:(void (^)(NSGraphicsContext *currentContext))block;

@end
