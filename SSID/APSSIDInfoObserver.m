//
//  APSSIDInfoObserver.m
//  Sid
//
//  Created by Sergii Kryvoblotskyi on 3/3/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APSSIDInfoObserver.h"
#import "APSSIDInfoProvider.h"

@interface APSSIDInfoObserver ()

/**
 *  Info provider.
 */
@property (nonatomic, strong) APSSIDInfoProvider *ssidInfoProvider;

/**
 *  Observation timer
 */
@property (nonatomic ,strong) NSTimer *observationTimer;

@end

@implementation APSSIDInfoObserver

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ssidInfoProvider = [APSSIDInfoProvider new];
    }
    return self;
}

- (void)dealloc
{
    [self uncheduleSSIDCheck];
}

#pragma mark -
#pragma mark - Public
#pragma mark -

- (void)startObserving
{
    [self obtainServiceInfo];
    [self scheduleSSIDCheck];
}

- (void)stopObserving
{
    [self uncheduleSSIDCheck];
}

#pragma mark -
#pragma mark - Private
#pragma mark -

#pragma mark - System info

- (void)obtainServiceInfo
{
    APSSIDModel *model = [self.ssidInfoProvider currentServiceInfo];
    if (![model isEqual:_currentSSID]) {
        _currentSSID = model;
        [self notifySSIDChangedSafely];
    }
}

#pragma mark - Timer

- (void)scheduleSSIDCheck
{
    self.observationTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f
                                                             target:self
                                                           selector:@selector(obtainServiceInfo)
                                                           userInfo:nil
                                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.observationTimer forMode:NSRunLoopCommonModes];
}

- (void)uncheduleSSIDCheck
{
    [self.observationTimer invalidate];
    self.observationTimer = nil;
}

#pragma mark - Block Invocation

- (void)notifySSIDChangedSafely
{
    if (self.SSIDChangedBlock) {
        self.SSIDChangedBlock(self.currentSSID);
    }
}

@end
