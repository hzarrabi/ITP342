//
//  ViewController.m
//  TipSplit
//
//  Created by Yunzhi Yu on 9/26/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// viewFirst
@property (weak, nonatomic) IBOutlet UITextField *billAmountTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TaxSegControl;

@property (weak, nonatomic) IBOutlet UISwitch *taxIncludeSwitch;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipSliderLabel;
@property (weak, nonatomic) IBOutlet UIStepper *personStepper;
@property (weak, nonatomic) IBOutlet UILabel *personStepperLabel;

// viewSecond
@property (weak, nonatomic) IBOutlet UILabel *taxLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalForTip;
@property (weak, nonatomic) IBOutlet UILabel *totalWithTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalSplitLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property float bill;
@property float taxPercent, tax;
@property float tipPercent, tipTotal, tipValue;
@property float totalWithTip, totalSplit;
@property int splitNum;
@property BOOL includeTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setDefaultValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Default setting
-(void) setDefaultValues{
    _billAmountTF.text = @"";
    self.tipSliderLabel.text = @"20%";
    self.personStepperLabel.text = @"1";
    _taxLabel.text = @"0.00";
    _totalForTip.text = @"0.00";
    _tipLabel.text = @"0.00";
    _totalWithTipLabel.text = @"0.00";
    _totalSplitLabel.text = @"0.00";
    
    _bill = 0.0;
    _tax = 7.5;
    _taxPercent = 7.5;
    _tipPercent = 20; _tipTotal = 0.0; _tipValue = 0.0;
    _totalWithTip = 0.0; _totalSplit = 0.0;
    _splitNum = 1; _includeTax = YES;
}

// Update values
- (void)updateValues
{
    // update Tax
    _tax = _bill * _taxPercent / 100;
    _taxLabel.text = [NSString stringWithFormat:@"%.2f", _tax];
    
    // update Total for tip
    if( _includeTax ){
        _tipTotal = _bill + _tax;
    }
    else {
        _tipTotal = _bill;
    }
    _totalForTip.text = [NSString stringWithFormat:@"%.2f", _tipTotal];
    
    // update Tip
    _tipValue = _tipTotal * _tipPercent / 100;
    _tipLabel.text = [NSString stringWithFormat:@"%.2f", _tipValue];
    
    // update Total with tip
    _totalWithTip = _bill + _tipValue;
    if( _includeTax ){
        _totalWithTip += _tax;
    }
    _totalWithTipLabel.text = [NSString stringWithFormat:@"%.2f", _totalWithTip];
    
    // update Total per person
    _totalSplit = _totalWithTip / _splitNum;
    _totalSplitLabel.text = [NSString stringWithFormat:@"%.2f", _totalSplit];
}

- (IBAction)billAmountChanged:(id)sender
{       // the bill amount (textField) changed
    _bill = _billAmountTF.text.floatValue;
    [self updateValues];
}
- (IBAction)taxPercentChanged:(id)sender
{       // tax percent changed
    NSInteger segment = _TaxSegControl.selectedSegmentIndex;
    if( segment == 0 ){
        _taxPercent = 7.5;
    }
    else if( segment == 1){
        _taxPercent = 8.0;
    }
    else if( segment == 2){
        _taxPercent = 8.5;
    }
    else if( segment == 3){
        _taxPercent = 9.0;
    }
    else if( segment == 4){
        _taxPercent = 9.5;
    }
    [self updateValues];
}
- (IBAction)switchChanged:(UISwitch *)sender {
    UISwitch *mSwitch = (UISwitch *)sender;
    if ([mSwitch isOn]) {
        _includeTax = YES;
    }
    else {
        _includeTax = NO;
    }
    [self updateValues];
}
- (IBAction)tipSliderChanged:(UISlider *)sender {
    UISlider *slider = (UISlider *)sender;
    int numberAsInt = (int) (slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d %%", numberAsInt];
    self.tipSliderLabel.text = newText;
    _tipPercent = numberAsInt;
    [self updateValues];
}

-(void)ClearAllValues{
    [self setDefaultValues];
    [_TaxSegControl setSelectedSegmentIndex:0];
    [_taxIncludeSwitch setOn:YES animated:YES];
    [_tipSlider setValue:20 animated:YES];
    [_personStepper setValue:1];
}

- (IBAction)splitChanged:(UIStepper *)sender {
    // update personStepperLabel to increase or decrease value
    UIStepper *stepper = (UIStepper *) sender;
    _splitNum = (int) stepper.value;
    NSString *numPerson = [[NSString alloc] initWithFormat:@"%d", _splitNum];
    self.personStepperLabel.text = numPerson;
    [self updateValues];
}
- (IBAction)clearAllAlert:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Clear All Values" message:@"Are you sure you want to clear all values?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Canel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"cancel button is pressed");
    }];
    
    UIAlertAction *ClearAllAction = [UIAlertAction actionWithTitle:@"Clear All" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        [self ClearAllValues];
        NSLog(@"Clear All button is pressed");
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:ClearAllAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)BackGroundTouch:(id)sender {
        
    [self.billAmountTF resignFirstResponder];
    [self updateValues];
}
- (IBAction)BGT:(id)sender {
    [self.billAmountTF resignFirstResponder];
    [self updateValues];
}

@end
