//
//  Doraemon.m
//  Episode2_helloworld
//
//  Created by Lao JAR on 4/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Doraemon.h"


@implementation Doraemon

@synthesize tools;

-(id) init
{
	if(self = [super init]){
		identityNum = 200904;
		[self setName:@"Doraemon"];
		self.dataFromFactory = [NSDate dateWithString:@"04/17/2009"];
		master = @"22世纪某个破烂的机器人工厂…";
		tools = @"铜锣烧";
	}
	return self;
}

/**
 * 哆啦A梦大叫一声:"我要开始变形了…"
 */
-(NSString*)useTool:(NSString*)toolName Times:(int)times
{
	return [self speak:[NSString stringWithFormat:@"现在我要使用道具%@%d次!!", toolName, times]];
}

/**
 * 哆啦A梦大叫一声:"我又要开始变形了…"
 */
-(NSString*)useToolTimes:(int)times
{
	return [self speak:[NSString stringWithFormat:@"现在我要使用道具%@%d次!!", tools, times]];
}

@end
