//
//  ViewController.m
//  Demo
//
//  Created by Lee Bennett on 9/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

// viewDidLoad is a method that's called once when the main view is loaded into memory, this is a common place for you to put set up code that's run once
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Example of using the Person class we created

    // Creates a person object by allocating memory and initailize values
    Person *joe = [[Person alloc] init];
    
    // Calls the "sayHello" method on joe
    [joe sayHello];
    
    // Uses the public accessor method to set the person's name
    [joe setName:@"Joe"];
    
    // Calls the "sayMyName" method on joe
    [joe sayMyName];
    
    // Uses the public accessor method to set the person's age
    [joe setAge:20];

    // Uses dot notation syntax to set the person's age. This is the same as calling "[joe setAge:30]"
    joe.age = 30;
    
    // Gets age
    [joe age];
    
    // Uses dot notation syntax to get the person's age. This is the same as calling "[joe age]"
    joe.age;

    // Here I'm accessing the firstNameTextField of the ViewController (self), and setting it's 'text' property
    self.firstNameTextField.text = @"Bennett";
    
    // "UIColor" is a class we use to represent color in iOS. Here i'm using a class method "blueColor" to create a new color object that represents the blue color
    self.firstNameTextField.backgroundColor = [UIColor blueColor];
    
}

// IBActions are methods that run in response to user interaction on interface builders

// When the background button is pressed, we will dismiss the keyboard
- (IBAction)backgroundButtonDidPressed:(UIButton *)sender {
    
    // The first responder is the element that is currently focused. When you invoked the "resignFirstResponder" method on a focused text field, you will dismiss the keyboard
    [self.firstNameTextField resignFirstResponder];
}


// When the button is pressed, we will update the background color of the main view and the button itself
// "sender" is the object that caused the IBAction to be fired. In this case, it's the button
- (IBAction)didPressedButton:(UIButton *)sender {
    
    // Every view controller has a property called "view" that represents the main view of the window
    self.view.backgroundColor = [UIColor blueColor];
    
    // To prove to you that sender is indeed the button that caused the IBAction to be fired, I change it's background color
    sender.backgroundColor = [UIColor yellowColor];
}


@end








