//
//  SBNGifBox.h
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBNGifBox : UIView

- (instancetype)initWithFrame:(CGRect)frame;

- (void)startAnimationWithCompleteBlock:(void (^)())completeBlock;

@end
