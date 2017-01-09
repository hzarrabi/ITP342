//
//  BeautifulViewController.m
//  CollectionViewDemo
//
//  Created by Lee Bennett on 11/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import "BeautifulViewController.h"
#import "CompanyCell.h"

@interface BeautifulViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *companyNames;


@end

@implementation BeautifulViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.companyNames = @[ @"Nike", @"Adidas", @"Apple", @"Amazon", @"Blizzard"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.companyNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // Dequeue / reuse the cell
    CompanyCell * cell = (CompanyCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CompanyCell" forIndexPath:indexPath];
    
    // Get the data at a given index path
    NSString *companyName = self.companyNames[indexPath.row];
    
    // Modify the cell with the data
    cell.position = (int)indexPath.row;
    cell.companyName.text = companyName;
    
    
    // 0 - 255
    // Normalized value from: 0 - 1
        
    //cell.backgroundColor = [UIColor colorWithRed:(CGFloat)arc4random_uniform(255)/255.0 green:(CGFloat)arc4random_uniform(255)/255.0 blue:(CGFloat)arc4random_uniform(255)/255.0 alpha:1.0f];
    
    // Return the cell you created
    return cell;
}


@end










