//
//  ViewController.h
//  LiYangDemo
//
//  Created by 李亮 on 2018/5/7.
//  Copyright © 2018年 zztzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)loginIn:(id)sender;

@end

