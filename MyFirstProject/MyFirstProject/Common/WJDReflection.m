//
//  WJDReflection.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/11.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDReflection.h"
#import <objc/message.h>

@implementation WJDReflection

static WJDReflection  *_reflection = nil;

+ (instancetype)shareReflection {
    
    if (_reflection != nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _reflection = [[super allocWithZone:NULL] init];
        });
    }
    return _reflection;
}
+ (id) allocWithZone:(struct _NSZone *)zone {
    return [WJDReflection shareReflection];
}
- (id) copyWithZone:(struct _NSZone *)zone {
    return [WJDReflection shareReflection];
}

+ (id)excuteWithClass:(Class)class MethodName:(NSString *)methodName Argument:(NSArray *)args {
    
    return objc_msgSend(class, sel_registerName([methodName UTF8String]),[args firstObject]);
}

+ (id)executeWithClassName:(NSString *)className MethodName:(NSString *)methodName Argument:(NSArray *)args {
    
    id obj = objc_msgSend(objc_getClass([className UTF8String]), sel_registerName("alloc"));
    return objc_msgSend(obj,sel_registerName([methodName UTF8String]),[args firstObject]);
}

@end
