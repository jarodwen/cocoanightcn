//
//  Episode4_CurrencyConvertIphoneViewController.m
//  Episode4_CurrencyConvertIphone
//
//  Created by Jarod Wen on 7/17/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Episode4_CurrencyConvertIphoneViewController.h"

@implementation Episode4_CurrencyConvertIphoneViewController

@synthesize doublePicker;
@synthesize fromList;
@synthesize amountField;
@synthesize outputField;

#pragma mark --- 视图相关方法重写 ---

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	NSArray *curArray = [[NSArray alloc] initWithObjects:@"CNY", @"USD", @"EUR", @"GBP", @"JPY", nil];
	// 如果我们使用@property来定义toList，这里就可以直接使用self.toList进行取值与赋值。
    [self setToList:curArray];
	self.fromList = curArray;
	[curArray release];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[doublePicker release];
	[toList release];
	[fromList release];
    [super dealloc];
}

#pragma mark --- toList的getter和setter ---

-(NSArray *)toList{
	return toList;
}

-(void)setToList:(NSArray *)list{
	// 首先需要保持对新的内容的引用，即申明目前的对象是list的所有者之一。
	[list retain];
	// 然后需要释放对原先的对象的所有权。
	[toList release];
	// 进行赋值。
	toList = list;
}

#pragma mark --- 选择器的数据源 ---

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if (component == kFromComponent)
		return [self.fromList count];
	else
		return [self.toList count];
}

#pragma mark --- 选择器代理方法 ---

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	if (component == kFromComponent)
		return [self.fromList objectAtIndex:row];
	else
		return [self.toList objectAtIndex:row];
}

#pragma mark --- 按钮响应事件 ---

- (void)doConvert{
	int fromRow = [doublePicker selectedRowInComponent:kFromComponent];
	int toRow = [doublePicker selectedRowInComponent:kToComponent];
	
	float amount = [[amountField text] floatValue] * [self getRate:toRow] / [self getRate:fromRow];
	
	// 正确的代码
	[outputField setText:[NSString stringWithFormat:@"%0.2f", amount]];
	// 导致内存泄露的代码
	//[outputField setText:[[NSString alloc] initWithFormat:@"%0.2f", amount]];
}

- (float)getRate:(int)cur{
	switch (cur) {
		case 0:
			return 1.00;
		case 1:
			return rUSD;
		case 2:
			return rEUR;
		case 3:
			return rGBP;
		case 4:
			return rJPY;
		default:
			return 0.00;
	}
	
	if(DO_TEST == 1){
		// 下面的代码来自于教程： http://memo.tv/memory_management_with_objective_c_cocoa_iphone
		// 英文比较过硬的兄弟，推荐好好阅读一下。
		// 比较繁琐的内存管理办法：
		for(int i=0; i<100; i++) { 
			NSNumber *aNumber1 = [[NSNumber alloc] initWithFloat:1]; // refcount is 1, you are owner
			NSNumber *aNumber2 = [[NSNumber alloc] initWithFloat:2]; // refcount is 1, you are owner
			NSNumber *aNumber3 = [[NSNumber alloc] initWithFloat:3]; // refcount is 1, you are owner
			NSNumber *aNumber4 = [[NSNumber alloc] initWithFloat:4]; // refcount is 1, you are owner
			NSNumber *aNumber5 = [[NSNumber alloc] initWithFloat:5]; // refcount is 1, you are owner
			NSNumber *aNumber6 = [[NSNumber alloc] initWithFloat:6]; // refcount is 1, you are owner
			
			// ... do a bunch of stuff with all objects above.
			NSLog(@"Print Number %d\n", [aNumber1 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber2 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber3 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber4 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber5 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber6 integerValue]);
			
			// release all objects
			[aNumber1 release]; 
			[aNumber2 release];
			[aNumber3 release];
			[aNumber4 release];
			[aNumber5 release];
			[aNumber6 release]; 
		} 
		// 使用自动释放池和快捷生成函数简化代码：
		for(int i=0; i<100; i++) {  
			NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; // create your own little autorelease pool
			
			// these objects get added to the autorelease pool you created above 
			NSNumber *aNumber1 = [NSNumber numberWithFloat:1]; // refcount is 1, you are not owner, will be automatically released
			NSNumber *aNumber2 = [NSNumber numberWithFloat:2]; // refcount is 1, you are not owner, will be automatically released
			NSNumber *aNumber3 = [NSNumber numberWithFloat:3]; // refcount is 1, you are not owner, will be automatically released
			NSNumber *aNumber4 = [NSNumber numberWithFloat:4]; // refcount is 1, you are not owner, will be automatically released
			NSNumber *aNumber5 = [NSNumber numberWithFloat:5]; // refcount is 1, you are not owner, will be automatically released
			NSNumber *aNumber6 = [NSNumber numberWithFloat:6]; // refcount is 1, you are not owner, will be automatically released
			
			// ... do a bunch of stuff with all objects above.
			NSLog(@"Print Number %d\n", [aNumber1 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber2 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber3 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber4 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber5 integerValue]);
			NSLog(@"Print Number %d\n", [aNumber6 integerValue]);
			
			[pool release]; // all objects added to this pool (the ones above) are released 
		}
	}
}

#pragma mark --- 选择器更改响应事件 ---

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[amountField resignFirstResponder];
	[self doConvert];
}

- (IBAction)textFieldDidEndEditing:(id)sender{
	[amountField resignFirstResponder];
	[self doConvert];
}

@end
