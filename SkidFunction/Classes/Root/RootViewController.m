//
//  RootViewController.m
//  SkidFunction
//
//  Created by zhifu360 on 2018/11/14.
//  Copyright © 2018 ZZJ. All rights reserved.
//

#import "RootViewController.h"
#import "BaseNavigationViewController.h"
#import "LeftViewController.h"
#import "HomeViewController.h"

const CGFloat spacing = 75.0f;

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface RootViewController ()

@property (nonatomic, strong) BaseNavigationViewController *rootVC;
@property (nonatomic, strong) LeftViewController *leftVC;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:self.leftVC];
    [self.view addSubview:self.leftVC.view];
    
    [self addChildViewController:self.rootVC];
    [self.view addSubview:self.rootVC.view];
    
    self.leftVC.view.frame = CGRectMake(spacing - SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.rootVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (void)showLeft {
    
    self.leftVC.view.frame = CGRectMake(spacing - SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.rootVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.leftVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.rootVC.view.frame = CGRectMake(SCREEN_WIDTH - spacing, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideLeft {
    
    self.leftVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.rootVC.view.frame = CGRectMake(SCREEN_WIDTH - spacing, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.leftVC.view.frame = CGRectMake(spacing - SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.rootVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - lazy
- (LeftViewController *)leftVC {
    if (!_leftVC) {
        _leftVC = [LeftViewController new];
        __weak typeof(self) weakSelf = self;
        _leftVC.hideBlock = ^{
            [weakSelf hideLeft];
        };
    }
    return _leftVC;
}

- (BaseNavigationViewController *)rootVC {
    if (!_rootVC) {
        HomeViewController *vc = [HomeViewController new];
        vc.title = @"Home";
        vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"showLeft" style:UIBarButtonItemStylePlain target:self action:@selector(showLeft)];
        _rootVC = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    }
    return _rootVC;
}

@end
