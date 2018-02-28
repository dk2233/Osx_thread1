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
    
    
    MyClass_thread  *thread_instance = [[MyClass_thread alloc] init];
    @autoreleasepool {
        
        NSLog(@"Hello, World of threads!");
              
        while(1){
            
            dispatch_main();
        }
        
    }
    return 0;
}
