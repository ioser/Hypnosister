//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Sara Duckler on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisterView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
	HypnosisterView *zoomingView;
}
@property (strong, nonatomic) UIWindow *window;

@end
