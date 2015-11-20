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

@property (nonatomic, weak) UIViewController *showingVc;

- (IBAction)clickOneButton:(id)sender;

- (IBAction)clickTwoButton:(id)sender;

- (IBAction)clickThreeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation MLMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MLOneViewController *one = [[MLOneViewController alloc] init];
    MLTwoViewController *two = [[MLTwoViewController alloc] init];
    MLThreeViewController *three = [[MLThreeViewController alloc] init];
    [self addChildViewController:one];
    [self addChildViewController:two];
    [self addChildViewController:three];
}



- (IBAction)clickOneButton:(id)sender {
    NSLog(@"点击了第一个");
    [self switchVc:0];
    
}

- (IBAction)clickTwoButton:(id)sender {
    NSLog(@"点击了第二个");
    [self switchVc:1];
    
}

- (IBAction)clickThreeButton:(id)sender {
    NSLog(@"点击了第三个");
    [self switchVc:2];
}

- (void)switchVc:(int)index {
   
    //移除原来的视图
    [self.showingVc.view removeFromSuperview];
    
    //添加新的控制器
    UIViewController *newVc = self.childViewControllers[index];
    newVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:newVc.view];
    
    self.showingVc = newVc;
    
    
    CATransition *animation = [CATransition animation];
    animation.type = @"moveIn";
    animation.subtype = kCATransitionFromLeft;
    
    animation.duration =2.0;
    [self.contentView.layer addAnimation:animation forKey:nil];

    
}


- (CGRect)getFrame {
    return CGRectMake(0, MLHEIGHT, self.view.frame.size.width, self.view.frame.size.height - MLHEIGHT);
}


@end
