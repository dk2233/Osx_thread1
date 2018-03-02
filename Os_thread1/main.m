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
    
    
    @autoreleasepool {
        MyClass_thread  *thread_instance = [[MyClass_thread alloc] init];
        
        NSLog(@"Hello, World of threads! - he");
              
        //while(thread_instance.seconds < (HOW_LONG_SECOND-1) )
        //{
            
        dispatch_main();
                        
        //}
        //dispatch_wait(, <#timeout#>)
        NSLog(@"\n finish \n ");
        dispatch_suspend(thread_instance.MyQueue);
        //dispatch_q
        return 0;
    }
}
