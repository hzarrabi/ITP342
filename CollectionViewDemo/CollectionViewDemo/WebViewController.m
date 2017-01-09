//
//  WebViewController.m
//  CollectionViewDemo
//
//  Created by Lee Bennett on 11/7/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    NSString *pathToPdf = [[NSBundle mainBundle] pathForResource:@"ITP342_Gestures" ofType:@"pdf"];
//    NSData *pdfData = [[NSData alloc] initWithContentsOfFile:pathToPdf];
//    [self.webView loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:nil];
//    
//    [self.spinner startAnimating];
//    self.webView.hidden = YES;
    
    NSURL *appleUrl = [[NSURL alloc] initWithString:@"https://www.apple.com"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:appleUrl];
    
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"webViewDidFinishLoad");
    
    self.webView.hidden = NO;
    [self.spinner stopAnimating];
    
}

@end















