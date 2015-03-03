//
//  ViewController.m
//  Sid
//
//  Created by Sergii Kryvoblotskyi on 3/3/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "ViewController.h"
#import "APSSIDInfoObserver.h"

@interface ViewController ()

@property (nonatomic, strong) APSSIDInfoObserver *observer;
@property (weak, nonatomic) IBOutlet UILabel *networkStatusLabel;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _observer = [APSSIDInfoObserver new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak __typeof(self) weakSelf = self;
    [self.observer setSsidChangedBlock:^(APSSIDModel *model){
        if (model) {
            weakSelf.networkStatusLabel.text = [NSString stringWithFormat:@"Network is: %@", model.ssid];
        } else {
            weakSelf.networkStatusLabel.text = @"Cannot find wifi network";
        }
    }];
    [self.observer startObserving];
}

@end
