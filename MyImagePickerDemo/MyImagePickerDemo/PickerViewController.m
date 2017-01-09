//
//  PickerViewController.m
//  MyImagePickerDemo
//
//  Created by Lee Bennett on 11/9/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import "PickerViewController.h"

static NSUInteger const kFirstNameIndex = 0;
static NSUInteger const kLastNameIndex = 1;


@interface PickerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *namePicker;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, strong) NSArray *firstNames;
@property (nonatomic, strong) NSArray *lastNames;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstNames = @[ @"Professor", @"Mr.", @"Mrs.", @"Captain" ];
    self.lastNames = @[ @"Sprinkles", @"Fluffly", @"Scrappy", @"Scooby" ];
    
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == kFirstNameIndex){
        return self.firstNames.count;
    } else if (component == kLastNameIndex){
        return self.lastNames.count;
    } else{
        return 0;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == kFirstNameIndex){
        NSString *firstName = self.firstNames[row];
        return firstName;
    } else if (component == kLastNameIndex){
        NSString *lastName = self.lastNames[row];
        return lastName;
    } else{
        return nil;
    }

}


- (IBAction)selectNameDidPressed:(UIButton *)sender {
    
    NSUInteger selectedFirstNameIndex = [self.namePicker selectedRowInComponent:kFirstNameIndex];
    NSUInteger selectedLastNameIndex = [self.namePicker selectedRowInComponent:kLastNameIndex];
    
    NSString *firstName = self.firstNames[selectedFirstNameIndex];
    NSString *lastName = self.lastNames[selectedLastNameIndex];
    
    NSLog(@"%@ %@", firstName, lastName);
    
}

- (IBAction)selectDateDidPressed:(UIButton *)sender {
    
    NSDate *selectedDate = self.datePicker.date;
    
    NSLog(@"The selected date is %@", selectedDate);
    
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
