//
//  Episode3_CurrencyConvertIphoneAppDelegate.h
//  Episode3_CurrencyConvertIphone
//
//  Created by Jarod Wen on 5/30/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
    @class
    @abstract    界面控制器
    @discussion  在iPhone平台上的界面控制器与mac版的存在差异，所以在响应按钮事件的实现上，代码有所不同。
*/

@interface Episode3_CurrencyConvertIphoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
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

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

