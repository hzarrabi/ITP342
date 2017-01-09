//
//  Flashcard.h
//  Flashcard
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flashcard : NSObject
// public properties

@property (nonatomic, weak) NSString* question; // readonly
@property (nonatomic, weak) NSString* answer;   // readonly

@property (nonatomic) BOOL isFavorite;

// public methods
- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans;
- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                        isFavorite: (BOOL) isFav;

@end/* Flashcard_h */
