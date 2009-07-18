//
//  Episode4_CurrencyConvertIphoneAppDelegate.m
//  Episode4_CurrencyConvertIphone
//
//  Created by Jarod Wen on 7/17/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Episode4_CurrencyConvertIphoneAppDelegate.h"
#import "Episode4_CurrencyConvertIphoneViewController.h"

@implementation Episode4_CurrencyConvertIphoneAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
