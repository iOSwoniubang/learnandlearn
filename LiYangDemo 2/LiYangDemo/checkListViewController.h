//
//  checkListViewController.h
//  LiYangDemo
//
//  Created by 李亮 on 2018/5/7.
//  Copyright © 2018年 zztzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface checkListViewController : UIViewController

@property (assign, nonatomic) int num;

@property (weak, nonatomic) IBOutlet UILabel *listName;
@property (weak, nonatomic) IBOutlet UITextField *param1;
@property (weak, nonatomic) IBOutlet UITextField *param2;
- (IBAction)checkList:(id)sender;

@end
