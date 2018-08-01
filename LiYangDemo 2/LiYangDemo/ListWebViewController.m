//
//  ListWebViewController.m
//  LiYangDemo
//
//  Created by 李亮 on 2018/5/7.
//  Copyright © 2018年 zztzt. All rights reserved.
//

#import "ListWebViewController.h"

@interface ListWebViewController ()

@end

@implementation ListWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = [UIScreen mainScreen].bounds;
    rect.origin.y += 44;
    rect.size.height -= 44;
    UIWebView *webview = [[UIWebView alloc]initWithFrame:rect];
    NSURL *url = [NSURL URLWithString:self.strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webview loadRequest: request];
    [self.view addSubview:webview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
