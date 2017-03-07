//
//  SBNBeanScore.m
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import "SBNBeanScore.h"

@interface SBNBeanScore ()

@property (nonatomic,strong) UIImageView *bean;
@property (nonatomic,strong) UIImageView *Bg;

@property (nonatomic,assign) NSUInteger width;
@property (nonatomic,assign) NSUInteger height;

@end


@implementation SBNBeanScore

- (instancetype)initWithFrame:(CGRect)frame score:(NSUInteger)score{
    _width  = frame.size.width;
    _height = frame.size.height;
    
    self = [super initWithFrame:frame];
    if (self) {
        _Bg = [self createImageView:@"bet_img_float" frame:CGRectMake(_width,0,_width,_height)];
        [self addSubview:_Bg];
        
        _bean = [self createImageView:@"bean" frame:CGRectMake((_width-41)/2-8, (_height-20)/2+5, 41, 20)];
        [self addSubview:_bean];
    }
    return self;
}

- (void)startAnimationWithCompleteBlock:(void (^)())completeBlock{
    
    [UIView animateKeyframesWithDuration:1.4 delay:0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            self.bean.transform = CGAffineTransformScale(self.bean.transform, 1.21, 1.21);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.2 animations:^{
            self.bean.transform = CGAffineTransformScale(self.bean.transform, 0.82, 0.82);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.2 animations:^{
            self.bean.transform = CGAffineTransformScale(self.bean.transform, 1.11, 1.11);
        }];

        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.2 animations:^{
            self.bean.transform = CGAffineTransformScale(self.bean.transform, 0.9, 0.9);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.6 animations:^{
            self.bean.transform = CGAffineTransformScale(self.bean.transform, 0.75, 0.75);
            self.bean.transform = CGAffineTransformTranslate(self.bean.transform, -30, 0);
            self.Bg.frame= CGRectMake(self.Bg.frame.origin.x-_width, self.Bg.frame.origin.y, self.Bg.frame.size.width, self.Bg.frame.size.height);
        }];
        
    } completion:^(BOOL finished) {
        if (completeBlock) {
            completeBlock();
        }
    }];
}

#pragma mark - private

- (UIImageView *)createImageView:(NSString *)name frame:(CGRect)frame{
    UIImage *image = [UIImage imageNamed:name];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = image;
    return imageView;
}

@end
