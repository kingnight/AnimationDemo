//
//  ViewController.m
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import "ViewController.h"
#import "SBNAnimationUtility.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cubeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(UIButton *)sender {
    [SBNAnimationUtility cubeTransitonWithLabel:_cubeLabel text:@"Shanghai" direction:SBNAnimationDirectionPostive duration:1.0];
    
    [SBNAnimationUtility fadeImageView:_bgImageView toImage:[UIImage imageNamed:@"bg-sunny"] duration:1.0];
}

@end
