//
//  ViewController.m
//  MyImagePickerDemo
//
//  Created by Lee Bennett on 11/9/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    self.imageView.image = originalImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - IBActions

- (IBAction)displayImagePickerController:(UIButton *)sender {

    // 1. Create and present UIImagePickerController modally
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:ipc animated:YES completion:nil];
    
    
}



@end










