//
//  main.m
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "thread.h"


int main(int argc, const char * argv[]) {
    
    
    MyClass_thread  *woteczki = [[MyClass_thread alloc] init];
    double delayInSeconds = 5.0;
    
    int nr_int = 0U;
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World of threads!");
        
        while(1){
            //NSLog(@"aaa %d",nr_int);
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                //NSLog(@"aaa %d",nr_int);
                NSLog(@"aaa");
            });
            //printf(" seconds %d",nr_int);
            nr_int++;
             
        }
        
    }
    return 0;
}
