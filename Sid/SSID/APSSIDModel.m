//
//  APSSIDModel.m
//  Sid
//
//  Created by Sergii Kryvoblotskyi on 3/3/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APSSIDModel.h"

static NSString * const APSSIDModelBSSIDKey = @"BSSID";
static NSString * const APSSIDModelSSID     = @"SSID";
static NSString * const APSSIDModelSSIDData = @"SSIDDATA";

@implementation APSSIDModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary
{
    NSString *bssid = dictionary[APSSIDModelBSSIDKey];
    NSString *ssid = dictionary[APSSIDModelSSID];
    NSData *ssidData = dictionary[APSSIDModelSSIDData];
    return [self modelWithBSSID:bssid ssid:ssid ssidData:ssidData];
}

+ (instancetype)modelWithBSSID:(NSString *)bssid ssid:(NSString *)ssid ssidData:(NSData *)ssidData
{
    return [[self alloc] initWithBSSID:bssid ssid:ssid ssidData:ssidData];
}

- (instancetype)initWithBSSID:(NSString *)bssid ssid:(NSString *)ssid ssidData:(NSData *)ssidData
{
    self = [super init];
    if (self) {
        _bssid = bssid;
        _ssid = ssid;
        _ssidData = ssidData;
    }
    return self;
}

- (BOOL)isEqual:(APSSIDModel *)object
{
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    return [self.ssid isEqualToString:object.ssid];
}

- (NSUInteger)hash
{
    return [self.ssid hash];
}

@end
