//
//  MyWindowController.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MyStyledView;

@interface MyWindowController : NSWindowController {}

@property (assign) IBOutlet MyStyledView *navBar;
@property (assign) IBOutlet MyStyledView *background;
@property (assign) IBOutlet MyStyledView *toolBar;

@end
