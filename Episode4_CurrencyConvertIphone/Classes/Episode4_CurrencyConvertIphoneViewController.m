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
@synthesize toList;
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
    self.toList = curArray;
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
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[amountField resignFirstResponder];
	[self doConvert];
}

- (IBAction)textFieldDidEndEditing:(id)sender{
	[amountField resignFirstResponder];
	[self doConvert];
}

@end
