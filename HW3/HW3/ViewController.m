//
//  ViewController.m
//  HW3
//
//  Created by Shamit Bhatia on 1/31/18.
//  Copyright © 2018 Shamit Bhatia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *billAmountEntered;
@property (weak, nonatomic) IBOutlet UISegmentedControl *taxPercentage;
@property (weak, nonatomic) IBOutlet UILabel *taxAmountLabel;
@property (weak, nonatomic) IBOutlet UISwitch *tipIncludesTax;
@property (weak, nonatomic) IBOutlet UILabel *totalForTip;
@property (weak, nonatomic) IBOutlet UILabel *percentTipLabel;
@property (weak, nonatomic) IBOutlet UISlider *percentTip;
@property (weak, nonatomic) IBOutlet UILabel *evenSplitNumber;
@property (weak, nonatomic) IBOutlet UIStepper *evenSplitStepper;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalWithTipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalPerPersonAmount;



@end

@implementation ViewController

// floats
float billAmount;
float taxPercent;
float taxAmount;
float tipPercent;

float totalForTip;
float tipValue;
float totalWithTip;
float totalEachPerson;

// bool to figure out whether to include tax
bool includeTax;
// int to see how many people to split with
int splitNum;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self setDefaultValues];
	
}

// helper method to set Default Values
- (void) setDefaultValues {
	
	//set default float values
	billAmount = 0;
	taxPercent = 0;
	taxAmount = 0;
	tipPercent = 0;
	splitNum = 1;
	totalForTip = 0;
	tipValue = 0;
	totalWithTip = 0;
	totalEachPerson = 0;
	//set bool to not include tax
	includeTax = false;
	
	// set defaults for UI
	self.billAmountEntered.text =@"";
	self.taxAmountLabel.text = [NSString stringWithFormat: @"%.02f", taxAmount];
	self.totalForTip.text = [NSString stringWithFormat: @"%.02f", billAmount];
	self.tipAmount.text = [NSString stringWithFormat: @"%.02f", tipValue];
	self.totalWithTipAmount.text = [NSString stringWithFormat: @"%.02f", totalWithTip];
	self.percentTipLabel.text = @"0%";
	self.totalPerPersonAmount.text = [NSString stringWithFormat: @"%.02f", totalEachPerson];
	self.evenSplitNumber.text = [NSString stringWithFormat: @"%d",splitNum];
	[self.tipIncludesTax setOn: NO];
	[self.percentTip setValue: 0];
	self.evenSplitStepper.value = 1;
	
	
	[_taxPercentage setSelectedSegmentIndex:UISegmentedControlNoSegment];
	
}

// helper method update values
- (void) updateValues {
	
	// tax Amount
	taxAmount = billAmount * taxPercent;
	_taxAmountLabel.text = [NSString stringWithFormat: @"$%.02f", taxAmount];
	
	//total for Tip
	_totalForTip.text = [NSString stringWithFormat:@"$%.02f", totalForTip];
	
	// tip value
	tipValue= totalForTip * (tipPercent);
	_tipAmount.text = [NSString stringWithFormat: @"$%.02f", tipValue];
	
	// total with tip
	totalWithTip = billAmount + taxAmount + tipValue;
	_totalWithTipAmount.text = [NSString stringWithFormat: @"$%.02f", totalWithTip];
	
	//total Per Person
	totalEachPerson = totalWithTip / splitNum;
	_totalPerPersonAmount.text = [NSString stringWithFormat: @"$%.02f", totalEachPerson];
	
}

- (IBAction)clearButton:(id)sender {
	
	UIAlertController *alertController = [UIAlertController
										  alertControllerWithTitle:@"Clear All Values"
										  message:@"Are you sure you want to clear all values?"
										  preferredStyle:UIAlertControllerStyleActionSheet];
	UIAlertAction *cancelAction = [UIAlertAction
								   actionWithTitle:@"Cancel"
								   style:UIAlertActionStyleCancel
								   handler:^(UIAlertAction *action) { }];
	UIAlertAction *deleteAction = [UIAlertAction
								   actionWithTitle:@"Clear All"
								   style:UIAlertActionStyleDestructive
								   handler:^(UIAlertAction *action) { [self setDefaultValues];}];
	
	[alertController addAction:cancelAction];
	[alertController addAction:deleteAction];
	[self presentViewController:alertController animated:YES completion:nil];
	
	
}

- (IBAction)someBillEntered:(id)sender {
	NSLog(@"amount entered");
	billAmount = [self.billAmountEntered.text floatValue];
	[self updateValues];
}

- (IBAction)taxRatePressed:(UISegmentedControl *)sender {
	billAmount = [self.billAmountEntered.text floatValue];
	
	if (sender.selectedSegmentIndex == 0) {
		
		taxPercent= 0.075;
		_taxAmountLabel.text = [NSString stringWithFormat:@"$%.02f", taxPercent];
	}
	else if (sender.selectedSegmentIndex == 1) {
		taxPercent= 0.080;
		_taxAmountLabel.text = [NSString stringWithFormat:@"$%.02f", taxPercent];
	}
	else if (sender.selectedSegmentIndex == 2) {
		taxPercent = 0.085;
		_taxAmountLabel.text = [NSString stringWithFormat:@"$%.02f", taxPercent];
	}
	else if (sender.selectedSegmentIndex == 3) {
		taxPercent = 0.090;
		_taxAmountLabel.text = [NSString stringWithFormat:@"$%.02f", taxPercent];
	}
	else if (sender.selectedSegmentIndex == 4) {
		taxPercent =  0.095;
		_taxAmountLabel.text = [NSString stringWithFormat:@"$%.02f", taxPercent];
	}
	taxAmount = billAmount * taxPercent;
	totalForTip = billAmount;
	
	[self updateValues];

}

- (IBAction)taxIncluded:(id)sender {
	//switch is On
	if ([sender isOn]) {
		totalForTip = billAmount + taxAmount;
	}
	else {
		totalForTip = billAmount;
	}
	_totalForTip.text = [NSString stringWithFormat:@"$%f", totalForTip];
	
	[self updateValues];
}

- (IBAction)percentChanged:(UISlider *)sender {
	// Round up to an integer
	int percentForTip = (int)sender.value;
	
	self.percentTipLabel.text = [[NSString alloc] initWithFormat:@"%d%%", percentForTip];
	tipPercent = (float) percentForTip/100;
	
	[self updateValues];
}


- (IBAction)stepperChanged:(UIStepper *)sender {
	// set a min and max
	int numberOfSplits = (int)sender.value;
	
	self.evenSplitNumber.text = [[NSString alloc] initWithFormat:@"%d", numberOfSplits];
	
	splitNum = numberOfSplits;
	
	[self updateValues];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard {
	[_billAmountEntered resignFirstResponder];
	[self updateValues];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.view endEditing:YES];
	[self updateValues];
}

@end

