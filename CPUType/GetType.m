//
//  GetType.m
//  CPUType
//
//  Created by BinWu on 10/2/15.
//  Copyright © 2015 BinWu. All rights reserved.
//

#import "GetType.h"
#include <sys/sysctl.h>
#include <sys/resource.h>
#include <sys/vm.h>
#include <dlfcn.h>
#import "MobileGestalt.h"


@implementation GetType

- (NSString *)uniqueDeviceID {
    static CFStringRef (*$MGCopyAnswer)(CFStringRef);
    void *gestalt = dlopen("/usr/lib/libMobileGestalt.dylib", RTLD_GLOBAL | RTLD_LAZY);
    $MGCopyAnswer = (dlsym(gestalt, "MGCopyAnswer"));
    //    CFStringRef SNumber = $MGCopyAnswer(CFSTR("SerialNumber"));
    return (__bridge NSString *)$MGCopyAnswer(CFSTR("UniqueDeviceID"));
}

- (NSString *)getCPUType{
    static CFStringRef (*$MGCopyAnswer)(CFStringRef);
    void *gestalt = dlopen("/usr/lib/libMobileGestalt.dylib", RTLD_GLOBAL | RTLD_LAZY);
    $MGCopyAnswer = (dlsym(gestalt, "MGCopyAnswer"));
    //    CFStringRef SNumber = $MGCopyAnswer(CFSTR("SerialNumber"));
    CFStringRef boardID = $MGCopyAnswer(CFSTR("HardwarePlatform"));
    
    if ([(__bridge NSString *)boardID isEqualToString:@"s8000"]) {
        return @"Samsung";
    }
    if ([(__bridge NSString *)boardID isEqualToString:@"s8003"]) {
        return @"TSMC";
    }
    return @"Unknow";
}

@end
