//
//  Flashcard.h
//  Homework4
//
//  Created by Shamit Bhatia on 3/13/18.
//  Copyright © 2018 Shamit Bhatia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flashcard : NSObject

@property (nonatomic, strong, readonly) NSString *question;
@property (nonatomic, strong, readonly) NSString *answer;
@property BOOL isFavorite;

// Initializing the flashcard
- (instancetype) initWithQuestion: (NSString *) question
						   answer: (NSString *) ans;

- (instancetype) initWithQuestion: (NSString *) question
						   answer: (NSString *) ans
						   isFavorite: (BOOL) isFav;

@end

