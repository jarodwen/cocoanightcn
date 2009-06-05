//
//  Robot.m
//  Episode2_HelloWorld
//
//  Created by Lao JAR on 4/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Robot.h"


@implementation Robot

/**
 * 初始化函数 ^_^
 */
-(id)init
{
	if(self = [super init]){
		identityNum = 0;
		[self setName:@"Robot 0"];
		self.dataFromFactory = [NSDate dateWithString:@"04/17/2009"];
		master = @"Cocoa夜未央机器人工厂";
	}
	return self;
}

/**
 * 毁灭函数 -_-!
 */
-(void)dealloc
{
	[self setName:nil];
	self.dataFromFactory = nil;
	master = nil;
	[super dealloc];
}

/**
 * 设定机器人姓名
 */
-(void)setName:(NSString*)strName
{
	[name release];
	[strName retain];
	name = strName;
}

/**
 * 返回机器人姓名
 */
-(NSString*)name
{
	return name;
}

/**
 * 机器人行为:说话
 */
-(NSString*)speak:(NSString*)words
{
	return [name stringByAppendingString: [@"说:" stringByAppendingString:words]];
}

// 另外的两个实例变量作为属性设定.
@synthesize dataFromFactory;
@synthesize master;


@end
