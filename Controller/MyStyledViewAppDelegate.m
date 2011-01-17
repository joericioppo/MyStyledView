//
//  MyStyledViewAppDelegate.m
//  MyStyledView
//
//  Created by Joe Ricioppo on 1/9/11.
//  BSD License
//

#import "MyStyledViewAppDelegate.h"
#import "MyWindowController.h"

static NSString * const kMyWindowXibName = @"MyWindow";

@implementation MyStyledViewAppDelegate

@synthesize windowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	self.windowController = [[[MyWindowController alloc] initWithWindowNibName:kMyWindowXibName] autorelease];
	[self.windowController showWindow:self];
}

@end
