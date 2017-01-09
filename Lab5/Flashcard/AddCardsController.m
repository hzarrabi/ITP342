//
//  AddCardsController.m
//  Flashcard
//
//  Created by Yunzhi Yu on 11/6/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "AddCardsController.h"

@interface AddCardsController ()<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SaveButton;

@property (weak, nonatomic) IBOutlet UITextView *QuestionTextView;
@property (weak, nonatomic) IBOutlet UITextView *AnswerTextView;

@end

@implementation AddCardsController

// MARK: - Life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.SaveButton.enabled = NO;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.QuestionTextView becomeFirstResponder];
}

// MARK: - Actions
- (IBAction)saveDidTapped:(UIBarButtonItem *)sender {
    NSLog(@"Question is %@, Answer is %@", self.QuestionTextView.text, self.AnswerTextView.text);
    
    if (self.completionHandler){
        self.completionHandler(self.QuestionTextView.text, self.AnswerTextView.text);
    }

}


- (IBAction)cancelDidTapper:(UIBarButtonItem *)sender {
    if(self.onCancelHandler){
        self.onCancelHandler();
    }
}

// MARK: - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextView *)textView{
    [self.QuestionTextView becomeFirstResponder];
    return YES;
}

// This will be called every time the user types on the text view
- (BOOL)textView:(UITextField *)textView shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *latestAnswer = [textView.text stringByReplacingCharactersInRange:range withString:string];
    
    
    // Determine if we should enable the save button
    [self updateSaveButtonStatusWithAnswer:latestAnswer andquestion:self.QuestionTextView.text];
    
    return YES;
    
}

// MARK : - UITextViewDelegate
// This will be called every time the user types on the text view

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSString *latestQuestion = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    // Determine if we should enable the save button
    [self updateSaveButtonStatusWithAnswer:self.AnswerTextView.text andquestion:latestQuestion];
    
    return YES;
}



- (void)updateSaveButtonStatusWithAnswer:(NSString *)answer andquestion:(NSString *)question{
    
    self.SaveButton.enabled = (answer.length > 0 && question.length > 0);
    
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
