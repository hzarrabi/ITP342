//
//  CompanyCell.h
//  CollectionViewDemo
//
//  Created by Lee Bennett on 11/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyCell : UICollectionViewCell

@property int position;

@property (weak, nonatomic) IBOutlet UIImageView *companyLogo;
@property (weak, nonatomic) IBOutlet UILabel *companyName;

@end
