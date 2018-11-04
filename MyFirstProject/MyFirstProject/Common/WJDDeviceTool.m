//
//  WJDDeviceTool.m
//  MyFirstProject
//
//  Created by 王俊东 on 2018/6/12.
//  Copyright © 2018年 www.wangjundong.com. All rights reserved.
//

#import "WJDDeviceTool.h"
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
    if ([infoDictionary objectForKey:@"CFBundleDisplayName"]) {
        return [infoDictionary objectForKey:@"CFBundleDisplayName"];
    }
    else {
        return [infoDictionary objectForKey:@"CFBundleName"];
    }
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
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
}

/**
 *  @brief:设备相关,取设备名称，return sample :iPhoneX
 */
+ (nonnull NSString *)getDeviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceName = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    if ([deviceName isEqualToString:@"i386"]) {
        deviceName = @"Simulator";
    }
    else if ([deviceName isEqualToString:@"x86_64"]) {
        deviceName = @"Simulator";
    }
    else if ([deviceName isEqualToString:@"iPhone1,1"]) {
        deviceName = @"";
    }
    else if ([deviceName isEqualToString:@"iPhone1,2"]) {
        deviceName = @"iPhone3G";
    }
    else if ([deviceName isEqualToString:@"iPhone2,1"]) {
        deviceName = @"iPhone3GS";
    }
    else if ([deviceName isEqualToString:@"iPhone3,1"]) {
        deviceName = @"iPhone4";
    }
    else if ([deviceName isEqualToString:@"iPhone3,2"]) {
        deviceName = @"iPhone4";
    }
    else if ([deviceName isEqualToString:@"iPhone4,1"]) {
        deviceName = @"iPhone4s";
    }
    else if ([deviceName isEqualToString:@"iPhone5,1"]) {
        deviceName = @"iPhone5";
    }
    else if ([deviceName isEqualToString:@"iPhone5,2"]) {
        deviceName = @"iPhone5";
    }
    else if ([deviceName isEqualToString:@"iPhone5,3"]) {
        deviceName = @"iPhone5c";
    }
    else if ([deviceName isEqualToString:@"iPhone5,4"]) {
        deviceName = @"iPhone5c";
    }
    else if ([deviceName isEqualToString:@"iPhone6,1"]) {
        deviceName = @"iPhone5s";
    }
    else if ([deviceName isEqualToString:@"iPhone6,2"]) {
        deviceName = @"iPhone5s";
    }
    else if ([deviceName isEqualToString:@"iPhone7,1"]) {
        deviceName = @"iPhone6Plus";
    }
    else if ([deviceName isEqualToString:@"iPhone7,2"]) {
        deviceName = @"iPhone6";
    }
    else if ([deviceName isEqualToString:@"iPhone8,1"]) {
        deviceName = @"iPhone6s";
    }
    else if ([deviceName isEqualToString:@"iPhone8,2"]) {
        deviceName = @"iPhone6sPlus";
    }
    else if ([deviceName isEqualToString:@"iPhone8,4"]) {
        deviceName = @"iPhoneSE";
    }
    else if ([deviceName isEqualToString:@"iPhone9,1"]) {
        deviceName = @"iPhone7";
    }
    else if ([deviceName isEqualToString:@"iPhone9,3"]) {
        deviceName = @"iPhone7";
    }
    else if ([deviceName isEqualToString:@"iPhone9,2"]) {
        deviceName = @"iPhone7Plus";
    }
    else if ([deviceName isEqualToString:@"iPhone9,4"]) {
        deviceName = @"iPhone7Plus";
    }
    else if ([deviceName isEqualToString:@"iPhone10,1"]) {
        deviceName = @"iPhone8";
    }
    else if ([deviceName isEqualToString:@"iPhone10,4"]) {
        deviceName = @"iPhone8";
    }
    else if ([deviceName isEqualToString:@"iPhone10,2"]) {
        deviceName = @"iPhone8Plus";
    }
    else if ([deviceName isEqualToString:@"iPhone10,5"]) {
        deviceName = @"iPhone8Plus";
    }
    else if ([deviceName isEqualToString:@"iPhone10,3"]) {
        deviceName = @"iPhoneX";
    }
    else if ([deviceName isEqualToString:@"iPhone10,6"]) {
        deviceName = @"iPhoneX";
    }
    return deviceName;
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
 *  @brief:返回状态栏的高度(竖屏的)
 *  @return:返回高度
 */
+ (CGFloat)statusBarHeight {
    
    return [WJDDeviceTool getScreenSize] >= ScreenSizeType_5_8_inch ? 44.0f : 20.0f;
}

/**
 *  @brief: 获取屏幕尺寸
 */
+ (WJDScreenSizeType)getScreenSize {
    
    unsigned short screenWidth  = (unsigned short)SCREEN_WIDTH;
    unsigned short screenHeight = (unsigned short)SCREEN_HEIGHT;
    switch (screenWidth) {
        case 320:
        {
            switch (screenHeight) {
                case 480:
                {
                    return ScreenSizeType_3_5_inch;
                }
                    break;
                case 568:
                {
                    return ScreenSizeType_4_0_inch;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 375:
        {
            switch (screenHeight) {
                case 667:
                {
                    return ScreenSizeType_4_7_inch;
                }
                    break;
                case 812:
                {
                    return ScreenSizeType_5_8_inch;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 414:
        {
            switch (screenHeight) {
                case 736:
                {
                    return ScreenSizeType_5_5_inch;
                }
                    break;
                case 896:
                {
                    return [UIScreen mainScreen].scale == 2 ? ScreenSizeType_6_1_inch : ScreenSizeType_6_5_inch;
                }
                    break;
                default:
                    break;
            }
            
        }
            break;
        default:
            break;
    }
    
    return ScreenSizeType_unknow;
}
/**
 *  @brief : bottom offset
 */
+ (CGFloat)bottomOffset {
    
    return [WJDDeviceTool getScreenSize] >= ScreenSizeType_5_8_inch ? 34.0f : 0.0f;
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
