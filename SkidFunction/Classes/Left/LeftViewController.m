//
//  LeftViewController.m
//  SkidFunction
//
//  Created by zhifu360 on 2018/11/14.
//  Copyright © 2018 ZZJ. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *hideBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 100)/2, (self.view.bounds.size.height - 60)/2, 100, 60)];
    [hideBtn setTitle:@"Hide" forState:UIControlStateNormal];
    [hideBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    hideBtn.backgroundColor = [UIColor lightGrayColor];
    [hideBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hideBtn];
    
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%256)/255.0f green:(arc4random()%256)/255.0f  blue:(arc4random()%256)/255.0f  alpha:1.0f];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)hide {
    
    if (_hideBlock) {
        _hideBlock();
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
