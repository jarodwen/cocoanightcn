//
//  Doraemon.h
//  Episode2_helloworld
//
//  Created by Lao JAR on 4/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Robot.h"

@interface Doraemon : Robot {
	// 哆啦A梦特有的属性:百宝箱!!!
	NSString* tools;
}

// 使用百宝箱中的宝物!!!
-(NSString*)useTool:(NSString*)toolName Times:(int)times;
-(NSString*)useToolTimes:(int)times;

@property (copy) NSString* tools;

@end
