//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Albert Carter on 2/19/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"


@interface BNRDrawViewController ()

@end

@implementation BNRDrawViewController

- (void) loadView {
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
