//
//  ViewController.m
//  SlideshowApp
//
//  Created by 松下泰久 on 2015/12/06.
//  Copyright © 2015年 yasuhisa.matsushita. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//デフォルトでは{}がない
{
    UIImageView *imageView;
    NSInteger countNumber;
    CGSize windowSize;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupBackground];
    [self setupButton];
}

-(void) setupBackground {
    windowSize = [UIScreen mainScreen].bounds.size;
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, windowSize.width, windowSize.height)];
    imageView.image = [UIImage imageNamed:@"image0.png"];
    [self.view addSubview:imageView];
}

-(void) setupButton {
    //進むボタンを配置
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeCustom];
    goButton.frame = CGRectMake(0, 0, 70, 30);
    goButton.center = CGPointMake(230,420);
    [goButton setImage:[UIImage imageNamed:@"go.png"] forState:UIControlStateNormal];
    [goButton setImage:[UIImage imageNamed:@"go_on.png"] forState:UIControlStateHighlighted];
    //進むメソッドの呼び出し
    [goButton addTarget:self action:@selector(go_function:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goButton];

    //戻るボタンを配置
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(200, 0, 70, 30);
    backButton.center = CGPointMake(90,420);
    [backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"back_on.png"] forState:UIControlStateHighlighted];
    //戻るメソッドの呼び出し
    [backButton addTarget:self action:@selector(back_function:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

//UIに特化したソフトsketch
//ボタンの操作
-(void) go_function:(id)sender {
    countNumber++;
    if (countNumber > 3){
        countNumber = 0;
    }
    [self changeImage];
}

-(void) back_function:(id)sender{
    countNumber--;
    if (countNumber < 0) {
        countNumber = 3;
    }
    [self changeImage];
}

-(void) changeImage {
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%ld.png", (long)countNumber]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
