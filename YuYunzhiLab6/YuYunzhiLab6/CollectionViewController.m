//
//  CollectionViewController.m
//  YuYunzhiLab6
//
//  Created by Yunzhi Yu on 11/22/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "CollectionViewController.h"
#import "PlacesModel.h"
#import "CollectionViewCell.h"
#import "WebDetailViewController.h"

@interface CollectionViewController ()
@property(strong, nonatomic) PlacesModel* MyModel;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.MyModel = [PlacesModel sharedModel];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
        //    if([segue.identifier isEqualToString:@"Place"])
    //    {
    
    NSArray* indexPaths = [self.collectionView indexPathsForSelectedItems];
    WebDetailViewController* DetailView= segue.destinationViewController;
    NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
    DetailView.MyDictionary = [[self.MyModel getArray] objectAtIndex:(unsigned long)indexPath.row];
    [DetailView loadWeb];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

   return [self.MyModel getNumber];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlaceCell" forIndexPath:indexPath];
    NSDictionary* mDictionary = [[self.MyModel getArray] objectAtIndex:(indexPath.row)];
    [cell SetContent: mDictionary];
    cell.placeName.text = [mDictionary objectForKey:@"name"];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark - Rotation

-(void) willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*) [self.collectionView collectionViewLayout];
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if(orientation == UIInterfaceOrientationPortrait)
    {
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }else{
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}


@end
