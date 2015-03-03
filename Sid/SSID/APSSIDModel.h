//
//  APSSIDModel.h
//  Sid
//
//  Created by Sergii Kryvoblotskyi on 3/3/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APSSIDModel : NSObject

/**
 *  Instantiates SSIDModel. Immutable.
 *
 *  @param bssid    NSString
 *  @param ssid     NSString
 *  @param ssidData NSString
 *
 *  @return APSSIDModel instance
 */
+ (instancetype)modelWithBSSID:(NSString *)bssid ssid:(NSString *)ssid ssidData:(NSData *)ssidData;

/**
 *  Instantiates model with given dictionary.
 *
 *  @param dictionary NSDictionary. Should contain BSSID, SSID and SSIDDATA keys
 *
 *  @return APSSIDModel instance
 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

/**
 *  Instantiates SSIDModel. Designated.
 *
 *  @param bssid    NSString
 *  @param ssid     NSString
 *  @param ssidData NSData
 *
 *  @return APSSIDModel
 */
- (instancetype)initWithBSSID:(NSString *)bssid ssid:(NSString *)ssid ssidData:(NSData *)ssidData NS_DESIGNATED_INITIALIZER;

/**
 *  Represents Basic Service Set Identification
 */
@property (nonatomic, copy, readonly) NSString *bssid;

/**
 *  Reprsents Service Set Identification
 */
@property (nonatomic, copy, readonly) NSString *ssid;

/**
 *  Represents HEX representation of SSID
 */
@property (nonatomic, copy, readonly) NSData *ssidData;

@end

@interface APSSIDModel (Unavaliable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
