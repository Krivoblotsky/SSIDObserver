//
//  APSSIDInfoProvider.m
//  Sid
//
//  Created by Sergii Kryvoblotskyi on 3/3/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APSSIDInfoProvider.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "APSSIDModel.h"

@implementation APSSIDInfoProvider

#pragma mark - Public

- (APSSIDModel *)currentServiceInfo
{
    APSSIDModel *ssidModel = [self obtainSessionInfo];
    return ssidModel;
}

#pragma mark - Private

- (APSSIDModel *)obtainSessionInfo
{
    CFArrayRef supportedInterfaces = CNCopySupportedInterfaces();
    
    /* Cannot find active network cards */
    if (supportedInterfaces == NULL || CFArrayGetCount(supportedInterfaces) == 0) {
        if (supportedInterfaces) CFRelease(supportedInterfaces);
        return nil;
    }
    CFDictionaryRef interface = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(supportedInterfaces, 0));
    NSDictionary *ssidInfo = (__bridge NSDictionary*)interface;
    if (interface) CFRelease(interface);
    if (supportedInterfaces) CFRelease(supportedInterfaces);
    
    /* Cannot find SSID */
    if (!ssidInfo) {
        return nil;
    }
    return [APSSIDModel modelWithDictionary:ssidInfo];
}

@end
