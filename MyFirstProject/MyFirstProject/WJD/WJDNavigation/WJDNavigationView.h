//
//  WJDNavigationView.h
//  MyFirstProject
//
//  Created by 王俊东 on 2018/7/4.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJDNavigationItem.h"

typedef NS_ENUM(NSInteger, WJDNavigationViewArrayType) {
    WJDNavigationViewArrayType_left = 100,//左边数组
    WJDNavigationViewArrayType_middle,//中间数组
    WJDNavigationViewArrayType_right//右边数组
};
typedef NS_ENUM(NSInteger, WJDNavigationViewArrayUpdateType) {
    WJDNavigationViewArrayUpdateType_add,//添加
    WJDNavigationViewArrayUpdateType_remove,//移除
    WJDNavigationViewArrayUpdateType_modify,//修改
};

@interface WJDNavigationView : UIView

/**
 *  左边item数组
 */
@property (nonatomic, strong) NSArray<WJDNavigationItem *> *leftItemsArray;
/**
 *  中间item数组
 */
@property (nonatomic, strong) NSArray<WJDNavigationItem *> *middleItemsArray;
/**
 *  右边item数组
 */
@property (nonatomic, strong) NSArray<WJDNavigationItem *> *rightItemsArray;
/**
 *  更新item
 *  index：更新item的位置 (小于零的时候更新最后一个item)
 *  item：更新的item WJDNavigationViewArrayUpdateType为WJDNavigationViewArrayUpdateType_add不能为空
 *  arrayType：要更新哪个位置的数组
 *  UpdateType：更新的类型
 */
- (void)updateItemAtIndex:(NSInteger)index Item:(WJDNavigationItem *)item ArrayType:(WJDNavigationViewArrayType)arrayType UpdateType:(WJDNavigationViewArrayUpdateType)updateType;

@end
