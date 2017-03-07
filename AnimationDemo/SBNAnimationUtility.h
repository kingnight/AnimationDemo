//
//  SBNAnimation.h
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SBNAnimationDirectionPostive = 1,
    SBNAnimationDirectionNegative = -1,
} SBNAnimationDirection;

@interface SBNAnimationUtility : NSObject

+ (void)fadeImageView:(UIImageView *)imageView toImage:(UIImage *)toImage duration:(NSTimeInterval)duration;

+ (void)cubeTransitonWithLabel:(UILabel *)label text:(NSString *)text direction:(SBNAnimationDirection)direction duration:(NSTimeInterval)duration;


@end
