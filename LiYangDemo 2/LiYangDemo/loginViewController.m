//
//  ViewController.m
//  LiYangDemo
//
//  Created by 李亮 on 2018/5/7.
//  Copyright © 2018年 zztzt. All rights reserved.
//

#import "loginViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "BaoBiaoTableViewController.h"

@interface loginViewController ()

@property (nonatomic , strong) NSURLConnection *connentGet;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginIn:(id)sender {
    if ([self.userName.text isEqualToString:@""]||[self.password.text isEqualToString:@""]) {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"用户名或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [warning addAction:action1];
        [self presentViewController:warning animated:YES completion:nil];
        return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"http://39.106.201.134/web/check.php?username=%@&password=%@",self.userName.text,[self sha1:self.password.text]];
    NSURL * url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    
    //异步请求有两种方式；一种是使用代理，一种是使用block
    //使用代理方式进行异步请求
    self.connentGet = [NSURLConnection connectionWithRequest:request delegate:self];
    
    //使用block
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSString *num = [str substringWithRange:NSMakeRange(9, 1)];
        
        NSLog(@"%@",num);
        
        if ([num integerValue] != 0) {
            [self getErrorMessage:[num intValue]];
        }else
        {
            BaoBiaoTableViewController *bao = [[BaoBiaoTableViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:bao];
            bao.title = @"报表查询列表";
            [self presentViewController:nav animated:YES completion:nil];
        }
    }];
}

-(void)getErrorMessage:(int)errorNum
{
    NSString *errMsg;
    switch (errorNum) {
        case 1:
            errMsg = @"参数缺失";
            break;
        case 2:
            errMsg = @"参数格式错误(用户名和密码只能包含数字和英文)";
            break;
        case 3:
            errMsg = @"用户名不存在";
            break;
        case 4:
            errMsg = @"用户名存在,密码输入错误";
            break;
        default:
            errMsg = [NSString stringWithFormat:@"未知错误(%d)",errorNum] ;
            break;
    }
    UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:errMsg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [warning addAction:action1];
    [self presentViewController:warning animated:YES completion:nil];
}


- (NSString *) sha1:(NSString *)inputStr {
    
    const char *cstr = [inputStr cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [NSData dataWithBytes:cstr length:inputStr.length];

    uint8_t digest[CC_SHA1_DIGEST_LENGTH];

    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *outputStr = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [outputStr appendFormat:@"%02x", digest[i]];
    }
    return outputStr;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
}

@end
