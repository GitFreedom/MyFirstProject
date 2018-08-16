//
//  WJDReflection.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/11.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDReflection.h"
#import <objc/message.h>
#import "CommonHeader.h"

@implementation WJDReflection

Singleton_imp(WJDReflection)

+ (id)excuteWithObject:(NSObject *)obj MethodName:(NSString *)methodName Argument:(NSArray *)args {
    
    id (*action)(id, SEL, id) = (id (*) (id, SEL, id)) objc_msgSend;
    return action(obj, sel_registerName([methodName UTF8String]),[args firstObject]);
}

+ (id)excuteWithClass:(Class)class MethodName:(NSString *)methodName Argument:(NSArray *)args {
    
    id (*action)(id, SEL, id) = (id (*) (id, SEL, id)) objc_msgSend;
    return action(class, sel_registerName([methodName UTF8String]),[args firstObject]);
}

+ (id)executeWithClassName:(NSString *)className MethodName:(NSString *)methodName Argument:(NSArray *)args {
    
    id (*action)(id, SEL, ...) = (id (*) (id, SEL, ...)) objc_msgSend;
    id obj = action(objc_getClass([className UTF8String]),sel_registerName("alloc"),nil);
    return action(obj,sel_registerName([methodName UTF8String]),[args firstObject]);
}
@end
