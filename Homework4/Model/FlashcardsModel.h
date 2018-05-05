//
//  FlashcardsModel.h
//  Homework4
//
//  Created by Shamit Bhatia on 3/15/18.
//  Copyright © 2018 Shamit Bhatia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flashcard.h"

@interface FlashcardsModel : NSObject
// public properties
@property (readonly) unsigned int currentIndex;


// public methods

// Creating the model
+ (instancetype) sharedModel;
// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards;
// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard;
- (Flashcard *) flashcardAtIndex: (NSUInteger) index;
- (Flashcard *) nextFlashcard;
- (Flashcard *) prevFlashcard;
// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
					 answer: (NSString *) ans
				   favorite: (BOOL) fav;
- (void) insertWithQuestion: (NSString *) question
					 answer: (NSString *) ans
				   favorite: (BOOL) fav
					atIndex: (NSUInteger) index;
// Removing a flashcard
- (void) removeFlashcard;
- (void) removeFlashcardAtIndex: (NSUInteger) index;
// Favorite/unfavorite the current flashcard
- (void) toggleFavorite;
// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards;

@end
