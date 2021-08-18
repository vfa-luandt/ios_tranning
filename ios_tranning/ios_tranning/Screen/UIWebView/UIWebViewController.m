//
//  UIWebViewController.m
//  ios_tranning
//
//  Created by Vitalify on 8/18/21.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()

@end

@implementation UIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIWebView *webView = [[UIWebView alloc]init];
    NSString *urlString = @"https://www.chatwork.com/#!rid218463538";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webViewSample loadRequest:urlRequest];
    [self.view addSubview:self.webViewSample];
    
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
