//
//  ViewController.m
//  Choice
//
//  Created by Yunzhi Yu on 9/13/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *MessageLabel;
//@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@property (weak, nonatomic) IBOutlet UILabel *MessageLabel;

@end

@implementation ViewController

- (IBAction)dietBT:(id)sender {
    
    if (self.nameTF.text.length > 0) {
        
        NSString *content = [self.nameTF.text stringByAppendingString:@", thanks for choosing the diet coke. Drink healthy"];
        
        self.MessageLabel.text = content;
    }
    else{
        NSString *content = @"Hey,thanks for choosing the diet coke. Drink healthy";
        
        self.MessageLabel.text = content;
    }
    

}
- (IBAction)cokeBT:(id)sender {
    if (self.nameTF.text.length > 0) {
        
        NSString *content = [self.nameTF.text stringByAppendingString:@", thanks for choosing the regular coke. Stay cooooool!"];
        
        self.MessageLabel.text = content;
    }
    else{
        NSString *content = @"Hey,thanks for choosing the regular coke. Stay cooooool！";
        
        self.MessageLabel.text = content;
    }
    

}

- (IBAction)BackgroundButton:(id)sender {
    
    [self.nameTF resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)nameTF
{
    [nameTF resignFirstResponder];
    return YES;
}


//
//- (IBAction)textFieldExit:(id)sender {
//        [sender resignFirstResponder];
//}

//- (IBAction)BackgroundButton:(id)sender {
//        [self.nameTF resignFirstResponder];
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.nameTF.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
