//
//  WJDBaseViewController.h
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/8.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJDNavigationView.h"

@interface WJDBaseViewController : UIViewController

/**
 *  导航栏
 */
@property (nonatomic, strong) WJDNavigationView *navigationView;
/**
 *  隐藏导航栏
 */
@property (nonatomic, assign) BOOL hiddenNavigation;

@end
