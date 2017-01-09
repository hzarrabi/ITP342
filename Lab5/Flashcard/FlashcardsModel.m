	//
//  FlashcardsModel.m
//  Flashcard
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "FlashcardsModel.h"

static NSString const * kCardsFilename = @"flashcards.plist";

// Class extension
@interface FlashcardsModel()

@property (nonatomic, strong) NSString *filepath;
@end


@implementation FlashcardsModel

-(instancetype) init{
    self = [super init];
    if (self) {
            // set the _currentIndex
            NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = directories[0];
            // get the documents directory and set _filepath
            self.filepath = [documentsDirectory stringByAppendingString:kCardsFilename];
            

            // _filepath includes the plist
            
            NSMutableArray* cards = [NSMutableArray arrayWithContentsOfFile: _filepath];
            
            if (!cards) { // no file
                        Flashcard* card1 = [[Flashcard alloc]   initWithQuestion:@"blue" answer:@"BBB"];
                        Flashcard* card2 = [[Flashcard alloc] initWithQuestion:@"red" answer: @"RRR"];
                        Flashcard* card3 = [[Flashcard alloc] initWithQuestion:@"yellow" answer:@"YYY"];
                        Flashcard* card4 = [[Flashcard alloc] initWithQuestion:@"green" answer: @"GGG"];
                        Flashcard* card5 = [[Flashcard alloc] initWithQuestion:@"peanut butter" answer:@"Yummy"];
                
                        //create flashcards array
                        _flashcards = [[NSMutableArray alloc] init];
                
                        [_flashcards addObject:card1];
                        [_flashcards addObject:card2];
                        [_flashcards addObject:card3];
                        [_flashcards addObject:card4];
                        [_flashcards addObject:card5];
                
                
                cards = _flashcards;
                
                
            } else {
                _flashcards = [[NSMutableArray alloc] init];
                NSDictionary* card;
                Flashcard* flashcard;
                
                for (card in cards) {
                    flashcard = [[Flashcard alloc] initWithDictionary: card];
                    [_flashcards addObject: flashcard];
                }
            }
        }
    
        return self;
    
}

+ (instancetype) sharedModel{
    static FlashcardsModel* _sharedModel = nil;
    if(_sharedModel == nil){
        _sharedModel = [[self alloc] init];
    }
    return _sharedModel;
}

// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards{
    
    NSUInteger arrayLength = [_flashcards count];
    
    return arrayLength;
}

-(unsigned int) getCurrent
{
    return self.currentIndex;
}

// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard{
    
    int size = (int)[_flashcards count];
    int Rand = arc4random() % (size);
    _currentIndex = Rand;
    return [_flashcards objectAtIndex: Rand];

}

- (Flashcard *) flashcardAtIndex: (NSUInteger) index{
    int size = (int)[_flashcards count];
    if(index < size ){
        _currentIndex = (unsigned int)index;
        return [_flashcards objectAtIndex:index];
    }
    else{
        return nil;
    }
}

- (Flashcard *) nextFlashcard{
    int size = (int)[_flashcards count];
    if(_currentIndex + 1 < size){
        _currentIndex += 1;
        return [_flashcards objectAtIndex:_currentIndex];
    }
    else{
        _currentIndex =0;
        return [_flashcards objectAtIndex:_currentIndex];

    }
}

- (Flashcard *) prevFlashcard{
    
    if(_currentIndex != 0 ){
        _currentIndex -=1;
        return [_flashcards objectAtIndex:_currentIndex];
    }
    else{
        _currentIndex =(int)[_flashcards count]-1;
        return [_flashcards objectAtIndex:_currentIndex];
    }

}


// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans favorite: (BOOL) fav{
    
    Flashcard* newCard = [[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav];
    [_flashcards addObject:newCard];
    
    [self save];
    
    NSLog(@"in insert with question Question is %@, Answer is %@",question, ans);

}

- (void) insertWithQuestion: (NSString *) question answer: (NSString *) ans
                   favorite: (NSNumber *) fav atIndex: (NSUInteger) index{
    if(index <= [_flashcards count])
    {
        Flashcard* newCard = [[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav];
        [_flashcards insertObject:newCard atIndex:index];
    }
    else{
        printf("Out_Of_Bound");
    }
    
     [self save];
    NSLog(@"in insert with question Question is %@, Answer is %@",question, ans);
}


// Removing a flashcard
- (void) removeFlashcard{
    if([_flashcards count] != 0)
    {
        [_flashcards removeLastObject];
    }
    else{
        printf("Out_Of_Bound");
    }
    
     [self save];
}

- (void) removeFlashcardAtIndex: (NSUInteger) index{
    if(index < [_flashcards count]){
        [_flashcards removeObjectAtIndex:index];
    }
    else{
        printf("Out_Of_Bound");
    }
    
     [self save];
}

// Favorite/unfavorite the current flashcard
- (void) toggleFavorite{
    Flashcard* newCard= [_flashcards objectAtIndex:_currentIndex];
    if(newCard.isFavorite != TRUE){
        newCard.isFavorite = TRUE;
    }
    
     [self save];
}

// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards{
    NSMutableArray* favoriteFlashcards = [[NSMutableArray alloc] init];
    
    int size = (int) [_flashcards count];
    for(int i =0; i < size; i++)
    {
        Flashcard* Curr = [_flashcards objectAtIndex:i];
        if(Curr.isFavorite){
            [favoriteFlashcards addObject:Curr];
        }
    }
    return favoriteFlashcards;

}

//newly added
-(NSUInteger) getCardCount
{
    return [_flashcards count];
}

- (void) save {
    NSMutableArray* cards = [[NSMutableArray alloc] init];
    Flashcard* card;
    for (card in self.flashcards) {
        [cards addObject: [card dictionary]];
    }
    [cards writeToFile:self.filepath atomically:YES];
}



@end
