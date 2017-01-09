//
//  WebDetailViewController.m
//  YuYunzhiLab6
//
//  Created by Yunzhi Yu on 11/22/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "WebDetailViewController.h"

@interface WebDetailViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *MyTitle;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWeb];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWeb{
    [self.MyTitle setTitle:[self.MyDictionary valueForKey:@"name"]];
    NSURL* WebURL = [[NSURL alloc] initWithString:[self.MyDictionary valueForKey: @"website"]];
    NSURL* request = [[NSURLRequest alloc] initWithURL:WebURL];
    [self.webView loadRequest:request];
    [self.activityIndicator startAnimating];
    self.webView.hidden = YES;
}

#pragma mark - Detail View Data Controller
- (void) webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView{
    self.webView.hidden = NO;
    [self.activityIndicator stopAnimating];
}

- (void) webView: (UIWebView *) webView didFailLoadWithError:(nonnull NSError *)error{
    [self.activityIndicator stopAnimating];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
