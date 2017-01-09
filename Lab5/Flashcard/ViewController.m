//
//  ViewController.m
//  Flashcard
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "ViewController.h"
#import "FlashcardsModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;
@property (weak, nonatomic) FlashcardsModel* FCModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //In the viewDidLoad method, create the model by calling the sharedModelmethod. Then get a random flashcard and display its question.
    self.FCModel = [FlashcardsModel sharedModel];
    Flashcard* CurrentCard = [self.FCModel randomFlashcard];
    self.ContentLabel.text = CurrentCard.question;
    
    //implementing gestures
    
    //single tap
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapRecognized: )];
    singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleTap];
    
    //double taps
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    // only recognize the single tap if it is not the first two taps
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    // swipe left
    UISwipeGestureRecognizer* SwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeLeftRecognized: )];
    SwipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:SwipeLeft];
    
    //swipe right
    UISwipeGestureRecognizer* SwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRightRecognized: )];
    SwipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:SwipeRight];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// here is my promise
-(void) singleTapRecognized:(UITapGestureRecognizer*) action //load random flashcard
{
    if([self.FCModel numberOfFlashcards]<=0){
        self.ContentLabel.backgroundColor=UIColor.redColor;
        self.ContentLabel.textColor=UIColor.whiteColor;
        self.ContentLabel.text=@"THERE ARE NO MORE FLASHCARDS";
    }else{
    
    Flashcard* CurrentCard = [self.FCModel randomFlashcard];
    [self FlashcardAnimation:CurrentCard];
    }
}

-(void) doubleTapRecognized:(UITapGestureRecognizer*) action //load random flashcard
{
    
    if([self.FCModel numberOfFlashcards]<=0){
        self.ContentLabel.backgroundColor=UIColor.redColor;
        self.ContentLabel.textColor=UIColor.whiteColor;
        self.ContentLabel.text=@"PLEASE ADD MORE FLASHCARDS";
    }else{
    Flashcard* CurrentCard = [self.FCModel flashcardAtIndex:[self.FCModel getCurrent]];
    [self ShowSolutionAnimation:CurrentCard];
    }
}



-(void) FlashcardAnimation:(Flashcard*) CurrentCard{
    [UIView animateWithDuration:.5
                     animations:^{
                         self.ContentLabel.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         self.ContentLabel.alpha = 1;
                         self.ContentLabel.text = CurrentCard.question;
                         self.ContentLabel.textColor = UIColor.greenColor;
                     }];
    
}

-(void) ShowSolutionAnimation:(Flashcard*) CurrentCard{
    [UIView animateWithDuration:.7
                     animations:^{
                         self.ContentLabel.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         self.ContentLabel.alpha = 1;
                         self.ContentLabel.text = CurrentCard.answer;
                         self.ContentLabel.textColor = UIColor.blueColor;
                     }];
    
}


-(void) SwipeLeftRecognized:(UITapGestureRecognizer*) action //go left a card
{
    if([self.FCModel numberOfFlashcards]<=0){
        self.ContentLabel.backgroundColor=UIColor.redColor;
        self.ContentLabel.textColor=UIColor.whiteColor;
        self.ContentLabel.text=@"THERE ARE NO MORE FLASHCARDS";
    }else{
        Flashcard* CurrentCard = [self.FCModel nextFlashcard];
        [self FlashcardAnimation:CurrentCard];
    }
}

-(void) SwipeRightRecognized:(UITapGestureRecognizer*) action //go left a card
{
    if([self.FCModel numberOfFlashcards]<=0){
        self.ContentLabel.backgroundColor=UIColor.redColor;
        self.ContentLabel.textColor=UIColor.whiteColor;
        self.ContentLabel.text=@"THERE ARE NO MORE FLASHCARDS";
    }else{
        Flashcard* CurrentCard = [self.FCModel prevFlashcard];
        [self FlashcardAnimation:CurrentCard];
    }
}


@end
