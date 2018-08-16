//
//  WJDNavigationView.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/7/4.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDNavigationView.h"

@interface WJDNavigationView ()
/**
 * <#解释#>
 */
@property (nonatomic, assign) CGRect leftRect;
/**
 * <#解释#>
 */
@property (nonatomic, assign) CGRect middleRect;
/**
 * <#解释#>
 */
@property (nonatomic, assign) CGRect rightRect;
@end

@implementation WJDNavigationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)tapAction:(UITapGestureRecognizer *)tap {
    CGPoint tapPoint = [tap locationInView:self];
    
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {
        return;
    }
    self.leftRect = [self drawItemWithContextRef:context OriginX:0 ItemArray:self.leftItemsArray];
    self.middleRect = [self drawItemWithContextRef:context OriginX:self.leftRect.origin.x ItemArray:self.middleItemsArray];
    self.rightRect = [self drawItemWithContextRef:context OriginX:self.middleRect.origin.x ItemArray:self.rightItemsArray];
    
    CGContextMoveToPoint(context, 0, rect.size.height - 0.5);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 0.5);
    CGContextSetLineWidth(context, 0.5);
    [[UIColor grayColor] set];
    CGContextStrokePath(context);
//    CGContextFillPath(context);
}
- (CGRect)drawItemWithContextRef:(CGContextRef)context OriginX:(CGFloat)originX ItemArray:(NSArray <WJDNavigationItem *> *)itemArray {
    CGFloat leftMaxX = originX;
    for (NSInteger i = 0; i < itemArray.count; i ++) {
        WJDNavigationItem *item = itemArray[i];
        CGFloat x = leftMaxX + item.itemEdgeInset.left;
        CGRect itemRect = CGRectMake(x, item.itemEdgeInset.top, item.itemSize.width, item.itemSize.height);
        switch (item.style) {
            case WJDNavigationItemStyle_title:
            {
                CGFloat x = itemRect.origin.x + (itemRect.size.width-item.attriTitle.size.width)*0.5;
                CGFloat y = itemRect.origin.y + (itemRect.size.height-item.attriTitle.size.height)*0.5;
                [item.attriTitle drawAtPoint:CGPointMake(x, y)];
            }
                break;
            case WJDNavigationItemStyle_image:
            {
                CGFloat x = itemRect.origin.x + (itemRect.size.width-item.imageSize.width)*0.5;
                CGFloat y = itemRect.origin.y + (itemRect.size.height-item.imageSize.height)*0.5;
                UIImage *image = [UIImage imageNamed:item.imageName];
                [image drawInRect:CGRectMake(x, y, item.imageSize.width, item.imageSize.height)];
            }
                break;
            case WJDNavigationItemStyle_imageTitle:
            {
                CGFloat imageX = itemRect.origin.x + (itemRect.size.width-item.attriTitle.size.width-item.titleImageMargin-item.imageSize.width)*0.5;
                CGFloat titleY = itemRect.origin.y + (itemRect.size.height-item.attriTitle.size.height)*0.5;
                CGFloat imageY = itemRect.origin.y + (itemRect.size.height-item.imageSize.height)*0.5;
                UIImage *image = [UIImage imageNamed:item.imageName];
                [image drawInRect:CGRectMake(imageX, imageY, item.imageSize.width, item.imageSize.height)];
                [item.attriTitle drawAtPoint:CGPointMake(imageX+item.titleImageMargin, titleY)];
            }
                break;
            case WJDNavigationItemStyle_titleImage:
            {
                CGFloat titleX = itemRect.origin.x + (itemRect.size.width-item.attriTitle.size.width-item.titleImageMargin-item.imageSize.width)*0.5;
                CGFloat titleY = itemRect.origin.y + (itemRect.size.height-item.attriTitle.size.height)*0.5;
                CGFloat imageY = itemRect.origin.y + (itemRect.size.height-item.imageSize.height)*0.5;
                UIImage *image = [UIImage imageNamed:item.imageName];
                [item.attriTitle drawAtPoint:CGPointMake(titleX, titleY)];
                [image drawInRect:CGRectMake(titleX+item.titleImageMargin, imageY, item.imageSize.width, item.imageSize.height)];
            }
                break;
            default:
                break;
        }
        leftMaxX += itemRect.size.width;
    }
    return CGRectMake(leftMaxX, 0, leftMaxX-originX, 0);
}
/**
 *  更新item
 *  index：更新item的位置
 *  item：更新的item WJDNavigationViewArrayUpdateType为WJDNavigationViewArrayUpdateType_add不能为空
 *  arrayType：要更新哪个位置的数组
 *  UpdateType：更新的类型
 */
- (void)updateItemAtIndex:(NSInteger)index Item:(WJDNavigationItem *)item ArrayType:(WJDNavigationViewArrayType)arrayType UpdateType:(WJDNavigationViewArrayUpdateType)updateType {
    switch (updateType) {
        case WJDNavigationViewArrayUpdateType_add:
        {
            NSArray *arr = [self getArrayWithArrayType:arrayType];
            index = [self fixIndex:index ArrayCount:arr.count];
            if (arr) {
                NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:arr];
                [mutableArray insertObject:item atIndex:index];
                arr = [mutableArray copy];
            }
        }
            break;
        case WJDNavigationViewArrayUpdateType_remove:
        {
            NSArray *arr = [self getArrayWithArrayType:arrayType];
            index = [self fixIndex:index ArrayCount:arr.count];
            if (arr) {
                NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:arr];
                [mutableArray removeObjectAtIndex:index];
                arr = [mutableArray copy];
            }
        }
            break;
        case WJDNavigationViewArrayUpdateType_modify:
        {
            if (item) {
                NSArray *arr = [self getArrayWithArrayType:arrayType];
                index = [self fixIndex:index ArrayCount:arr.count];
                if (arr) {
                    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:arr];
                    [mutableArray replaceObjectAtIndex:index withObject:item];
                    arr = [mutableArray copy];
                }
            }
        }
            break;
        default:
            break;
    }
}
- (NSArray *)getArrayWithArrayType:(WJDNavigationViewArrayType)arrayType {
    
    switch (arrayType) {
        case WJDNavigationViewArrayType_left:
            return self.leftItemsArray;
            break;
        case WJDNavigationViewArrayType_middle:
            return self.middleItemsArray;
            break;
        case WJDNavigationViewArrayType_right:
            return self.rightItemsArray;
            break;
        default:
            return nil;
            break;
    }
}
- (NSInteger)fixIndex:(NSInteger)index ArrayCount:(NSInteger)count {
    if (index < 0) {
        index = count-1;
    }
    if (index >= count) {
        index = count-1;
    }
    return index;
}
@end
