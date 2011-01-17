//
//  MyWindowController.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/10/11.
//  BSD License
//


@class MyStyledView;

@interface MyWindowController : NSWindowController {}

@property (assign) IBOutlet MyStyledView *navBar;
@property (assign) IBOutlet MyStyledView *background;
@property (assign) IBOutlet MyStyledView *toolBar;
@property (assign) IBOutlet MyStyledView *popUpThing;

@end
