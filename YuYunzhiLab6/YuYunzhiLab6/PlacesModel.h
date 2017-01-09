//
//  PlacesModel.h
//  YuYunzhiLab6
//
//  Created by Yunzhi Yu on 11/22/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlacesModel : NSObject
+(instancetype) sharedModel;
-(NSUInteger) getNumber;
-(NSMutableArray*) getArray;
-(NSString*) getPlaceOfIndex : (NSUInteger) index;

@end
