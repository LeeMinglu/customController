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

//
//- (void)switchVc:(int)index
//{
//    UIViewController *newVc = self.childViewControllers[index];
//    // 如果index对应的子控制器正在显示,就直接返回
//    if (newVc == self.showingVc) return;
//    
//    // 设置新控制器 view 的 frame
//    CGRect newFrame = self.contentView.bounds;
//    newFrame.origin.x = self.contentView.frame.size.width;
//    newVc.view.frame = newFrame;
//    [self.contentView addSubview:newVc.view];
//    
//    // 动画
//    [UIView animateWithDuration:0.5 animations:^{
//        CGRect oldFrame = self.showingVc.view.frame;
//        oldFrame.origin.x = - self.view.frame.size.width;
//        self.showingVc.view.frame = oldFrame;
//        
//        newVc.view.frame = self.contentView.bounds;
//    }completion:^(BOOL finished) {
//        [self.showingVc.view removeFromSuperview];
//        self.showingVc = newVc;
//    }];
//}
//

- (void)switchVc:(int)index {
    
    //添加新的控制器
    UIViewController *newVc = self.childViewControllers[index];
    
    if (newVc == self.showingVc) return;
    
    CGRect frame = self.contentView.bounds;
    frame.origin.x = self.contentView.frame.size.width;
    newVc.view.frame = frame;
    [self.contentView addSubview:newVc.view];
    
    //执行动画
    [UIView animateWithDuration:2.0 animations:^{
        CGRect oldFrame = self.showingVc.view.frame;
        oldFrame.origin.x = -self.view.frame.size.width;
        self.showingVc.view.frame = oldFrame;
        
        newVc.view.frame = self.contentView.bounds;
    } completion:^(BOOL finished) {
        [self.showingVc.view removeFromSuperview];
        self.showingVc = newVc;
        
    }];
    
    
    
}




- (void)switchVc2:(int)index {
   
    //添加新的控制器
    UIViewController *newVc = self.childViewControllers[index];
    
    if (newVc == self.showingVc) return;
    
    //移除原来的视图
    [self.showingVc.view removeFromSuperview];
    newVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:newVc.view];
    
    NSUInteger newIndex = index;
    NSUInteger oldIndex = [self.childViewControllers indexOfObject:self.showingVc];
    self.showingVc = newVc;

    NSLog(@"new:%td, old:%td",newIndex, oldIndex);
    
    //如果
    if (oldIndex == NSNotFound) return;
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    if (newIndex > oldIndex) {
        animation.subtype = kCATransitionFromRight;
    } else{
        animation.subtype = kCATransitionFromLeft;
    }
    
    animation.duration =2.0;
    [self.contentView.layer addAnimation:animation forKey:nil];

    
}


@end
