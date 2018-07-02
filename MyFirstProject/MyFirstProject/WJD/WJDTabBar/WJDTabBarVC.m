//
//  WJDTabBarVC.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/8.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDTabBarVC.h"
#import "WJDNavigationVC.h"
#import "WJDBaseViewController.h"
#import "WJDReflection.h"
@interface WJDTabBarVC ()
/**
 *  控制器数组
 */
@property (nonatomic, strong) NSArray *vcArray;
/**
 *  tabBar title数组
 */
@property (nonatomic, strong) NSArray *tabBarTitleArray;
/**
 *  tabBar icon数组
 */
@property (nonatomic, strong) NSArray *tabBarIconArray;
@end

@implementation WJDTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllers = self.vcArray;
    for (NSInteger i = 0; i < self.vcArray.count; i++) {
        self.tabBar.items[i].title = self.tabBarTitleArray[i];
        self.tabBar.items[i].image = [UIImage imageNamed:self.tabBarIconArray[i]];
    }
}
#pragma mark - getter
- (NSArray *)vcArray {
    if (!_vcArray) {
        NSArray *vcNameArray = @[@"WJDBaseViewController",@"WJDBaseViewController",@"WJDBaseViewController",@"WJDBaseViewController"];
        NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithCapacity:vcNameArray.count];
        for (NSInteger i = 0; i < vcNameArray.count; i++) {// getDefaultObjectWithClassName: MethodName: Argument:nil
            UIViewController *vc = [WJDReflection executeWithClassName:vcNameArray[i] MethodName:@"init" Argument:nil];
            UINavigationController *nav = [WJDReflection executeWithClassName:@"WJDNavigationVC" MethodName:@"initWithRootViewController:" Argument:@[vc]];
            [mutableArray addObject:nav];
        }
        _vcArray = mutableArray.copy;
    }
    return _vcArray;
}
- (NSArray *)tabBarIconArray {
    if (!_tabBarIconArray) {
        _tabBarIconArray = @[];
    }
    return _tabBarIconArray;
}
- (NSArray *)tabBarTitleArray {
    if (!_tabBarTitleArray) {
        _tabBarTitleArray = @[@"消息",@"联系人",@"看点",@"动态"];
    }
    return _tabBarTitleArray;
}
#pragma mark - UITabBarControllerDelegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
