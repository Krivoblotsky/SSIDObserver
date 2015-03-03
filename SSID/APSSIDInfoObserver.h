//
//  APSSIDInfoObserver.h
//  Sid
//
//  Created by Sergii Kryvoblotskyi on 3/3/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APSSIDModel.h"

typedef void(^APSSIDInfoObserverSSIDChangeBlock)(APSSIDModel *model);

@interface APSSIDInfoObserver : NSObject

/**
 *  Starts ssid change observation
 */
- (void)startObserving;

/**
 *  Stops ssid observation
 */
- (void)stopObserving;

/**
 *  Represents current ssid
 */
@property (nonatomic, strong, readonly) APSSIDModel *currentSSID;

/**
 *  Block represents ssid chage
 */
@property (nonatomic, copy) APSSIDInfoObserverSSIDChangeBlock SSIDChangedBlock;

@end
