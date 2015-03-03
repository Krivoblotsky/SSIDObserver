# SSIDObserver

Wi-Fi network SSID observer. 

```objc
    self.observer = [APSSIDInfoObserver new];

    __weak __typeof(self) weakSelf = self;
    [self.observer setSsidChangedBlock:^(APSSIDModel *model){
        if (model) {
            weakSelf.networkStatusLabel.text = [NSString stringWithFormat:@"Network is: %@", model.ssid];
        } else {
            weakSelf.networkStatusLabel.text = @"Cannot find wifi network";
        }
    }];
    [self.observer startObserving];
```

# Screenshot:
<img width=320 src="https://dl.dropboxusercontent.com/u/11819370/IMG_3333.PNG">
