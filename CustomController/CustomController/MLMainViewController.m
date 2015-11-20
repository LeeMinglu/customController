//
//  MLMainViewController.m
//  CustomController
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLMainViewController.h"

@interface MLMainViewController ()
- (IBAction)clickOneButton:(id)sender;

- (IBAction)clickTwoButton:(id)sender;

- (IBAction)clickThreeButton:(id)sender;

@end

@implementation MLMainViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)clickOneButton:(id)sender {
    
    NSLog(@"点击了第一个");
    
}

- (IBAction)clickTwoButton:(id)sender {
    NSLog(@"点击了第二个");
}

- (IBAction)clickThreeButton:(id)sender {
    NSLog(@"点击了第三个");
}
@end
