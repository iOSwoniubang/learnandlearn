//
//  BaoBiaoTableViewController.m
//  LiYangDemo
//
//  Created by 李亮 on 2018/5/7.
//  Copyright © 2018年 zztzt. All rights reserved.
//

#import "BaoBiaoTableViewController.h"
#import "checkListViewController.h"
#import "ListWebViewController.h"

@implementation BaoBiaoTableViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.baobiaoBtn1.tag=1;
    self.baobiaoBtn2.tag=2;
    self.baobiaoBtn3.tag=3;
    self.baobiaoBtn4.tag=4;
    
    [self.baobiaoBtn1 addTarget:self action:@selector(getToNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.baobiaoBtn2 addTarget:self action:@selector(getToNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.baobiaoBtn3 addTarget:self action:@selector(getToNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.baobiaoBtn4 addTarget:self action:@selector(getToNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.baobiaoBtn5 addTarget:self action:@selector(getToNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.baobiaoBtn6 addTarget:self action:@selector(getToNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.baobiaoBtn7 addTarget:self action:@selector(getToNextVC:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)getToNextVC:(UIButton *)sender
{
//    checkListViewController *check = [[checkListViewController alloc]init];
//    check.num = (int)sender.tag;
    ListWebViewController *check = [[ListWebViewController alloc]init];
    check.num = (int)sender.tag;
    
    
    switch (check.num) {
        case 1:
            check.strUrl = [NSString stringWithFormat:@"http://116.62.61.205/CRMRequestQuery2.php?status=0"];
            
            [self.navigationController pushViewController:check animated:YES];
            break;
        case 2:
            check.strUrl = [NSString stringWithFormat:@"http://116.62.61.205/CRMReturnQuery2.php?status=0"];
            
            [self.navigationController pushViewController:check animated:YES];
            break;
        case 3:
            check.strUrl = [NSString stringWithFormat:@"http://116.62.61.205/CRMRequestQuery2.php?status=1"];
            
            [self.navigationController pushViewController:check animated:YES];
            break;
        case 4:
            check.strUrl = [NSString stringWithFormat:@"http://116.62.61.205/CRMRequestQuery2.php?status=1"];
            
            [self.navigationController pushViewController:check animated:YES];
            break;
        case 5:
            check.strUrl = [NSString stringWithFormat:@"http://116.62.61.205/CRMRequestQuery2.php?status=3"];
            
            [self.navigationController pushViewController:check animated:YES];
            break;
        case 6:
            check.strUrl = [NSString stringWithFormat:@"http://116.62.61.205/CRMReturnQuery2.php?status=1"];
            
            [self.navigationController pushViewController:check animated:YES];
            break;
            
        default:
            check.strUrl = [NSString stringWithFormat:@"http://116.62.61.205/CRMReturnQuery2.php?status=3"];
            
            [self.navigationController pushViewController:check animated:YES];
            break;
    }
//    check.strUrl = [NSString stringWithFormat:@"http://39.106.201.134/web/phoneEndProductsRlowform.php"];
//    [self.navigationController pushViewController:check animated:YES];
}

- (IBAction)quit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
    @end
