//
//  MLMainViewController.m
//  CustomController
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLMainViewController.h"
#import "MLOneViewController.h"
#import "MLTwoViewController.h"
#import "MLThreeViewController.h"
#define MLHEIGHT 44

@interface MLMainViewController ()

@property (nonatomic, strong) MLOneViewController *one;
@property (nonatomic, strong) MLTwoViewController *two;
@property (nonatomic, strong) MLThreeViewController *three;

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
    [self.two.view removeFromSuperview];
    [self.three.view removeFromSuperview];

    [self.view addSubview:self.one.view];
    
}

- (IBAction)clickTwoButton:(id)sender {
    NSLog(@"点击了第二个");
    [self.one.view removeFromSuperview];
    [self.three.view removeFromSuperview];
    [self.view addSubview:self.two.view];
    
}

- (IBAction)clickThreeButton:(id)sender {
    NSLog(@"点击了第三个");
    [self.two.view removeFromSuperview];
    [self.one.view removeFromSuperview];
    [self.view addSubview:self.three.view];
}





#pragma mark - 控制器懒加载

- (MLOneViewController *)one {
    if (!_one) {
        _one = [[MLOneViewController alloc] init];
        _one.view.frame = self.getFrame;
    }
    return _one;
}

- (MLTwoViewController *)two {
    if (!_two) {
        _two = [[MLTwoViewController alloc] init];
        _two.view.frame = self.getFrame;
    }
    return _two;
}

- (MLThreeViewController *)three {
    if (!_three) {
        _three = [[MLThreeViewController alloc] init];
        _three.view.frame = self.getFrame;
    }
    return _three;
}


- (CGRect)getFrame {
    return CGRectMake(0, MLHEIGHT, self.view.frame.size.width, self.view.frame.size.height - MLHEIGHT);
}

@end
