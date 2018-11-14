//
//  MainTabController.m
//  SkidFunction
//
//  Created by zhifu360 on 2018/11/14.
//  Copyright © 2018 ZZJ. All rights reserved.
//

#import "MainTabController.h"
#import "BaseNavigationViewController.h"

@interface MainTabController ()

@end

@implementation MainTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *vcTitles = @[@"Home",@"Profile"];
    NSMutableArray *vcNames = [NSMutableArray arrayWithArray:@[@"HomeViewController",@"ProfileViewController"]];
    
    [vcNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        Class vcFromClassName = NSClassFromString(obj);
        
        UIViewController *vc = [[vcFromClassName alloc] init];
        vc.title = vcTitles[idx];
        
        BaseNavigationViewController *vcNav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:vcTitles[idx] image:[UIImage new] selectedImage:[UIImage new]];
        vcNav.tabBarItem = item;
        
        [self addChildViewController:vcNav];
        
    }];
    
}

@end
