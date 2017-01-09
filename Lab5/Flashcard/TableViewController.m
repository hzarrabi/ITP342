//
//  TableViewController.m
//  Flashcard
//
//  Created by Yunzhi Yu on 11/5/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "TableViewController.h"
#import "FlashcardsModel.h"
#import "Flashcard.h"
#import "AddCardsController.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource >

@property (nonatomic,strong) FlashcardsModel *flashcardsSet;


@property (weak, nonatomic) IBOutlet UITableView* tableView;


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.flashcardsSet = [FlashcardsModel sharedModel];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.flashcardsSet getCardCount];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Create a cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //modify cell
    Flashcard* quote = [self.flashcardsSet flashcardAtIndex:indexPath.row];
    
    cell.textLabel.text = quote.question;
    cell.detailTextLabel.text = quote.answer;
    //return cell
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        //delete the flashcard from model
        [self.flashcardsSet removeFlashcardAtIndex:indexPath.row];
        //perform
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *) segue sender:(id)sender{
    AddCardsController *acc = (AddCardsController*) segue.destinationViewController;
    
    acc.completionHandler = ^(NSString* question, NSString *answer){
        if(question != nil && answer != nil){
            [self.flashcardsSet insertWithQuestion:question answer:answer favorite:FALSE];
            
            [self.tableView reloadData];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    acc.onCancelHandler = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
