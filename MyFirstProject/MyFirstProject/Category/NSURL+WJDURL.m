//
//  NSURL+WJDURL.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/12.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "NSURL+WJDURL.h"
#import <objc/runtime.h>

@implementation NSURL (WJDURL)

+ (void)load {
    Method systemMethod = class_getClassMethod(self, @selector(URLWithString:));
    Method replaceMethod = class_getClassMethod(self, @selector(WJD_URLWithString:));
    method_exchangeImplementations(systemMethod, replaceMethod);
}
+ (instancetype)WJD_URLWithString:(NSString *)urlString {
    NSURL *url = [NSURL WJD_URLWithString:urlString];
    if (!url && ![urlString isEqualToString:@""] && [urlString hasPrefix:@"http"]) {
        url = [NSURL WJD_URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    return url;
}

@end
