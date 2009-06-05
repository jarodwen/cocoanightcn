//
//  RobotController.m
//  Episode2_HelloWorld
//
//  Created by Lao JAR on 4/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RobotController.h"
#import "Doraemon.h"

@implementation RobotController

- (IBAction)buttonClicked:(id)sender
{
	static int counter = 0;
	Doraemon* dingdang = [[Doraemon alloc] init];
	dingdang.tools = @"随意门";
	if(counter % 2 == 0)
		[textField setString:[dingdang useTool:@"竹蜻蜓" Times:1]];
	else
		[textField setString:[dingdang useToolTimes:50]];
	counter ++;
}

@end
