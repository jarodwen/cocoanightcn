//
//  Episode3_CurrencyConvertIphoneAppDelegate.m
//  Episode3_CurrencyConvertIphone
//
//  Created by Jarod Wen on 5/30/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Episode3_CurrencyConvertIphoneAppDelegate.h"
#import "ConverterModel.h"

@implementation Episode3_CurrencyConvertIphoneAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}

-(IBAction)doConvert:(id)sender{
	
	// 更新输出
	float rate = [[rateField text] floatValue];
	float amount = [[amountField text] floatValue];
	NSString *output = [NSString stringWithFormat:@"%0.3f", [ConverterModel convertCurrency:amount withRate:rate]];
	// setFloatValue:方法在iPhone中不适用
	[outputField setText:output];
	
	// 为了在按下按钮以后，软键盘会自动消失，这里需要解除文本框的第一响应者的身份
	[rateField resignFirstResponder];
	[amountField resignFirstResponder];
	[outputField resignFirstResponder];
}

@end
