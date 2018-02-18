//
//  thread.m
//  Os_thread1
//
//  Created by daniel on 18.02.2018.
//  Copyright © 2018 code masterss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "thread.h"


@implementation  MyClass_thread


-(id)init{
    
    [NSThread detachNewThreadSelector:@selector(WriteSthg) toTarget:self withObject:self];
    

    
    return self;
    
}
-(void)WriteSthg{
    
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"hello");
    
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)5.0]];
    
    
    NSLog(@"hello2");
    //[NSThread exit];
    //[pool realese];
}

@end

