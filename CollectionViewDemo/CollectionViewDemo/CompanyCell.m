//
//  CompanyCell.m
//  CollectionViewDemo
//
//  Created by Lee Bennett on 11/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import "CompanyCell.h"

@implementation CompanyCell

- (IBAction)switchDidPressed:(UISwitch *)sender {
    NSLog(@"switch pressed at position %i", self.position);
}

@end
