//
//  MyStyledViewAppDelegate.h
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MyWindowController;

@interface MyStyledViewAppDelegate : NSObject <NSApplicationDelegate> {}

@property (nonatomic, retain) MyWindowController *windowController;

@end
