//
//  Flashcard.m
//  Flashcard
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "Flashcard.h"
 @implementation Flashcard

- (instancetype) initWithQuestion: (NSString *) question answer: (NSString *) ans{
    self = [super init];
    if(self){
    _question = question;
    _answer = ans;
    }
    
    return self;
}

- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav{
    
     self = [super init];
    if(self){
    _question = question;
    _answer = ans;
    _isFavorite = isFav;
    }
    
    return self;
}

@end