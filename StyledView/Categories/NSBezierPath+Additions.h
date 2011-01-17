//
//  NSBezierPath+Additions.h
//  MyStyledView
//
//  http://www.seanpatrickobrien.com/journal/posts/3
//  BSD License
//


@interface NSBezierPath (Additions)

- (void)fillWithInnerShadow:(NSShadow *)shadow;
- (void)drawBlurWithColor:(NSColor *)color radius:(CGFloat)radius;

@end
