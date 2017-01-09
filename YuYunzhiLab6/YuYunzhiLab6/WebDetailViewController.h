//
//  WebDetailViewController.h
//  YuYunzhiLab6
//
//  Created by Yunzhi Yu on 11/22/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebDetailViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) NSDictionary* MyDictionary;
- (void) loadWeb;


@end
