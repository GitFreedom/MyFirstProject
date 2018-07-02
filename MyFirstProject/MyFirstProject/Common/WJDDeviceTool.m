//
//  WJDDeviceTool.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/12.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDDeviceTool.h"
#import "CommonHeader.h"
#import <sys/utsname.h>

@interface WJDDeviceTool ()

@end

@implementation WJDDeviceTool

Singleton_imp(WJDDeviceTool)

/**
 *  @brief:app版本
 */
+ (nonnull NSString *)getAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

/**
 *  @brief:app名字
 */
+ (nonnull NSString *)getAppName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}


/**
 *  @brief:app构建版本
 */
+ (nonnull NSString *)getAppBuildInfo {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}


/**
 *  @brief:app版本target的名字
 */
+ (nonnull NSString *)getExecuteName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleExecutable"];
}


/**
 *  @brief:appbundle的信息
 */
+ (nonnull NSString *)getBundleId {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleIdentifier"];
}


/**
 *  @brief:设备相关,取设备os信息，return sample: iOS7.1
 */
+ (nonnull NSString *)getDeviceOS {
    UIDevice *device = [UIDevice currentDevice];
    return [NSString stringWithFormat:@"%@%@",device.systemName,device.systemVersion];
}


/**
 *  @brief:设备相关,取设备信息，return sample :iPhone5,1
 */
+ (nonnull NSString *)getDeviceModel {
    UIDevice *device = [UIDevice currentDevice];
    return device.model;
}


/**
 *  @brief:系统版本
 */
+ (CGFloat)systemVersion {
    UIDevice *device = [UIDevice currentDevice];
    return [device.systemVersion doubleValue];
}



/**
 *  @brief:运营商相关
 *  @param carrierName sim卡对应的运营商名称
 *  @param isoCC 国际标准化的国家字母缩写
 *  @param MCC 国家的数字代号
 *  @param MNC 移动网络的数字代号
 */
+ (void)getCarrierName:(NSString * _Nonnull * _Nonnull)carrierName
                 isoCC:(NSString * _Nonnull * _Nonnull)isoCC
                   MCC:(NSString * _Nonnull * _Nonnull)MCC
                   MNC:(NSString * _Nonnull * _Nonnull)MNC {
    
}


/**
 *  @brief:取得当前的ip地址.IPV4
 */
+ (nullable NSString *)getIPAddress {
    return @"";
}


/**
 *  @brief:取得当前的mac地址
 */
+ (nullable NSString *)getMacAddress {
    return @"";
}


/*
 @brief:设置存取取UUID的key,app启动期间仅仅执行一次
 @param uuidKey:UUID的key值,为空的情况下调用getBundleId
 */
+ (void)setUUIdKey:(nonnull NSString *)uuidKey {
    
}


/**
 *  @brief : 设置设备前缀
 */
+ (void)setUUIDPrefix:(NSString *)prefix {
    
}


/**
 *  @brief:设备相关,取设备的uuid
 */
+ (nonnull NSString *)getUUID {
    return @"";
}


/**
 *  @brief: 移除标识符
 */
+ (void)removeUUID {
    
}


/**
 *  @brief : 创建一个唯一标识字符串
 */
+ (nonnull NSString *)createUUID {
    return @"";
}


/**
 *  @brief: 基于设备的键值存储
 */
+ (void)setName:(nonnull NSString *)name value:(nonnull NSString *)value {
    
}


/**
 * @brief: 基于设备的键值存储
 */
+ (void)updateName:(nonnull NSString *)name value:(nonnull NSString *)value {
    
}


/**
 *  @brief: 取基于设备的键值存储
 */
+ (nullable NSString *)valueWithName:(nonnull NSString *)name {
    return @"";
}


/**
 *  @brief: 移除
 */
+ (void)removeName:(nonnull NSString *)name {
    
}


/**
 *  @brief:返回状态栏的高度
 *  @param orientation 方向
 *  @return:返回高度
 */
+ (CGFloat)statusBarHeightWithOrientation:(UIInterfaceOrientation)orientation {
    return 0;
}


/**
 *  @brief: 是否为3.5寸屏
 */
+ (BOOL)is3_5_inch {
    return YES;
}


/**
 *  @brief: 是否为4寸屏
 */
+ (BOOL)is4_0_inch {
    return YES;
}


/**
 *  @brief: 是否为4.7寸屏
 */
+ (BOOL)is4_7_inch {
    return YES;
}


/**
 *  @brief: 是否为5.5寸屏
 */
+ (BOOL)is5_5_inch {
    return YES;
}


/**
 *  @brief : 是否为5.8寸屏
 */
+ (BOOL)is5_8_inch {
    return YES;
}


/**
 *  @brief : bottom offset
 */
+ (CGFloat)bottomOffset {
    return 0;
}


/**
 *  @brief: 打开app
 */
+ (void)openAppWithAppId:(nonnull NSString *)appid {
    
}


/**
 *  @brief:计算给定路径的总字节数
 *  @param filePath 计算的路径
 *  @return:返回计算的字节总数
 */
+ (double)computeFileBytesInPath:(nonnull NSString *)filePath {
    return 0;
}


/**
 *  @brief:移除给定路径中的所有文件
 *  @param filePath 需要操作的绝对路径
 */
+ (void)removeAllFilesInPath:(nonnull NSString *)filePath {
    
}


/**
 *  @brief : 版本比较
 *  @param version : 版本号
 *  @param otherVersion : 版本号
 *  @return : 比较结果
 *              version > otherVesison => NSOrderedAscending
 *              version = otherVersion => NSorderedDescending
 *              version = otherVersion => NSOrderSame
 */
+ (NSComparisonResult)compareVersion:(NSString *)version otherVersion:(NSString *)otherVersion {
    return NSOrderedSame;
}


@end
