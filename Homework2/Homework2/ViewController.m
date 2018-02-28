//
//  ViewController.m
//  Homework2
//
//  Created by Shamit Bhatia on 1/22/18.
//  Copyright © 2018 Shamit Bhatia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// close the keyboard after Done is clicked
- (IBAction)keyboardDone:(id)sender {
	[sender resignFirstResponder];
}

// Background "button" touched
- (IBAction)backgroundTouched:(id)sender {
	[self.nameTextField resignFirstResponder];
}

// USC button is tapped
- (IBAction)USCButtonTapped:(id)sender {
	// local variables
	NSString *message;
	NSString *name = [self.nameTextField text];
	// check if anything entered in nameTF
	if (name.length > 0){
		message = [NSString stringWithFormat: @"Well done, %@! You chose the objectively BETTER school.", name];
	}else{
		message = @"You chose the objectively BETTER school.";
	}
	self.messageLabel.text = message;
}

// UCLA button is tapped
- (IBAction)UCLAButtonTapped:(id)sender {
	// local variables
	NSString *message;
	NSString *name = [self.nameTextField text];
	// check if anything entered in nameTF
	if (name.length > 0){
		message = [NSString stringWithFormat: @"Poor choice, %@! You chose the objectively WORSE school.", name];
	}else{
		message = @"You chose the objectively WORSE school.";
	}
	self.messageLabel.text = message;
	
}

// Reset button is tapped
- (IBAction)ResetButtonTapped:(id)sender {
	
	// Reset both textField and messageLabel to blank
	self.nameTextField.text = @"";
	self.messageLabel.text = @"";
	
}


@end
