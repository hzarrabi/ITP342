//
//  FlashcardsModel.h
//  Flashcard
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"Flashcard.h"

@interface FlashcardsModel : NSObject

@property (strong, nonatomic) NSMutableArray* flashcards;
@property (readonly, nonatomic) unsigned int currentIndex;

// Creating the model
+ (instancetype) sharedModel;

// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards;

// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard;
- (Flashcard *) flashcardAtIndex: (NSUInteger) index;
- (Flashcard *) nextFlashcard;
- (Flashcard *) prevFlashcard;

// get the current card's index to I can acess the current card
- (unsigned int) getCurrent;
// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans favorite: (BOOL) fav;
- (void) insertWithQuestion: (NSString *) question answer: (NSString *) ans
                   favorite: (NSNumber *) fav atIndex: (NSUInteger) index;

// Removing a flashcard
- (void) removeFlashcard;
- (void) removeFlashcardAtIndex: (NSUInteger) index;

// Favorite/unfavorite the current flashcard
- (void) toggleFavorite;

// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards;



@end
