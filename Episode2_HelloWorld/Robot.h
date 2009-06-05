//
//  Robot.h
//  Episode2_HelloWorld
//
//  Created by Lao JAR on 4/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Robot : NSObject {
	
	int identityNum;
	NSString *name;
	NSDate *dataFromFactory;
	NSString *master;
	
}

-(void)setName:(NSString*)strName;
-(NSString*)name;
-(NSString*)speak:(NSString*)words;

@property (copy) NSDate* dataFromFactory;
@property (copy) NSString* master;

@end
