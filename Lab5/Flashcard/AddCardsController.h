//
//  AddCardsController.h
//  Flashcard
//
//  Created by Yunzhi Yu on 11/6/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletionHandler)(NSString *question, NSString *answer);
typedef void(^OnCancel)();

@interface AddCardsController : UIViewController


@property (copy, nonatomic) CompletionHandler completionHandler;
@property (copy, nonatomic) OnCancel onCancelHandler;



@end
