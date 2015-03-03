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

###License:
The MIT License (MIT)

Copyright (c) 2015 Serg Krivoblotsky

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
