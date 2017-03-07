//
//  BoxViewController.m
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import "BoxViewController.h"
#import "SBNGifBox.h"
#import "SBNBeanScore.h"

@interface BoxViewController ()
{
    SBNGifBox *boxView;
    SBNBeanScore *scoreView;
}
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@end

@implementation BoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor blackColor];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 竞猜页面首次进入动画

 @param fullScreenView 全屏View
 @param score 豆数
 */
- (void)betFirstEntranceAniamtion:(UIView *)fullScreenView score:(NSUInteger)score{
    //step1:show mask
    UIView *mask = [[UIView alloc]initWithFrame:fullScreenView.frame];
    mask.backgroundColor = [UIColor blackColor];
    [fullScreenView addSubview:mask];
    
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        mask.alpha = 0.6;
    } completion:^(BOOL finished) {
        //step2:boxView animation
        CGFloat scorePosX = fullScreenView.frame.size.width-80;
        CGFloat scorePosY =  500;
        boxView = [[SBNGifBox alloc]initWithFrame:CGRectMake(50, 50, 0, 0)];
        [fullScreenView addSubview:boxView];
        scoreView = [[SBNBeanScore alloc]initWithFrame:CGRectMake(scorePosX, scorePosY, 80, 30) score:score];
        [boxView startAnimationWithCompleteBlock:^{
            //step2 :boxView move
            [UIView  animateWithDuration:1.18 delay:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                boxView.transform = CGAffineTransformConcat(CGAffineTransformScale(boxView.transform, 0.16, 0.16), CGAffineTransformTranslate(boxView.transform, scoreView.frame.origin.x-boxView.frame.origin.x, scoreView.frame.origin.y-boxView.frame.origin.y));
            } completion:^(BOOL finished) {
                //step3: transition boxView->socre
                [UIView transitionFromView:boxView toView:scoreView duration:0.2 options:UIViewAnimationOptionCurveEaseInOut completion:^(BOOL finished) {
                    [scoreView startAnimationWithCompleteBlock:^{
                        //step4:
                        [UIView animateWithDuration:0.4 animations:^{
                            mask.alpha =1.0;
                        } completion:^(BOOL finished) {
                            [mask removeFromSuperview];
                        }];
                    }];
                }];
            }];
            
        }];
    }];
}

- (IBAction)clickme:(id)sender {
    [self betFirstEntranceAniamtion:self.bgImageView score:100];
}

- (IBAction)showLog:(id)sender {
    NSLog(@"nslog");
}


@end
