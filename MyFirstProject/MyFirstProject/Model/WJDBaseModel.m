//
//  WJDBaseModel.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/11.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDBaseModel.h"
#import <objc/runtime.h>

@implementation WJDBaseModel

- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar *list = class_copyIvarList(self.class, &count);
    for (int i = 0; i<count; i++) {
        Ivar var = list[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(var)];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(list);
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar *list = class_copyIvarList(self.class, &count);
        for (int i = 0; i<count; i++) {
            Ivar var = list[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(var)];
            [self setValue:[coder decodeObjectForKey:key] forKey:key];
        }
        free(list);
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone {
    
    id copyObject = [[[self class] allocWithZone:zone] init];
    if (copyObject) {
        unsigned int count = 0;
        Ivar *list = class_copyIvarList(self.class, &count);
        for (int i = 0; i < count; i++) {
            Ivar var = list[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(var)];
            id value = [self valueForKey:key];
            if ([value respondsToSelector:@selector(copyWithZone:)]) {
                [copyObject setValue:[[self valueForKey:key] copy] forKey:key];
            }
            else {
                [copyObject setValue:[self valueForKey:key] forKey:key];
            }
        }
        free(list);
    }
    return copyObject;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    
    id mutableCopyObject = [[[self class] allocWithZone:zone] init];
    if (mutableCopyObject) {
        unsigned int count = 0;
        Ivar *list = class_copyIvarList(self.class, &count);
        for (int i = 0 ; i < count; i++) {
            Ivar var = list[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(var)];
            id value = [self valueForKey:key];
            if ([value respondsToSelector:@selector(mutableCopyWithZone:)]) {
                [mutableCopyObject setValue:[value mutableCopy] forKey:key];
            }
            else {
                [mutableCopyObject setValue:value forKey:key];
            }
        }
        free(list);
    }
    return mutableCopyObject;
}
//调用过程中没实现的方法会在这里面处理
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    class_addMethod(self, sel, (IMP)commonVoidMethod, "v@:");
    return [super resolveInstanceMethod:sel];
}
+ (BOOL)resolveClassMethod:(SEL)sel {
    
    class_addMethod([self class], sel, (IMP)commonVoidMethod, "v@:");
    return [super resolveClassMethod:sel];
}
void commonVoidMethod (id self, SEL _cmd, NSString *obj) {
    
}

@end
