//
//  WJDNavigationItem.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/7/4.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDNavigationItem.h"

@implementation WJDNavigationItem

- (void)setTitle:(NSString *)title {
    _title = title;
    if (_title) {
        [self resetAttributeTitle];
    }
}
- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    if (_titleFont) {
        [self resetAttributeTitle];
    }
}
- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    if (_titleColor) {
        [self resetAttributeTitle];
    }
}
- (void)resetAttributeTitle {
    if (!_title) {
        return;
    }
    NSMutableDictionary *titleDict = [NSMutableDictionary dictionary];
    if (_titleFont) {
        [titleDict setObject:_titleFont forKey:NSFontAttributeName];
    }
    if (_titleColor) {
        [titleDict setObject:_titleColor forKey:NSForegroundColorAttributeName];
    }
    _attriTitle = [[NSAttributedString alloc]initWithString:_title attributes:titleDict];
}
@end
