//
//  MyStyledViewAppDelegate.m
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyStyledViewAppDelegate.h"
#import "MyWindowController.h"

@implementation MyStyledViewAppDelegate

@synthesize windowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	self.windowController = [[[MyWindowController alloc] initWithWindowNibName:@"MyWindow"] autorelease];
	[self.windowController showWindow:self];
}

@end
