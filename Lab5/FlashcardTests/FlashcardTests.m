//
//  FlashcardTests.m
//  FlashcardTests
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FlashcardsModel.h"

@interface FlashcardTests : XCTestCase
@property(weak, nonatomic) FlashcardsModel* FCModel;
@end

@implementation FlashcardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.FCModel = [FlashcardsModel sharedModel];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSUInteger num = 5;
    XCTAssertEqual(num, [self.FCModel numberOfFlashcards]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testInsert{
    NSNumber* fav = [NSNumber numberWithBool:YES];
    [_FCModel insertWithQuestion:@"what is the HW" answer:@"Lab4" favorite:fav atIndex:1];
    XCTAssertEqual(6, [_FCModel numberOfFlashcards]);
}

-(void) testInsert2{
    NSNumber* fav = [NSNumber numberWithBool:YES];
    [_FCModel insertWithQuestion:@"what is the class" answer:@"itp342" favorite:fav atIndex:2];
    XCTAssertEqual(7, [_FCModel numberOfFlashcards]);
}

-(void) testInsert3{
    NSNumber* fav = [NSNumber numberWithBool:YES];
    [_FCModel insertWithQuestion:@"what is the good thing" answer:@"everything has good side" favorite:fav ];
    XCTAssertEqual(8, [_FCModel numberOfFlashcards]);
}


-(void) testAnswer{
    NSNumber* fav = [NSNumber numberWithBool:YES];
    [_FCModel insertWithQuestion:@"what is the good thing" answer:@"Sun" favorite:fav atIndex: 1 ];
    Flashcard* card = [_FCModel flashcardAtIndex:1];
    XCTAssertEqual(@"Sun", [card answer]);
    [_FCModel removeFlashcardAtIndex:1];
}

-(void) testRemove1{
    [_FCModel removeFlashcard];
    XCTAssertEqual(7, [_FCModel numberOfFlashcards]);
}

-(void) testRemove2{
    [_FCModel removeFlashcardAtIndex:2];
    XCTAssertEqual(6, [_FCModel numberOfFlashcards]);
}

-(void) testRemove3{
    [_FCModel removeFlashcardAtIndex:1];
    XCTAssertEqual(5, [_FCModel numberOfFlashcards]);
}

-(void) testFav{
    XCTAssertEqual(0, [[_FCModel favoriteFlashcards] count]);
}

-(void) testFlashCardAtIndex{
    Flashcard* Card = [_FCModel flashcardAtIndex:3];
    XCTAssertEqual(3, [_FCModel getCurrent]);
}

-(void) testNextcard{
    [_FCModel nextFlashcard];
    XCTAssertEqual(4, [_FCModel getCurrent]);
}

-(void) testPrevcard1{
    [_FCModel prevFlashcard];
    XCTAssertEqual(3, [_FCModel getCurrent]);
}


-(void) testPrevcard2{
    [_FCModel prevFlashcard];
    XCTAssertEqual(2, [_FCModel getCurrent]);
}

-(void) testFavToggle{
    Flashcard* card = [_FCModel flashcardAtIndex:1];
    
    [_FCModel toggleFavorite];
    XCTAssertEqual(1, [card isFavorite]);
}

-(void) testNumOfFav{
    NSArray* FavCards = [_FCModel favoriteFlashcards];
    
    XCTAssertEqual(4, [FavCards count]);
}


@end
