# SSIDObserver

Nightly built Wi-Fi network SSID observer. 
Its all about PUBLIC API built on top of native "SystemConfiguration" framework. Basically it calls CNCopySupportedInterfaces() and takes "en0" network adaptor information. Observer is just polling network info once a time interval.

Usage:
```objc
    self.observer = [APSSIDInfoObserver new];

    __weak __typeof(self) weakSelf = self;
    [self.observer setSSIDChangedBlock:^(APSSIDModel *model){
        if (model) {
            weakSelf.networkStatusLabel.text = [NSString stringWithFormat:@"Network is: %@", model.ssid];
        } else {
            weakSelf.networkStatusLabel.text = @"Cannot find wifi network";
        }
    }];
    [self.observer startObserving];
```

APSSIDModel properties:

```objc
/**
 *  Represents Basic Service Set Identification
 */
@property (nonatomic, copy, readonly) NSString *bssid;

/**
 *  Reprsents Service Set Identification a.k.a Wi-Fi Name
 */
@property (nonatomic, copy, readonly) NSString *ssid;

/**
 *  Represents HEX representation of SSID
 */
@property (nonatomic, copy, readonly) NSData *ssidData;
```

One more thing. You can use APSSIDInfoProvider if you don't need for observation, but just want to obtain current network info.

```objc
- (APSSIDModel *)currentServiceInfo;
```

###TODO:

1. OS X Support. I didn't test it on OS X platform, but I suppose it will just take "en0" information.

###Contribution:

Feel free to open issues and pull requests. Or email me krivoblotsky@me.com
