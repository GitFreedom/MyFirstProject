//
//  CommonHeader.h
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/8.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#import "UIView+Frame.h"

static CGFloat const CommonMargin = 15.0;
static CGFloat const CommonBigMargin = 20.0;
static CGFloat const CommonSmallMargin = 10.0;
static CGFloat const CommonLeastMargin = 5.0;
static CGFloat const CommonPadding = 10.0;
static CGFloat const CommonSmallPadding = 5.0;
static CGFloat const CommonFontSize = 13.0;
static CGFloat const CommonBigFontSize = 15.0;
static CGFloat const CommonSmallFontSize = 11.0;
static CGFloat const CommonItemButtonHeight = 30.0;
static CGFloat const CommonDefaultCellHeight = 48.0;
static CGFloat const CommonNavigationHeight = 48.0;


#define CommonBgGrayColor      [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]
#define CommonBgLightGrayColor [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]
#define CommonBlackColor       [UIColor colorWithRed: 51/255.0 green: 51/255.0 blue: 51/255.0 alpha:1.0]
#define CommonGrayColor        [UIColor colorWithRed:141/255.0 green:141/255.0 blue:141/255.0 alpha:1.0]
#define CommonLightGrayColor   [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]
#define CommonRedColor         [UIColor colorWithRed:255/255.0 green: 72/255.0 blue:  0/255.0 alpha:1.0]


typedef void(^CommonVoidBlock)(void);
typedef void(^CommonBoolBlock)(BOOL success);
typedef void(^CommonIndexBlock)(NSInteger index);
typedef void(^CommonObjectBlock)(id obj);

#endif /* CommonHeader_h */
