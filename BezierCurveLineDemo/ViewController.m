//
//  ViewController.m
//  BezierCurveLineDemo
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

#define kScreenWidth self.view.frame.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getUI];
    
}

- (void)getUI{
    
    UIButton *drawLineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    drawLineBtn.frame = CGRectMake(kScreenWidth / 2.0 - 50, 200, 100, 30);
    drawLineBtn.tag = 100;
    [drawLineBtn setTitle:@"折线图" forState:UIControlStateNormal];
    [drawLineBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [drawLineBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:drawLineBtn];
    
    UIButton *drawBaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    drawBaseBtn.frame = CGRectMake(kScreenWidth / 2.0 - 50, 280, 100, 30);
    drawBaseBtn.tag = 101;
    [drawBaseBtn setTitle:@"柱状图" forState:UIControlStateNormal];
    [drawBaseBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [drawBaseBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:drawBaseBtn];
    
    
    UIButton *drawPieBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    drawPieBtn.frame = CGRectMake(kScreenWidth / 2.0 - 50, 360, 100, 30);
    drawPieBtn.tag = 102;
    [drawPieBtn setTitle:@"饼状图" forState:UIControlStateNormal];
    [drawPieBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [drawPieBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:drawPieBtn];
    
}

- (void)clickAction: (UIButton *)button{
    NSLog(@"%ld", button.tag);
    
    DetailViewController *VC = [[DetailViewController alloc] initWithType:button.tag];
    [self presentViewController:VC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
