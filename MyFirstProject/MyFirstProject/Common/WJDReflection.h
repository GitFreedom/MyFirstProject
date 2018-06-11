//
//  WJDReflection.h
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/11.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJDReflection : NSObject

+ (id)excuteWithClass:(Class)class MethodName:(NSString *)methodName Argument:(NSArray *)args;

+ (id)executeWithClassName:(NSString *)className MethodName:(NSString *)methodName Argument:(NSArray *)args;

@end
