//
//  InterfaceController.h
//  Episode3_CurrencyConverter
//
//  Created by Jarod Wen on 5/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
    @class
    @abstract    货币转换器的界面控制器。
    @discussion  货币转换器的界面控制器，由IB在程序启动时实例化，用来控制界面的显示，以及用户控制的响应。
*/
@interface InterfaceController : NSObject {

	IBOutlet id rateField;			/**< 汇率 */

	IBOutlet id amountField;		/**< 金额 */

	IBOutlet id outputField;		/**< 输出 */
}

/*!
    @function
    @abstract   转换
    @discussion 货币转换的功能的实现。所需要的数据信息从界面直接读取。
    @param      sender	触发事件的界面对象。
    @result     更新界面的输出文本框。
*/

-(IBAction)doConvert:(id)sender;

@end
