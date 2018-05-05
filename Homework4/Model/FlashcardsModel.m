//
//  FlashcardsModel.m
//  Homework4
//
//  Created by Shamit Bhatia on 3/15/18.
//  Copyright © 2018 Shamit Bhatia. All rights reserved.
//

#import "FlashcardsModel.h"

// class extension
@interface FlashcardsModel ()
// private properties
@property (strong, nonatomic) NSMutableArray* flashcards;


@end
// end of class extension

// implement methods
@implementation FlashcardsModel

- (instancetype) init {
	self = [super init];
	if (self) {
		
		// create flashcards
		Flashcard *f1;
		Flashcard *f2;
		Flashcard *f3;
		Flashcard *f4;
		Flashcard *f5;
		
		// Initialize flashcards with Questions/Answers
		f1 = [[Flashcard alloc] initWithQuestion: @"Which U.S. state has the longest coastline?" answer: @"Alaska (6,640 miles)"];
		f2 = [[Flashcard alloc] initWithQuestion: @"Which U.S. president appears on the front of the $2 bill?? " answer: @"Thomas Jefferson"];
		f3 = [[Flashcard alloc] initWithQuestion: @"What is the capital city of the U.S. state of Hawaii?" answer: @"Honolulu"];
		f4 = [[Flashcard alloc] initWithQuestion: @"What US state is famous for its juicy peaches?" answer: @"Georgia"];
		f5 = [[Flashcard alloc] initWithQuestion: @"In which U.S. state would you find Mount Rushmore?" answer: @"South Dakota"];
		
		// Create flashcards array
		_flashcards = [[NSMutableArray alloc] initWithObjects: f1, f2, f3, f4, f5, nil];
		
		// set currentIndex to 0
		_currentIndex = 0;
	}
	return self;
}

// Creating the model
+ (instancetype) sharedModel{
	// static ivar
	static FlashcardsModel *flashcardsModel = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		// code to be executed once - thread safe version
		flashcardsModel = [[FlashcardsModel alloc] init];
	});
	
	return flashcardsModel;
}

// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards {
	return self.flashcards.count;
}

// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard {
	int randIndex = (int)arc4random_uniform((int32_t) self.flashcards.count);
	_currentIndex = randIndex;
	return self.flashcards[_currentIndex];
}

- (Flashcard *) flashcardAtIndex: (NSUInteger) index {
	return self.flashcards[index];
}

- (Flashcard *) nextFlashcard {
	// check flashcard index not going over
	if (_currentIndex < self.flashcards.count - 1 ){
		_currentIndex += 1;
		return self.flashcards[_currentIndex];
	}
	else{
		// loop back to beginning b/c it was last card
		_currentIndex = 0;
		return self.flashcards[_currentIndex];
	}
}

- (Flashcard *) prevFlashcard {
	// check flashcard index not going under
	if (_currentIndex > 0){
		_currentIndex -= 1;
		return self.flashcards[_currentIndex];
	}
	else{
		// loop around to the end of the deck b/c it was first card before and prev means go back 1
		_currentIndex = (int)self.flashcards.count - 1;
		return self.flashcards[_currentIndex];
	}
}

// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
					 answer: (NSString *) ans
				   favorite: (BOOL) fav {
	// Create temp flashcard object
	Flashcard *tempFlashcard;
	tempFlashcard = [[Flashcard alloc] initWithQuestion:question answer: ans isFavorite: fav];
	// Add this flashcard to end of flashcard array
	[self.flashcards addObject:tempFlashcard];
	
}
- (void) insertWithQuestion: (NSString *) question
					 answer: (NSString *) ans
				   favorite: (BOOL) fav
					atIndex: (NSUInteger) index {
	// check that index is <= flashcard count before adding
	if (index <= [self numberOfFlashcards]){
		// Create temp flashcard object to insert
		Flashcard *tempFlashcard;
		tempFlashcard = [[Flashcard alloc] initWithQuestion:question answer: ans isFavorite: fav];
		// Add this flashcard to the index
		[self.flashcards insertObject:tempFlashcard atIndex: index];
	}
}

// Removing a flashcard
- (void) removeFlashcard {
	// Make sure not to remove if it's empty!
	if ([self numberOfFlashcards] > 0){
		[self.flashcards removeLastObject];
	}
}

- (void) removeFlashcardAtIndex: (NSUInteger) index {
	// Check that index < # of flashcards
	if (index < [self numberOfFlashcards]) {
		[self.flashcards removeObjectAtIndex: index];
	}
}

// Favorite/unfavorite the current flashcard
- (void) toggleFavorite {
	// get the current flashcard
	Flashcard *currFlashcard = self.flashcards[_currentIndex];
	
	// now toggle the favorite stuff -> since bool can do opposite
	currFlashcard.isFavorite = !currFlashcard.isFavorite;
}

// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards {
	// Create a temp mutable array to add to flashcards which are favorite
	NSMutableArray *tempFavFlashcards;
	
	for (int i = 0; i < [self numberOfFlashcards]; i++){
		if ([self.flashcards[i] isFavorite]){
			[tempFavFlashcards addObject:self.flashcards[i]];
		}
	}
	// Now we have our array of fav flaschards, but need to return NSArray (not mutable)
	NSArray *actualFavFlashcards = [NSArray arrayWithArray:tempFavFlashcards];
	return actualFavFlashcards;
}



@end
