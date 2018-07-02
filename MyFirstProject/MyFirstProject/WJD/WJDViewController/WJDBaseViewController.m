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
    [WJDDeviceTool getAppName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
