//
//  UIView+Frame.h
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/8.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_SIZE             [[UIScreen mainScreen] bounds].size
#define SCREEN_WIDTH            [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT           [[UIScreen mainScreen] bounds].size.height

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign, readonly) CGFloat maxX;
@property (nonatomic, assign, readonly) CGFloat maxY;

@end
