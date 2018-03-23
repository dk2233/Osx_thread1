//
//  DataViewController.m
//  iphone_dispatch
//
//  Created by daniel on 14.03.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import "DataViewController.h"
#import "thread.h"

@interface DataViewController ()




@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    [self.text1 setText:@"aaaaa...."];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}


@end
