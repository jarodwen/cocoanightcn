//
//  ConverterModel.h
//  Episode3_CurrencyConverter
//
//  Created by Jarod Wen on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
    @class
    @abstract    货币转换模型。
    @discussion  货币转换模型包括了转换货币所用的函数。
*/

@interface ConverterModel : NSObject {

}

/*!
    @function
    @abstract   转换货币函数。
    @discussion 使用传入的金额和汇率参数，进行货币转换。
    @param      amount	金额
	@param		rate	汇率
    @result     返回转换后的货币金额。
*/
+(float)convertCurrency:(float)amount withRate:(float)rate;

@end
