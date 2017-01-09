//
//  CollectionViewCell.h
//  YuYunzhiLab6
//
//  Created by Yunzhi Yu on 11/22/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property(weak, nonatomic) NSDictionary* MyDictionary;
@property (weak, nonatomic) IBOutlet UIImageView *placeLogo;
@property (weak, nonatomic) IBOutlet UILabel *placeName;
-(void) SetContent : (NSDictionary*) dictionary;


@end
