//
//  Episode4_CurrencyConvertIphoneAppDelegate.h
//  Episode4_CurrencyConvertIphone
//
//  Created by Jarod Wen on 7/17/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Episode4_CurrencyConvertIphoneViewController;

@interface Episode4_CurrencyConvertIphoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Episode4_CurrencyConvertIphoneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Episode4_CurrencyConvertIphoneViewController *viewController;

@end

