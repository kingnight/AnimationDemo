//
//  SBNAnimation.m
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import "SBNAnimationUtility.h"

@implementation SBNAnimationUtility


+ (void)fadeImageView:(UIImageView *)imageView toImage:(UIImage *)toImage duration:(NSTimeInterval)duration{
    [UIView transitionWithView:imageView duration:duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        imageView.image = toImage;
    } completion:nil];
}

+ (void)cubeTransitonWithLabel:(UILabel *)label text:(NSString *)text direction:(SBNAnimationDirection)direction duration:(NSTimeInterval)duration{
    UILabel *auxLabel = [[UILabel alloc]initWithFrame:label.frame];
    auxLabel.text = text;
    auxLabel.font = label.font;
    auxLabel.textAlignment = label.textAlignment;
    auxLabel.textColor = label.textColor;
    auxLabel.backgroundColor = label.backgroundColor;
    
    CGFloat auxLabelOffset = direction * label.frame.size.height/2.0;
    
    auxLabel.transform = CGAffineTransformConcat(CGAffineTransformScale(auxLabel.transform, 1.0, 0.1), CGAffineTransformTranslate(auxLabel.transform, 0.0, auxLabelOffset));
    if (label.superview) {
        [label.superview addSubview:auxLabel];
    }
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        auxLabel.transform = CGAffineTransformIdentity;
        label.transform = CGAffineTransformConcat(CGAffineTransformScale(label.transform, 1.0, 0.1), CGAffineTransformTranslate(label.transform, 0.0, -auxLabelOffset));
    } completion:^(BOOL finished) {
        label.text = auxLabel.text;
        label.transform = CGAffineTransformIdentity;
        
        [auxLabel removeFromSuperview];
    }];
}

@end
