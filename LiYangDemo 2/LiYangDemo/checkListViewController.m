//
//  checkListViewController.m
//  LiYangDemo
//
//  Created by 李亮 on 2018/5/7.
//  Copyright © 2018年 zztzt. All rights reserved.
//

#import "checkListViewController.h"
#import "ListWebViewController.h"

@implementation checkListViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.listName.text = [NSString stringWithFormat:@"报表%d",self.num];
    
}


- (IBAction)checkList:(id)sender {
    NSString * urlStr = [NSString stringWithFormat:@"http://39.106.201.134/web/phoneEndProductsRlowform.php"];
    ListWebViewController *webview = [[ListWebViewController alloc]init];
    webview.strUrl = urlStr;
    [self.navigationController pushViewController:webview animated:YES];
}
@end
