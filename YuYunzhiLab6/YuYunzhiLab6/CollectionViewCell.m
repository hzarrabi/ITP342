//
//  CollectionViewCell.m
//  YuYunzhiLab6
//
//  Created by Yunzhi Yu on 11/22/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(void) SetContent : (NSDictionary*) dictionary
{
    self.MyDictionary = dictionary;
    NSString* imageFileName = [dictionary valueForKey: @"image"];
    self.placeLogo.image = [UIImage imageNamed:imageFileName];
}

@end
