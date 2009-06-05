//
//  RobotController.h
//  Episode2_HelloWorld
//
//  Created by Lao JAR on 4/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface RobotController : NSObject {
	IBOutlet id button;
	IBOutlet id textField;
}

- (IBAction)buttonClicked:(id)sender;

@end
