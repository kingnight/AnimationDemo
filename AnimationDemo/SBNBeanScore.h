//
//  SBNBeanScore.h
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBNBeanScore : UIView

- (instancetype)initWithFrame:(CGRect)frame score:(NSUInteger)score;

- (void)startAnimationWithCompleteBlock:(void (^)())completeBlock;

@end
