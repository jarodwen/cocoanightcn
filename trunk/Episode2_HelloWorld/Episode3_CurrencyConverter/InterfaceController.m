//
//  InterfaceController.m
//  Episode3_CurrencyConverter
//
//  Created by Jarod Wen on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "InterfaceController.h"
#import "ConverterModel.h"


@implementation InterfaceController

-(IBAction)doConvert:(id)sender{

	[outputField setFloatValue:[ConverterModel convertCurrency:[amountField floatValue] withRate:[rateField floatValue]]];

}

@end
