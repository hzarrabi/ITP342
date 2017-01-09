//
//  Flashcard.h
//  Flashcard
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
// constants
static NSString * const kQuestionKey = @"question";
static NSString * const kAnswerKey = @"answer";
static NSString * const kFavKey = @"fav";
static NSString * const kFavoriteYes = @"yes";
static NSString * const kFavoriteNo = @"no";

@interface Flashcard : NSObject
// public properties


// public properties
// public methods

@property (readonly) NSString* question; // readonly
@property (readonly) NSString* answer;   // readonly

@property (nonatomic) BOOL isFavorite;

// public methods
- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans;
- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                        isFavorite: (BOOL) isFav;

- (instancetype) initWithDictionary: (NSDictionary *) card;
- (NSDictionary *) dictionary;


@end/* Flashcard_h */
