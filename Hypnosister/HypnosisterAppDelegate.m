//
//  HypnosisterAppDelegate.m
//  Hypnosister
//
//  Created by Richard Millet on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisterAppDelegate.h"
#import "HypnosisterView.h"

@implementation HypnosisterAppDelegate

@synthesize window = _window;

//OVERRIDE
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return zoomingView;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	
//	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
	
	// Create a scroll view the size of the main window
	CGRect windowBounds = [self.window bounds];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:windowBounds];
	[scrollView setPagingEnabled:NO];
	[scrollView setMinimumZoomScale:1.0];
	[scrollView setMaximumZoomScale:5.0];
	[scrollView setDelegate:self];
	[self.window addSubview:scrollView];
	
	// Create a Hypnosister view the same size as the main window
	// and add it to the view hierarchy.
	CGRect viewFrame = windowBounds;
	viewFrame.size.width *= 1;
	viewFrame.size.height *= 1;
	HypnosisterView *hypnosisterView = [[HypnosisterView alloc] initWithFrame:viewFrame
																	 andColor:[UIColor purpleColor]];
	zoomingView = hypnosisterView;
	[scrollView addSubview:hypnosisterView];
	
	// Make this view the "first responder" to events
	BOOL isFirstResponder = [hypnosisterView becomeFirstResponder];
	if (isFirstResponder) {
		NSLog(@"Main Hypnosister view is now the first responder.");
	} else {
		NSLog(@"Failed to set main hypnosister view to the first responder.");
	}
	
	// Create a second Hypnosister view below the first and add it to the view hierarchy
	CGRect anotherViewFrame = viewFrame;
	anotherViewFrame.origin.y += viewFrame.size.height;
	anotherViewFrame.size.height *= 1.5;
	HypnosisterView *anotherHypnosisterView = [[HypnosisterView alloc] initWithFrame:anotherViewFrame
																			andColor:Nil];
//	[scrollView addSubview:anotherHypnosisterView];
	
	// Now set the scroll view's content size to deal with two window-size views
	// stacked on top of each other.
	CGSize contentSize = viewFrame.size;
//	contentSize.height = viewFrame.size.height + anotherViewFrame.size.height;
	[scrollView setContentSize:contentSize];
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
