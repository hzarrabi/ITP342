//
//  ViewController.h
//  Demo
//
//  Created by Lee Bennett on 9/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// IBOutlet is a special property that points to an object created in interface builder. For outlets properties, always use the properties weak (weak reference for memory management) and nonatomic (non-thread safe)
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;


@end

