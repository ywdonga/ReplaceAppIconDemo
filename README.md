# ReplaceAppIconDemo
iOS10.3更换App图标
###效果：
![Jietu20191025-150526.gif](https://upload-images.jianshu.io/upload_images/1760826-38b6e0b1407bb275.gif?imageMogr2/auto-orient/strip)
###步骤：
#####1.确保`Assets.xcassets`内无任何图片
![15719850866178.jpg](https://upload-images.jianshu.io/upload_images/1760826-ad2baec723bdfdc1.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
#####2.将图标拖入项目中，不能使用`Assets.xcassets`，只能拖入项目。图片大小为60的2倍和3倍，即`@2x 120*120``@3x 180*180`
![15719852465125.jpg](https://upload-images.jianshu.io/upload_images/1760826-310181edc794ed90.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
#####3.配置`info.plist`，很容易出错，一定要仔细，怕出错可以复制下面的内容，然后替换下图片名称。
![15719858457694.jpg](https://upload-images.jianshu.io/upload_images/1760826-c3769df46534a687.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleAlternateIcons</key>
	<dict>
		<key>app_icon_0</key>
		<dict>
			<key>CFBundleIconFiles</key>
			<array>
				<string>app_icon_0</string>
			</array>
			<key>UIPrerenderedIcon</key>
			<false/>
		</dict>
		<key>app_icon_1</key>
		<dict>
			<key>CFBundleIconFiles</key>
			<array>
				<string>app_icon_1</string>
			</array>
			<key>UIPrerenderedIcon</key>
			<false/>
		</dict>
		<key>app_icon_2</key>
		<dict>
			<key>CFBundleIconFiles</key>
			<array>
				<string>app_icon_2</string>
			</array>
			<key>UIPrerenderedIcon</key>
			<false/>
		</dict>
		<key>app_icon_3</key>
		<dict>
			<key>CFBundleIconFiles</key>
			<array>
				<string>app_icon_3</string>
			</array>
			<key>UIPrerenderedIcon</key>
			<false/>
		</dict>
	</dict>
	<key>CFBundlePrimaryIcon</key>
	<dict>
		<key>CFBundleIconFiles</key>
		<array>
			<string>app_icon_0</string>
		</array>
		<key>UIPrerenderedIcon</key>
		<false/>
	</dict>
	<key>UINewsstandIcon</key>
	<dict>
		<key>CFBundleIconFiles</key>
		<array>
			<string>app_icon_0</string>
		</array>
		<key>UINewsstandBindingEdge</key>
		<string>UINewsstandBindingEdgeLeft</string>
		<key>UINewsstandBindingType</key>
		<string>UINewsstandBindingTypeMagazine</string>
	</dict>
</dict>
</plist>
```
#####4.代码获取当前图标、更换图标
获取当前图标文件名
```
if (@available(iOS 10.3, *)) {
        NSString *iconName = [UIApplication sharedApplication].alternateIconName;
    }
```
更换图标
```
if (@available(iOS 10.3, *)) {
        if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
            return;
        }
        NSArray *weathers = @[@"app_icon_0", @"app_icon_1", @"app_icon_2", @"app_icon_3"];
        NSString *iconName = weathers[sender.selectedSegmentIndex];
        [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (!error) {
                return;
            }
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }];
    }
```
