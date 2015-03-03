//
//  APSSIDInfoProvider.h
//  Sid
//
//  Created by Sergii Kryvoblotskyi on 3/3/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APSSIDModel;
@interface APSSIDInfoProvider : NSObject

/**
 *  Obtain serive info asyncrhonously
 *
 */
- (APSSIDModel *)currentServiceInfo;

@end
