//
//  ViewController.m
//  LZCycleScrollView
//
//  Created by bhqm on 2017/11/4.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "ViewController.h"
#import "CycleScrollVC.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";

    
}



- (IBAction)buttonAction:(UIButton *)sender {
    // tag 1 ~ 5 网络图片 本地图片 带标题网络图片 带标题本地图片 纯文字上下轮播
    NSInteger tag = sender.tag;
    CycleScrollVC *cyleScro = [[CycleScrollVC alloc] init];
    cyleScro.btnTag = tag;
    [self.navigationController pushViewController:cyleScro animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
