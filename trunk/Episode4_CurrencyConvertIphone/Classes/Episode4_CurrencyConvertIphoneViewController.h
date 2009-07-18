//
//  Episode4_CurrencyConvertIphoneViewController.h
//  Episode4_CurrencyConvertIphone
//
//  Created by Jarod Wen on 7/17/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFromComponent 0
#define kToComponent 1
#define rGBP 0.08979
#define rEUR 0.10457
#define rUSD 0.14614
#define rJPY 13.608

#define DO_TEST 0

@interface Episode4_CurrencyConvertIphoneViewController : UIViewController {
	IBOutlet id doublePicker;			/**< 选择器 */
	IBOutlet id amountField;			/**< 输入 */
	IBOutlet id outputField;			/**< 输出 */
	NSArray *fromList;
	NSArray *toList;
}

@property(nonatomic, retain) id doublePicker;
@property(nonatomic, retain) id amountField;
@property(nonatomic, retain) id outputField;
@property(nonatomic, retain) NSArray *fromList;

// 这里我们不使用@property的定义形式，目的是用来
// 说明在实现setter函数时需要注意的内存问题。
-(NSArray *)toList;
-(void)setToList:(NSArray *)list;

-(void)doConvert;
- (float)getRate:(int)cur;
- (IBAction)textFieldDidEndEditing:(id)sender;

@end

