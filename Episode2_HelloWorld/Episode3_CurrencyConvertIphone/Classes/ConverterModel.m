//
//  ConverterModel.m
//  Episode3_CurrencyConverter
//
//  Created by Jarod Wen on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ConverterModel.h"


@implementation ConverterModel

+(float)convertCurrency:(float)amount withRate:(float)rate{
	return amount * rate;
}

@end
