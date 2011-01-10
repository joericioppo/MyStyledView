//
//  NSBezierPath+Additions.h
//
// http://www.seanpatrickobrien.com/journal/posts/3
//


@interface NSBezierPath (Additions)

- (void)fillWithInnerShadow:(NSShadow *)shadow;
- (void)drawBlurWithColor:(NSColor *)color radius:(CGFloat)radius;
+ (NSBezierPath *)bezierPathRightEdgeForRect:(NSRect)rect;

@end