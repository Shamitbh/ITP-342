//
//  Flashcard.m
//  Homework4
//
//  Created by Shamit Bhatia on 3/13/18.
//  Copyright © 2018 Shamit Bhatia. All rights reserved.
//

#import "Flashcard.h"

@implementation Flashcard


- (instancetype) initWithQuestion: (NSString *) question
						   answer: (NSString *) ans
{
	// call the other init method
	return [self initWithQuestion:question answer:ans isFavorite:false];
}


- (instancetype) initWithQuestion: (NSString *) question
						   answer: (NSString *) ans
					   isFavorite: (BOOL) isFav
{
	self = [super init];
	if (self) {
		_question = question;
		_answer = ans;
		_isFavorite = isFav;
	}
	return self;
	
}

@end
