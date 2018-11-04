//
//  WJDWaterfallLayout.h
//  MyFirstProject
//
//  Created by 王俊东 on 2018/11/4.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WJDWaterfallLayout;
@protocol WJDWaterfallLayoutDelegate <NSObject>

@required
- (CGFloat)waterfallLayout:(WJDWaterfallLayout *)layout itemHeightWithIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@end

@interface WJDWaterfallLayout : UICollectionViewLayout

/**
 *  列数
 */
@property (nonatomic, assign) NSInteger    columnCount;
/**
 *  行间距
 */
@property (nonatomic, assign) CGFloat      rowMargin;
/**
 *  列间距
 */
@property (nonatomic, assign) CGFloat      columnMargin;
/**
 *  UICollectionView的insets
 */
@property (nonatomic, assign) UIEdgeInsets contentInsets;
/**
 *  代理
 */
@property (nonatomic, weak  ) id<WJDWaterfallLayoutDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
