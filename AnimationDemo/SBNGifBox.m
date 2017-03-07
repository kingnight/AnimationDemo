//
//  SBNGifBox.m
//  AnimationDemo
//
//  Created by jinkai on 17/3/2.
//  Copyright © 2017年 jinkai. All rights reserved.
//

#import "SBNGifBox.h"

#define RATIO  1

#define BOX_W 129*0.4
#define BOX_H 130*0.4

#define TITLE_W 98
#define TITLE_H 20

#define FONT_W 157*0.53
#define FONT_H 70*0.53

@interface SBNGifBox ()

@property (nonatomic,strong) UIImageView *box;
@property (nonatomic,strong) UIImageView *title;
@property (nonatomic,strong) UIImageView *font;
@property (nonatomic,strong) UIImageView *light;
@property (nonatomic,strong) UIImageView *pattern;

@property (nonatomic,assign) NSUInteger width;
@property (nonatomic,assign) NSUInteger height;
@end


@implementation SBNGifBox

- (instancetype)initWithFrame:(CGRect)frame{
    _width  = 129*RATIO;
    _height = 163*RATIO;
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, _width, _height)];
    if (self) {
        _light = [self createImageView:@"light" frame:CGRectMake(0, 0, _width, _height-33)];
        [self addSubview:_light];
        _light.alpha = 0.0;
        
        _box = [self createImageView:@"box" frame:CGRectMake([self postionX:BOX_W], [self postionY:BOX_H], BOX_W, BOX_H)];
        [self addSubview:_box];
        _box.alpha = 0.0;
        
        _title = [self createImageView:@"title" frame:CGRectMake([self postionX:TITLE_W], _height-TITLE_H, TITLE_W, TITLE_H)];
        [self addSubview:_title];
        _title.alpha = 0.0;
        
        _pattern = [self createImageView:@"pattern" frame:CGRectMake(0, 0, 148, 47)];
        [self addSubview:_pattern];
        _pattern.alpha = 0.0;
        
        _font = [self createImageView:@"font" frame:CGRectMake([self postionX:FONT_W], [self postionY:FONT_H], FONT_W, FONT_H)];
        [self addSubview:_font];
        _font.alpha = 0.0;
    }
    return self;
}

- (void)startAnimationWithCompleteBlock:(void (^)())completeBlock{
    [UIView animateKeyframesWithDuration:1.0 delay:0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.8 animations:^{
            self.box.transform = CGAffineTransformScale(self.box.transform, 2, 2);
            self.box.alpha = 1;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:1.0 relativeDuration:0.3 animations:^{
            self.font.transform = CGAffineTransformScale(self.font.transform, 2, 2);
            self.font.alpha = 1;
            
            self.box.transform = CGAffineTransformScale(self.box.transform, 0.86, 0.86);
            
            self.light.alpha =1;
            
            self.pattern.alpha = 1;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:1.3 relativeDuration:0.3 animations:^{
            self.font.transform = CGAffineTransformScale(self.font.transform, 0.74, 0.74);
            self.font.alpha = 0.9;
            
            self.box.transform = CGAffineTransformScale(self.box.transform, 1.14, 1.14);
            self.pattern.alpha = 0;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:1.6 relativeDuration:0.4 animations:^{
            self.font.transform = CGAffineTransformScale(self.font.transform, 1.05, 1.05);
            self.title.alpha = 1;
            self.pattern.alpha = 1;
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

- (NSInteger)postionX:(NSInteger)num{
    return (_width-num)/2;
}

- (NSInteger)postionY:(NSInteger)num{
    return (_height-num)/2-13;
}



@end
