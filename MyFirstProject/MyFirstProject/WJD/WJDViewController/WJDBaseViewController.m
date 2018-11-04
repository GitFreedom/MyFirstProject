//
//  WJDBaseViewController.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/8.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDBaseViewController.h"
#import "NSURL+WJDURL.h"
#import "WJDBaseModel.h"
#import "WJDReflection.h"
#import "WJDDeviceTool.h"

@interface WJDBaseViewController ()


@end

@implementation WJDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationView];
}
- (void)initNavigationView {
    if (!self.navigationView) {
        self.navigationView = [[WJDNavigationView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
        self.navigationView.backgroundColor = [UIColor whiteColor];
    }
    WJDNavigationItem *backItem = [[WJDNavigationItem alloc]init];
    backItem.style = WJDNavigationItemStyle_image;
    backItem.imageName = @"homeSearch_back";
    backItem.imageSize = CGSizeMake(24, 24);
    backItem.itemSize  = CGSizeMake(44, 44);
    self.navigationView.leftItemsArray = @[backItem];
    if (self.title) {
        WJDNavigationItem *titleItem = [[WJDNavigationItem alloc]init];
        titleItem.style = WJDNavigationItemStyle_title;
        titleItem.title = @"标题";
        titleItem.itemSize = CGSizeMake(self.view.frame.size.width, 44);
        self.navigationView.middleItemsArray = @[titleItem];
    }
    [self.view addSubview:self.navigationView];
}
#pragma mark - setter
- (void)setHiddenNavigation:(BOOL)hiddenNavigation {
    if (hiddenNavigation != self.hiddenNavigation) {
        self.hiddenNavigation = hiddenNavigation;
        if (self.hiddenNavigation) {
            [self.navigationView removeFromSuperview];
            self.navigationView = nil;
        }
        else {
            [self initNavigationView];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
