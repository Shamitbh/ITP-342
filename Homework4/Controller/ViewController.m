//
//  ViewController.m
//  Homework4
//
//  Created by Shamit Bhatia on 2/28/18.
//  Copyright © 2018 Shamit Bhatia. All rights reserved.
//

#import "ViewController.h"
#import "FlashcardsModel.h"

@interface ViewController ()

// private properties


@property (weak, nonatomic) IBOutlet UILabel *flashcardLabel;

@property (strong, nonatomic) FlashcardsModel* model;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.model = [FlashcardsModel sharedModel];
	
	// Get random flashcard and display question
	Flashcard *randomFlashcard = [self.model randomFlashcard];
	self.flashcardLabel.text = [randomFlashcard question];
	
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
