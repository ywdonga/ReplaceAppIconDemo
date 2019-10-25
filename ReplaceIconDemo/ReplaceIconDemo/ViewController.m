//
//  ViewController.m
//  ReplaceIconDemo
//
//  Created by Dyw on 2019/10/25.
//  Copyright © 2019 amez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 10.3, *)) {
        NSString *iconName = [UIApplication sharedApplication].alternateIconName;
        NSArray<NSString *> *strArray = [iconName componentsSeparatedByString:@"_"];
        if(strArray.count){
            self.segmented.selectedSegmentIndex = strArray.lastObject.integerValue;
        }
    }
}

- (IBAction)changedIcon:(UISegmentedControl *)sender {    
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
}

@end
