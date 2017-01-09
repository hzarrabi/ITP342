//
//  PlacesModel.m
//  YuYunzhiLab6
//
//  Created by Yunzhi Yu on 11/22/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "PlacesModel.h"

@interface PlacesModel()
@property (strong, nonatomic) NSMutableArray* places;
@end

@implementation PlacesModel

-(instancetype)initPlacesModel
{
    self = [super init];
    if(self){
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Places" ofType:@"plist"];
        _places = [[NSMutableArray alloc] initWithContentsOfFile:path];

    }
    return self;
}

+(instancetype) sharedModel
{
    static PlacesModel* _sharedModel = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedModel = [[self alloc] initPlacesModel];
    });
    return _sharedModel;
}

-(NSUInteger) getNumber
{
    return [self.places count];
}

- (NSMutableArray*) getArray{
    return self.places;
}

- (NSString*) getPlaceOfIndex:(NSUInteger)index
{
    return [self.places objectAtIndex:index];
}


@end
