//
//  WJDNavigationItem.h
//  MyFirstProject
//
//  Created by 王俊东 on 2018/7/4.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WJDNavigationItemStyle) {
    WJDNavigationItemStyle_title = 1000,
    WJDNavigationItemStyle_image,
    WJDNavigationItemStyle_imageTitle,
    WJDNavigationItemStyle_titleImage
};
typedef void(^WJDNavigationItemAction)(void);

@interface WJDNavigationItem : NSObject
/**
 *  item距离上下左右边距
 */
@property (nonatomic, assign) UIEdgeInsets itemEdgeInset;
/**
 *  itemSize
 */
@property (nonatomic, assign) CGSize       itemSize;
/**
 *  标题大小
 */
@property (nonatomic, strong) UIFont       *titleFont;
/**
 *  标题颜色
 */
@property (nonatomic, strong) UIColor      *titleColor;
/**
 *  标题
 */
@property (nonatomic, copy  ) NSString     *title;
/**
 *  图片大小
 */
@property (nonatomic, assign) CGSize       imageSize;
/**
 *  图片
 */
@property (nonatomic, copy  ) NSString     *imageName;
/**
 *  样式
 */
@property (nonatomic, assign) WJDNavigationItemStyle   style;
/**
 *  标题和图片间隔
 */
@property (nonatomic, assign) CGFloat       titleImageMargin;
/**
 *  事件
 */
@property (nonatomic, copy  ) WJDNavigationItemAction  action;

/**
 *  富文本标题
 */
@property (nonatomic, copy  ) NSAttributedString       *attriTitle;

@end
