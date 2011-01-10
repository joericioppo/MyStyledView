//
//  NSShadow+Additions.h
//
// http://www.seanpatrickobrien.com/journal/posts/3
//


@interface NSShadow (Additions)

+ (id)shadowWithColor:(NSColor *)color offset:(NSSize)offset blurRadius:(CGFloat)blur;
- (id)initWithColor:(NSColor *)color offset:(NSSize)offset blurRadius:(CGFloat)blur;

@end
