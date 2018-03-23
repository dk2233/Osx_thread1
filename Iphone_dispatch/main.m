//
//  main.m
//  iphone_dispatch
//
//  Created by daniel on 14.03.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "thread.h"

int main(int argc, char * argv[]) {
    
    
    
    @autoreleasepool {
        
        MyClass_thread_ios  *thread_instance = [[MyClass_thread_ios alloc] init];
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
